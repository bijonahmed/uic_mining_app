<?php

namespace App\Http\Controllers\Order;

use App\Http\Controllers\Controller;
use App\Models\Categorys;
use Illuminate\Http\Request;
use App\Models\Product;
//use Darryldecode\Cart\Cart;
use Illuminate\Support\Facades\Session;
use App\Models\Order;
use Validator;
use App\Models\OrderStatus;
use App\Models\OrderHistory;
use App\Models\Transfer;
use App\Models\ProductCategory;
use App\Models\CategoryCommissionHistory;
use App\Models\ExpenseHistory;
use App\Models\Mystore;
use App\Models\MystoreHistory;
use App\Models\Setting;
use App\Models\WishList;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Psy\Readline\Transient;

class OrderController extends Controller
{

    protected $userid;
    protected $email;
    public function __construct()
    {
        $this->middleware('auth:api');
        $id = auth('api')->user();
        if (!empty($id)) {
            $user = User::find($id->id);
            $this->userid = $user->id;
            $this->email = $user->email;
        }
    }

    public function deleteTobePaidStatusOrders($selectedcategoryId)
    {

        // Order::where('order_status', 1)->where('category_id',$selectedcategoryId)->delete();
        Order::where('order_status', 1)->where('category_id', $selectedcategoryId)->delete();
    }


    public function bulkOrderStatus(Request $request){

       // dd($request->all());
        $validator = Validator::make($request->all(), [
            'order_status'  => 'required',
            'id'            => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        $orderIds            = $request->id;
        $orderStatus         = $request->order_status;

        foreach ($orderIds as $ordersid) {
            Order::where('id', $ordersid)->update(['order_status' => $orderStatus]);
            //echo "Order ID: $ordersid status updated to $orderStatus <br>";
        }

        return response()->json("Order Status Sccessfully Update",200);


    }

    public function bulkOrderSend(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'user_ids'                => 'required',
            'selectedProductIDs'      => 'required',
            'selectedcategoryId'      => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user_ids                   = $request->user_ids;
        $selectedProduct            = $request->selectedProductIDs;
        $selectedcategoryId         = (int)$request->selectedcategoryId;
        $productIDsArray            = explode(',', $selectedProduct);
        $customTimeZone             = 'Asia/Dubai';
        $currentTime                = Carbon::now($customTimeZone);
        $startTime                  = Carbon::now($customTimeZone);
        $this->deleteTobePaidStatusOrders($selectedcategoryId);
        $currentTime->addHours(11);
        //$currentTime->addMinutes(2);
        // Format the datetime as needed
        $currentTimeFormatted       = $currentTime->format('Y-m-d H:i:s');

        foreach ($user_ids as $user_id) {
            //echo $user_id."<br>";
            foreach ($productIDsArray as $product) {
                //echo "usersID: $user_id, Products--$product<br>";
                $pro_row = Product::find($product);
                $pro_cat = ProductCategory::where('product_id', $pro_row->id)->first();
                Order::create([
                    'category_id'         => !empty($pro_cat->category_id) ? $pro_cat->category_id : "",
                    'product_id'          => $pro_row->id,
                    'product_name'        => $pro_row->name,
                    'selling_price'       => $pro_row->selling_price, ///$product['selling_price'],
                    'order_date'          => date("Y-m-d"),
                    'created_at'          =>  $startTime,
                    'order_inactive_time' =>  $currentTimeFormatted,
                    'profit'              => $pro_row->profit,
                    'user_id'             => $user_id, //$user['user_id'],
                    'orderId'             => $this->generateUniqueRandomNumber(),
                    'product_qty'         => 1,
                    'buying_price'        => $pro_row->buying_price, //$product['buying_price'],
                    'order_status'        => 1, //To be paid.
                    'order_type'          => 'System', //To be paid.
                    'update_by'           => $this->userid, //To be paid.
                    'thumnail_img'        => !empty($pro_row->thumbnail_img) ? url($pro_row->thumbnail_img) : "",
                ]);
            }
        }
    }

    public function checkOrderPrice(Request $request)
    {

        //dd($request->all());
        $id = (int)$request->id;
        $chkPoint = Order::where('id', $id)->select('buying_price', 'orderId')->first();
        $buying_price =  !empty($chkPoint->buying_price) ? $chkPoint->buying_price : 0;

        $response                   = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalance();
        $currentBalance             = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;

        if ($buying_price > $currentBalance) {
            // If balance is zero or negative, return an error message or perform another action
            $data['error']          = "Your balance is low. Please make depsoit";
            $data['error_status']   = 1;
        } else {
            $data['error']          = "Your balance is $currentBalance";
            $data['error_status']   = 0;
        }
        $data['order']              = $chkPoint;
        $data['balance']            = $currentBalance;
        return response()->json($data);
    }

    public function sendConfirmOrders(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'buying_price'  => 'required',
            'id'            => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $orderId = (int)$request->id;
        $chkPoint = Order::where('id', $orderId)->select('buying_price')->first();
        $buying_price =  !empty($chkPoint->buying_price) ? $chkPoint->buying_price : 0;

        $customTimeZone             = 'Asia/Dubai';
        $pay_confirm_time           = Carbon::now($customTimeZone);
        $goods_to_be_received_time  = $pay_confirm_time->copy()->addHours(30);
        $plt_process_time           = $pay_confirm_time->copy()->addHours(60);
        $shipped_time               = $pay_confirm_time->copy()->addHours(90);
        $complete_time              = $pay_confirm_time->copy()->addHours(120);
        // $goods_to_be_received_time  = $pay_confirm_time->copy()->addSeconds(30);
        // $plt_process_time           = $pay_confirm_time->copy()->addSeconds(60);
        // $shipped_time               = $pay_confirm_time->copy()->addSeconds(90);
        // $complete_time              = $pay_confirm_time->copy()->addSeconds(120);

        $response                   = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalance();
        $currentBalance             = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;
        //echo "Current Balance : $currentBalance , Buying Price : $buying_price";
        //exit;
        // Condition to check if current balance is zero or negative
        if ($buying_price > $currentBalance) {
            // If balance is zero or negative, return an error message or perform another action
            $data['error']          = "Your balance is low. Please make depsoit";
            $data['error_status']   = 1;
            return response()->json($data);
        } else {
            $updateOrder['order_status']                = 2; //To be confirmed
            $updateOrder['pay_confirm_time']            = $pay_confirm_time;
            $updateOrder['goods_to_be_received_time']   = $goods_to_be_received_time;
            $updateOrder['platform_proceed_Time']       = $plt_process_time;
            $updateOrder['to_be_shipped_time']          = $shipped_time;
            $updateOrder['complete_time']               = $complete_time;
            Order::where('id', $orderId)->update($updateOrder);

            $chkPendingOrderStatus = Order::where('user_id', $this->userid)->whereIn('order_status', [2, 3, 4, 5])->sum('buying_price');

            $expData['user_id']             =  $this->userid;
            $expData['operation_type']      =  "Confirm Order";
            $expData['operation_amount']    =  $buying_price;
            $expData['charge_description']  =  "Confirm OrderID: $orderId";
            $expData['operation_date']      =  date("Y-m-d");
            //dd($expData);
            ExpenseHistory::insertGetId($expData);

            $data['pendingOrders']  = number_format($chkPendingOrderStatus, 2);
            $data['currentBalance'] = number_format($currentBalance, 2);
            $data['error'] = "";
            $data['error_status'] = 0;
            return response()->json($data, 200);
        }
    }

    public function completeOrder(Request $request)
    {
        $searchByOrderId = $request->searchByOrderId;
        $order_status    = $request->order_status;;

        $getcurrentTime = date('Y-m-d H:i:s');
        $response       = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalance();
        $currentBalance = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;

        $query  = Order::where('user_id', $this->userid)
            ->where('orders.order_status', 6);

        // Join the order_status table on the status column
        $query->join('order_status', 'order_status.id', '=', 'orders.order_status')
            ->select('orders.*', 'order_status.name as status_name'); // Example of selecting fields

        if (!empty($searchByOrderId)) {
            $query->where('orderId', $searchByOrderId);
        }
        if (!empty($order_status)) {
            $query->where('orders.order_status', $order_status);
        }

        $productsArr        = $query->get();
        $orderStatus        = OrderStatus::where('order_status.status', 1)->get();
        $chkPendingOrder    = Order::where('user_id', $this->userid)->whereIn('order_status', [1])->sum('buying_price');
        $profit             = Order::where('user_id', $this->userid)->whereIn('order_status', [1])->sum('profit');
        // dd($productsArr);
        $order['product_count']     = count($productsArr);
        $order['products']          = $productsArr;
        $order['currentBalance']    = number_format($currentBalance, 2);
        $order['orderStatus']       = $orderStatus;
        $order['chkPendingOrder']   = number_format($chkPendingOrder, 2);
        $order['profit']            = number_format($profit, 2);
        $order['current_time']      = $getcurrentTime;
        $order['order_status']      = 'Complete';
        return response()->json($order, 200);
    }

    public function tobeShipped(Request $request)
    {
        $searchByOrderId = $request->searchByOrderId;
        $order_status    = $request->order_status;;

        $getcurrentTime = date('Y-m-d H:i:s');
        $response       = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalance();
        $currentBalance = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;

        $query  = Order::where('user_id', $this->userid)
            ->where('orders.order_status', 5);

        // Join the order_status table on the status column
        $query->join('order_status', 'order_status.id', '=', 'orders.order_status')
            ->select('orders.*', 'order_status.name as status_name'); // Example of selecting fields

        if (!empty($searchByOrderId)) {
            $query->where('orderId', $searchByOrderId);
        }
        if (!empty($order_status)) {
            $query->where('orders.order_status', $order_status);
        }
        $productsArr         = $query->get();
        $chkPendingOrder    = Order::where('user_id', $this->userid)->whereIn('order_status', [1])->sum('buying_price');
        $profit             = Order::where('user_id', $this->userid)->whereIn('order_status', [1])->sum('profit');
        // dd($productsArr);
        $order['product_count']     = count($productsArr);
        $order['products']          = $productsArr;
        $order['currentBalance']    = number_format($currentBalance, 2);
        $order['chkPendingOrder']   = number_format($chkPendingOrder, 2);
        $order['profit']            = number_format($profit, 2);
        $order['current_time']      = $getcurrentTime;
        $order['order_status']      = 'To be shipped';
        return response()->json($order, 200);
    }

    public function platformProcced(Request $request)
    {
        // To be platformProcced
        $searchByOrderId = $request->searchByOrderId;
        $order_status    = $request->order_status;;

        $getcurrentTime = date('Y-m-d H:i:s');
        $response       = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalance();
        $currentBalance = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;

        $query  = Order::where('user_id', $this->userid)
            ->where('orders.order_status', 4);

        // Join the order_status table on the status column
        $query->join('order_status', 'order_status.id', '=', 'orders.order_status')
            ->select('orders.*', 'order_status.name as status_name'); // Example of selecting fields

        if (!empty($searchByOrderId)) {
            $query->where('orderId', $searchByOrderId);
        }
        if (!empty($order_status)) {
            $query->where('orders.order_status', $order_status);
        }

        $productsArr        = $query->get();
        $orderStatus        = OrderStatus::where('order_status.status', 1)->get();
        $chkPendingOrder    = Order::where('user_id', $this->userid)->whereIn('order_status', [1])->sum('buying_price');
        $profit             = Order::where('user_id', $this->userid)->whereIn('order_status', [1])->sum('profit');
        // dd($productsArr);
        $order['product_count']     = count($productsArr);
        $order['products']          = $productsArr;
        $order['currentBalance']    = number_format($currentBalance, 2);
        $order['orderStatus']       = $orderStatus;
        $order['chkPendingOrder']   = number_format($chkPendingOrder, 2);
        $order['profit']            = number_format($profit, 2);
        $order['current_time']      = $getcurrentTime;
        $order['order_status']      = 'Platform Proceed';
        return response()->json($order, 200);
    }

    public function tobeRecived(Request $request)
    {
        // To be Recevied
        $searchByOrderId = $request->searchByOrderId;
        $order_status    = $request->order_status;;

        $getcurrentTime = date('Y-m-d H:i:s');
        $response       = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalance();
        $currentBalance = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;

        $query  = Order::where('user_id', $this->userid)
            ->where('orders.order_status', 3);

        // Join the order_status table on the status column
        $query->join('order_status', 'order_status.id', '=', 'orders.order_status')
            ->select('orders.*', 'order_status.name as status_name'); // Example of selecting fields

        if (!empty($searchByOrderId)) {
            $query->where('orderId', $searchByOrderId);
        }
        if (!empty($order_status)) {
            $query->where('orders.order_status', $order_status);
        }

        $productsArr        = $query->get();
        $getcurrentTime     = date('Y-m-d H:i:s'); //Carbon::now($customTimeZone);//date('Y-m-d H:i:s', strtotime('2024-04-30 06:35:45')); // Convert the current time to the same format as in the database
        $orderStatus        = OrderStatus::where('order_status.status', 1)->get();
        $chkPendingOrder    = Order::where('user_id', $this->userid)->whereIn('order_status', [1])->sum('buying_price');
        $profit             = Order::where('user_id', $this->userid)->whereIn('order_status', [1])->sum('profit');
        // dd($productsArr);
        $order['product_count']     = count($productsArr);
        $order['products']          = $productsArr;
        $order['currentBalance']    = number_format($currentBalance, 2);
        $order['orderStatus']       = $orderStatus;
        $order['chkPendingOrder']   = number_format($chkPendingOrder, 2);
        $order['profit']            = number_format($profit, 2);
        $order['current_time']      = $getcurrentTime;
        $order['order_status']      = 'To be recevied';
        return response()->json($order, 200);
    }

    public function tobeConfirmed(Request $request)
    {
        //"CONFIRM ORDER";
        $searchByOrderId = $request->searchByOrderId;
        $order_status    = $request->order_status;;

        $getcurrentTime = date('Y-m-d H:i:s');
        $response       = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalance();
        $currentBalance = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;

        $query  = Order::where('user_id', $this->userid)
            ->where('orders.order_status', 2);

        // Join the order_status table on the status column
        $query->join('order_status', 'order_status.id', '=', 'orders.order_status')
            ->select('orders.*', 'order_status.name as status_name'); // Example of selecting fields

        if (!empty($searchByOrderId)) {
            $query->where('orderId', $searchByOrderId);
        }
        if (!empty($order_status)) {
            $query->where('orders.order_status', $order_status);
        }

        $productsArr         = $query->get();

        $orderStatus        = OrderStatus::where('order_status.status', 1)->get();
        $chkPendingOrder    = Order::where('user_id', $this->userid)->whereIn('order_status', [1])->sum('buying_price');
        $profit             = Order::where('user_id', $this->userid)->whereIn('order_status', [1])->sum('profit');
        // dd($productsArr);
        $order['product_count']     = count($productsArr);
        $order['products']          = $productsArr;
        $order['currentBalance']    = number_format($currentBalance, 2);
        $order['orderStatus']       = $orderStatus;
        $order['chkPendingOrder']   = number_format($chkPendingOrder, 2);
        $order['profit']            = number_format($profit, 2);
        $order['current_time']      = $getcurrentTime;
        $order['order_status']      = 'To be confirm';
        return response()->json($order, 200);
    }

    public function orderTobePaid(Request $request)
    {

        $customTimeZone = 'Asia/Dubai';
        // echo "Current Time in $customTimeZone after adding 3 hours: $currentTimeFormatted";
        $response       = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalance();
        $currentBalance = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;

        // Define the current date
        $current_date   = date("Y-m-d");
        // Query Mystore to find stores where the end_date is on or after the current date
        $searchByOrderId = !empty($request->searchByOrderId) ? $request->searchByOrderId : "";
        $order_status    = !empty($request->order_status) ? $request->order_status : "";

        //echo $current_date;
        $query  = Order::where('user_id', $this->userid)
            ->join('produc_categories', 'orders.product_id', '=', 'produc_categories.product_id')
            //->where('order_date', $current_date)
            ->where('orders.order_status', 1)
            ->where('orders.status', 1);

        // Join the order_status table on the status column
        $query->join('order_status', 'order_status.id', '=', 'orders.order_status')
            ->select('orders.*', 'order_status.name as status_name', 'produc_categories.category_id'); // Example of selecting fields

        if (!empty($searchByOrderId)) {
            $query->where('orderId', $searchByOrderId);
        }
        if (!empty($order_status)) {
            $query->where('orders.order_status', $order_status);
        }
        $productsArr        = $query->get();
        $chkPendingOrder    = Order::where('user_id', $this->userid)->whereIn('order_status', [1])->sum('buying_price');
        $profit             = Order::where('user_id', $this->userid)->whereIn('order_status', [1])->sum('profit');

        // dd($productsArr);
        $data['product_count']     = count($productsArr);
        $data['products']          = !empty($productsArr) ? $productsArr : "";
        $data['currentBalance']    = number_format($currentBalance, 2);
        // $data['orderStatus']       = $orderStatus;
        $data['chkPendingOrder']   = !empty($chkPendingOrder) ? number_format($chkPendingOrder, 2) : "0.00";
        $data['profit']            = !empty($profit) ? number_format($profit, 2) : "0.00";
        return response()->json($data, 200);
    }

    public function orderCancel(Request $request)
    {

        $orderId = $request->orderId; // Get the orderId from the request
        Order::where('orderId', $orderId)->delete();
        return response()->json("Successfull Delete", 200);
    }

    public function orderInfo(Request $request)
    {
        $orderId               = $request->orderId;
        $data['order_row']     = Order::where('orderId', $orderId)->first();
        return response()->json($data, 200);
    }

    public function transferOrder(Request $request)
    {

        // dd($request->all());
        $orderId    = $request->orderId;
        $userId     = (int)$request->userId;
        $chkPoint   =  MystoreHistory::where('user_id', $userId)->first();

        // if ($chkPoint) {
        $chkOrder = Order::where('orderId', $orderId)->first();
        $previous_user_id = $chkOrder->user_id;
        $transer_user_id  = $userId;

        $transfer['previous_user_id'] = $previous_user_id;
        $transfer['transer_user_id']  = $transer_user_id;
        $transfer['order_id']         = $orderId;
        $transferId = Transfer::insertGetId($transfer);

        $oupdate['transfer_id'] = $transferId;
        $oupdate['user_id']     = $userId;
        $oupdate['remarks']     = "Previous User ID: " . $previous_user_id;
        Order::where('orderId', $orderId)->update($oupdate);
        $data['store_status'] = 1; //true
        return response()->json($data, 200);
        // No record was found, this condition is true
        //echo "condition is true.";
        // } else {
        //     $data['store_status'] = 0; //false
        //     return response()->json($data, 200);
        //     // A record was found
        //     // echo "condition is false.";
        // }
    }

    public function cancelOrderRequest(Request $request)
    {

        $data['order_status'] = 7;
        Order::where('user_id', $this->userid)
            ->where('orderId', $request->orderId)
            ->update($data);
        return response()->json("Successfully cancel this order : $request->orderId", 200);
    }

    public function updatOrderSchedularStatus(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'nags_receive'     => 'required|numeric',
            'nags_process'     => 'required|numeric',
            'nags_shipped'     => 'required|numeric',
            'nags_complete'    => 'required|numeric',

            'gas_receive'      => 'required|numeric',
            'gas_process'      => 'required|numeric',
            'gas_shipped'      => 'required|numeric',
            'gas_complete'     => 'required|numeric',

            'sag_receive'      => 'required|numeric',
            'sag_process'      => 'required|numeric',
            'sag_shipped'      => 'required|numeric',
            'sag_complete'     => 'required|numeric',

            'mas_receive'      => 'required|numeric',
            'mas_process'      => 'required|numeric',
            'mas_shipped'      => 'required|numeric',
            'mas_cmplete'      => 'required|numeric',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $data = array(
            'nags_receive'               => $request->nags_receive,
            'nags_process'               => $request->nags_process,
            'nags_shipped'               => $request->nags_shipped,
            'nags_complete'              => $request->nags_complete,

            'gas_receive'               => $request->gas_receive,
            'gas_process'               => $request->gas_process,
            'gas_shipped'               => $request->gas_shipped,
            'gas_complete'              => $request->gas_complete,

            'sag_receive'               => $request->sag_receive,
            'sag_process'               => $request->sag_process,
            'sag_shipped'               => $request->sag_shipped,
            'sag_complete'              => $request->sag_complete,

            'mas_receive'               => $request->mas_receive,
            'mas_process'               => $request->mas_process,
            'mas_shipped'               => $request->mas_shipped,
            'mas_cmplete'               => $request->mas_cmplete,

            'update_by'                  => $this->userid
        );

        Setting::where('id', 1)->update($data);
        return response()->json("Successfully update schedular time", 200);
    }

    public function sendManualOrderAdmin(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'userId'                => 'required',
            'selectedcategoryId'    => 'required',
            'selectedProductIDs'    => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user_id            = $request->userId;
        $selectedcategoryId = $request->selectedcategoryId;
        $selectedProductIDs = $request->selectedProductIDs;
        $productIDsArray    = explode(',', $selectedProductIDs);

        $customTimeZone = 'Asia/Dubai';
        $startTime = Carbon::now($customTimeZone);
        $currentHour = $startTime->hour;

        $currentTime = Carbon::now($customTimeZone);
        // Add 8 hours to the current datetime
        $currentTime->addHours(10);
        // Format the datetime as needed
        $currentTimeFormatted = $currentTime->format('Y-m-d H:i:s');
        $current_date   = date("Y-m-d");

        $response       = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalanceCheckAdminIndivUser($user_id);
        $currentBalance = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;
        $amount         = $currentBalance * 2;
        $max_price      = $amount;

        $productsArr = [];
        foreach ($productIDsArray as $productID) {
            $pro_row = Product::where('id', $productID)->first();
            $productsArr[] = [
                'product_id'          => $pro_row->id,
                'product_name'        => $pro_row->name,
                'selling_price'       => $pro_row->selling_price,
                'order_date'          => date("Y-m-d"),
                'created_at'          => $startTime,
                'order_inactive_time' => $currentTimeFormatted,
                'profit'              => $pro_row->profit,
                'user_id'             => $user_id,
                'orderId'             => $this->generateUniqueRandomNumber(),
                'product_qty'         => 1,
                'buying_price'        => $pro_row->buying_price,
                'user_balance'        => $currentBalance,
                'user_mul_balance'    => $amount,
                'order_status'        => 1, //To be paid.
                'order_type'          => 'indivisual', //To be paid.
                'thumnail_img'        => !empty($pro_row->thumnail_img) ? url($pro_row->thumnail_img) : "",
            ];
        }
        Order::insert($productsArr);

        /*
        if (!empty($productsArr)) {
            $existingOrder = Order::whereDate('order_date', $current_date)->first();
            if (!$existingOrder) {
                // If no existing order found, proceed with the insertion
                Order::insert($productsArr);
            }
        }*/

        return response()->json("Successfully assign order send", 200);
    }

    public function assignOrder(Request $request)
    {

        return response()->json("this method we are not using", 400);
    }

    function generateUniqueRandomNumber()
    {
        // Get current microtime as a string and remove the decimal point
        $microtime          = (string) microtime(true); // Current time with microseconds
        $microtimeStr       = str_replace('.', '', $microtime); // Remove the dot0.656545545455000
        // Extract the last 6 digits

        return md5($microtimeStr); // Return the 6-digit unique value
    }

    public function checkOrderData(Request $request)
    {

        $selectedStatus = $request->selectedStatus;
        $orderDate      = $request->orderDate;
        if (empty($selectedStatus)) {
            $selectedStatus = [1, 2, 3, 4, 5];
        } elseif (!is_array($selectedStatus)) {
            $selectedStatus = [$selectedStatus];
        }
        $orders = Order::whereIn('order_status', $selectedStatus)
            ->select('orderId', 'order_date', 'pay_confirm_time')->where('order_date', $orderDate)->get();
        $data = [];
        foreach ($orders as $v) {

            $data[] = [
                'orderId'           => $v->orderId,
                'order_date'        => $v->order_date,
                'pay_confirm_time'  => !empty($v->pay_confirm_time) ? $v->pay_confirm_time : "",
                'apx_complete_time' => $v->complete_time,
            ];
        }
        return response()->json($data, 200);
    }

    public function orderDetails($order_id)
    {

        $orderStatus     = orderStatus::all();
        $findorder       = Order::join('order_status', 'order_status.id', '=', 'orders.order_status')->select('orders.*', 'order_status.name as orderstatus', 'order_status.id as orderstatus_id')->where('orderId', $order_id)->first();
        $data['orders']  = OrderHistory::join('product', 'product.id', '=', 'order_history.product_id')
            ->select('product.name as product_name', 'product.thumnail_img', 'order_history.*')
            ->where('order_id', $findorder->id)->get();
        foreach ($data['orders'] as $v) {
            $orders[] = [
                'product_name'    => $v->product_name,
                'thumbnail_img'   => url($v->thumnail_img),
                'quantity'        => $v->quantity,
                'price'           => $v->price,
                'total'           => $v->quantity * $v->price,
            ];
        }

        $findCustomer = User::where('id', $findorder->customer_id)->first();
        $order['customername']  = !empty($findCustomer->name) ? $findCustomer->name : "";
        $order['customeremail'] = !empty($findCustomer->email) ? $findCustomer->email : "";
        $order['orderdata']     = $orders;
        $order['orderrow']      = !empty($findorder->orderstatus) ? $findorder->orderstatus : "";
        $order['order_status']  = !empty($findorder->order_status) ? $findorder->order_status : "";
        $order['orderstatus_id'] = !empty($findorder->orderstatus_id) ? $findorder->orderstatus_id : "";
        $order['orderData']     = !empty($findorder) ? $findorder : "";
        $order['OrderStatus']   = $orderStatus;
        // dd($order['order_status']);
        return response()->json($order, 200);
    }

    public function allOrders()
    {

        $data['orders']  = Order::join('order_status', 'orders.order_status', '=', 'order_status.id')
            ->select('orders.*', 'order_status.name')
            ->where('orders.customer_id', $this->userid)
            ->orderBy('created_at', 'desc')
            ->get(); //Order::where('customer_id', $this->userid)->get();
        foreach ($data['orders'] as $v) {
            $orders[] = [
                'name'         => $v->name,
                'orderId'      => $v->orderId,
                'placeOn'      => date_format(date_create($v->created_at), "Y-m-d"),
                'total'        => number_format($v->total, 2),
            ];
        }

        $order['orderdata']      = $orders;

        return response()->json($order, 200);
    }

    public function filterOrderList(Request $request)
    {

       // dd($request->all());

        // Get search query from the request
        $page = $request->input('page', 1);
        $pageSize = $request->input('pageSize', 10);

        $searchUserEmail    = $request->searchUserEmail;
        $searchOrderId      = $request->searchOrderId;
        $startDate          = $request->startDate;
        $endDate            = $request->endDate;
        $selectedStatus     = $request->selectedStatus;

        // dd($selectedFilter);
        $query = Order::orderBy('orders.id', 'desc')
            ->join('users', 'orders.user_id', '=', 'users.id')
            ->select('orders.complete_time', 'orders.created_at', 'orders.pay_confirm_time', 'orders.order_date', 'orders.order_status', 'orders.id', 'orders.orderId', 'orders.product_name', 'orders.buying_price as costing_price', 'orders.profit', 'users.name as username', 'users.telegram', 'users.phone_number', 'users.whtsapp', 'users.email', 'orders.selling_price');

        if ($searchUserEmail !== null) {
            $query->where('users.email', 'like', '%' . $searchUserEmail . '%');
            //$query->where('users.email', $searchUserEmail);
        }

        if ($searchOrderId !== null) {
            $query->where('orders.orderId', 'like', '%' . $searchOrderId . '%');
            //$query->where('users.email', $searchOrderId);
        }

        if (!empty($selectedStatus)) {
            $query->where('orders.order_status', $selectedStatus);
        } else {
            $query->whereIn('orders.order_status', [1, 2, 3, 4, 5, 6]);
        }

        // Apply date range filtering if start and end dates are provided
        if ($startDate !== null && $endDate !== null) {
            $query->whereBetween('orders.order_date', [$startDate, $endDate]);
        }

        // $query->where('users.role_id', 2);
        $paginator = $query->paginate($pageSize, ['*'], 'page', $page);

        $selling_price_sum = $paginator->getCollection()->sum('selling_price');
        $costing_price_sum = $paginator->getCollection()->sum('costing_price');
        $profit_sum = $paginator->getCollection()->sum('profit');
        $modifiedCollection = $paginator->getCollection()->map(function ($item) {

            $checkOrStatus  = OrderStatus::where('id', $item->order_status)->first();
            $telegram       = !empty($item->telegram) ? $item->telegram : "None";
            $phone          = !empty($item->phone_number) ? $item->phone_number : "";
            $whtsapp        = !empty($item->whtsapp) ? $item->whtsapp : "None";
            $payConfirmTime = $item->pay_confirm_time;
            // Convert it into a Carbon instance
            $dateTime = Carbon::parse($payConfirmTime);
            // Add 120 hours
            $newDateTime = $dateTime->addHours(120);
            // Get the formatted date and time as a string
            $approxdevTime = $newDateTime->format('Y-m-d H:i:s');

            return [
                'id'            => $item->id,
                'orderId'       => $item->orderId,
                'product_name'  => $this->truncateString($item->product_name, 20, true),
                'userInfo_1'    => $item->username,
                'userInfo_2'    => $phone,
                'userInfo_3'    => $item->email,
                'userInfo_4'    => $telegram,
                'userInfo_5'    => $whtsapp,
                'order_date'    => date("Y-M-d", strtotime($item->order_date)),
                'selling_price' => $item->selling_price,
                'costing_price' => $item->costing_price,
                'created_at'    => date("Y-m-d", strtotime($item->created_at)), //$item->created_at,
                'pay_confirm_time'    => date("Y-m-d", strtotime($item->pay_confirm_time)), //$item->pay_confirm_time,
                'complete_time'       => date("Y-m-d", strtotime($item->complete_time)), //$approxdevTime,
                'profit'        => number_format($item->profit, 2),
                'status'        => !empty($checkOrStatus) ? $checkOrStatus->name : "",
            ];
        });
        $current_date = date("Y-m-d");
        $orderCountsByUser = Order::where('order_status', 1)
            ->select('user_id', DB::raw('count(*) as total_count')) // Get the count for each user
            ->groupBy('user_id') // Group by 'user_id'
            ->get();
        // Get the number of unique user_id groups
        $totalUserCount     = $orderCountsByUser->count(); // This gives you the total number of groups

        $userActiveMembers   = MystoreHistory::select('user_id', DB::raw('count(*) as total_count')) // Count per 'user_id'
            ->where('end_date', '>=', $current_date) // Condition for active stores
            ->groupBy('user_id') // Group by 'user_id'
            ->get();
        $allActiveMembersCount  = $userActiveMembers->count(); // This gives you the number of unique active users
        $tobePaid               = Order::where('order_status', 1)->count();
        $tobeconfiremed         = Order::where('order_status', 2)->count();
        $goodsTobereceived      = Order::where('order_status', 3)->count();
        $platformprocced        = Order::where('order_status', 4)->count();
        $tobeshipped            = Order::where('order_status', 5)->count();
        $complete               = Order::where('order_status', 6)->count();
        // Return the modified collection along with pagination metadata
        return response()->json([
            'data'                   => $modifiedCollection,
            'current_page'           => $paginator->currentPage(),
            'total_pages'            => $paginator->lastPage(),
            'total_records'          => $paginator->total(),
            'tobepaidcount'          => $totalUserCount,
            'activeMembersCount'     => $allActiveMembersCount,
            'tobePaid_count'         => $tobePaid,
            'tobeconfiremed_count'   => $tobeconfiremed,
            'goodsTobereceived_count' => $goodsTobereceived,
            'platformprocced_count'  => $platformprocced,
            'tobeshipped_count'      => $tobeshipped,
            'complete_count'         => $complete,
            'selling_price_sum'      => number_format($selling_price_sum, 2),
            'costing_price_sum'      => number_format($costing_price_sum, 2),
            'profit_sum'             => number_format($profit_sum, 2),

        ], 200);
    }

    function truncateString($str, $length, $addEllipsis = true)
    {
        // If the string length is within the limit, return it as-is.
        if (strlen($str) <= $length) {
            return $str;
        }
        // Truncate the string to the specified length.
        $truncated = substr($str, 0, $length);

        // If addEllipsis is true, add '...' at the end of the truncated string.
        if ($addEllipsis) {
            // If we truncated in the middle of a multibyte character, re-adjust.
            if (mb_check_encoding($truncated, 'UTF-8') && !mb_check_encoding($truncated, 'ASCII')) {
                // Remove potential partial multi-byte character at the end
                $truncated = mb_strcut($truncated, 0, mb_strlen($truncated, 'UTF-8'), 'UTF-8');
            }
            $truncated .= '...';
        }

        return $truncated;
    }

    public function updateOrder(Request $request)
    {

        $orderId                   = $request->orderId;
        $data['created_at']        = date("Y-m-d H:i:s", strtotime($request->created_at));
        $data['pay_confirm_time']  = date("Y-m-d H:i:s", strtotime($request->pay_confirm_time)); //$request->pay_confirm_time;
        $data['complete_time']     = date("Y-m-d H:i:s", strtotime($request->approx_deliv_time)); //$request->approx_deliv_time;
        $data['update_by']         = $this->userid; //$request->approx_deliv_tim
        //dd($data);
        Order::where('orderId', $orderId)->update($data);

        return response()->json("Update successfully", 200);
    }

    public function getOrderStatus()
    {
        $status  = OrderStatus::where('status', 1)->get();
        return response()->json($status, 200);
    }

    public function getOrderStatusSchedular()
    {
        $status  = Setting::where('id', 1)->first();
        return response()->json($status, 200);
    }
}
