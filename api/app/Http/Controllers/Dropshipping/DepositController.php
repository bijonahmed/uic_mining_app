<?php

namespace App\Http\Controllers\Dropshipping;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use Validator;
use Helper;
use App\Models\Holiday;
use App\Models\User;
use App\Models\ProductAttributeValue;
use App\Models\ProductVarrientHistory;
use App\Models\Categorys;
use App\Models\ProductAttributes;
use App\Models\ProductCategory;
use App\Models\Product;
use App\Models\ProductAdditionalImg;
use App\Models\ProductVarrient;
use App\Models\AttributeValues;
use App\Models\Deposit;
use App\Models\MiningServicesBuyHistory;
use App\Models\Setting;
use App\Models\TransactionHistory;
use App\Models\WalletAddress;
use App\Models\Withdraw;
use App\Models\addWithDrawMethod;
use App\Models\SendReceived;
use App\Models\WithdrawMethod;
use Illuminate\Support\Str;
use App\Rules\MatchOldPassword;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\JsonResponse;
use Session;
use Carbon\Carbon;
use DB;
use PDO;
use PhpParser\Node\Stmt\TryCatch;

class DepositController extends Controller
{
    protected $userid;
    public function __construct()
    {
        $this->middleware('auth:api');
        $id = auth('api')->user();
        if (!empty($id)) {
            $user = User::find($id->id);
            $this->userid = $user->id;
        }
    }

    public function filterRechargeList(Request $request)
    {

        // Get search query from the request
        $page = $request->input('page', 1);
        $pageSize = $request->input('pageSize', 10);

        $searchUserEmail    = $request->searchUserEmail;
        $searchTranId       = $request->searchOrderId;
        $sDate              = $request->startDate;
        $eDate              = $request->endDate;
        $selectedStatus     = $request->selectedStatus;
        $startDate = Carbon::parse($sDate)->startOfDay();
        $endDate = Carbon::parse($eDate)->endOfDay();

        // dd($selectedFilter);
        $query = Deposit::orderBy('deposit.id', 'desc')
            ->join('users', 'deposit.user_id', '=', 'users.id')
            ->select('deposit.*', 'users.name as username', 'users.telegram', 'users.phone_number', 'users.whtsapp', 'users.email');

        if ($searchUserEmail !== null) {
            $query->where('users.email', 'like', '%' . $searchUserEmail . '%');
            //$query->where('users.email', $searchUserEmail);
        }

        if ($searchTranId !== null) {
            $query->where('deposit.depositID', 'like', '%' . $searchTranId . '%');
            //$query->where('users.email', $searchOrderId);
        }

        if ($selectedStatus !== null) {
            $query->where('deposit.status', $selectedStatus);
        }

        // Apply date range filtering if start and end dates are provided
        if ($startDate !== null && $endDate !== null) {
            $query->whereBetween('deposit.created_at', [$startDate, $endDate]);
        }

        // $query->where('users.role_id', 2);
        $paginator = $query->paginate($pageSize, ['*'], 'page', $page);
        $modifiedCollection = $paginator->getCollection()->map(function ($item) {

            $checkStatus    = $item->status == 1 ? 'SUCCESS' : 'UNPAID';
            $telegram       = !empty($item->telegram) ? $item->telegram : "None";
            $phone          = !empty($item->phone_number) ? $item->phone_number : "";
            $whtsapp        = !empty($item->whtsapp) ? $item->whtsapp : "None";

            return [
                'id'            => $item->id,
                'depositID'     => $item->depositID,
                'userInfo_1'    => $item->username,
                'userInfo_2'    => $phone,
                'userInfo_3'    => $item->email,
                'userInfo_4'    => $telegram,
                'deposit_date'  => date("Y-M-d", strtotime($item->created_at)),
                'deposit_amount' => $item->deposit_amount,
                'wallet_address' => $item->wallet_address,
                'receivable_amount' => $item->receivable_amount,
                'depscription'  => $item->depscription,
                'status'        => $checkStatus,
            ];
        });

        // Return the modified collection along with pagination metadata
        return response()->json([
            'data' => $modifiedCollection,
            'current_page' => $paginator->currentPage(),
            'total_pages' => $paginator->lastPage(),
            'total_records' => $paginator->total(),
        ], 200);
    }

    public function addWithDrawMethod(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'name'                  => 'required',
                'account_number'        => 'required',
            ]);
            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $data = array(
                'name'           => $request->name,
                'account_number' => $request->account_number,
                'user_id'        => $this->userid
            );
            WithdrawMethod::insertGetId($data);
            /////addWithDrawMethod

            return response()->json(['message' => 'method add successfully'], 200);
        } catch (QueryException $e) {
            // Log the error or handle it as needed
            return response()->json(['error' => 'Database error occurred.'], 500);
        } catch (\Exception $e) {
            // Handle other exceptions
            return response()->json(['error' => 'An unexpected error occurred.'], 500);
        }
    }

    public function updateWithDrawRequest(Request $request)
    {

        try {
            $validator = Validator::make($request->all(), [
                'remarks'             => 'required',
                'status'              => 'required|numeric',
                'id'                  => 'required',
            ]);
            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $deposit = Withdraw::find($request->id);
            $deposit->update([
                'remarks'           => $request->remarks,
                'status'            => 2, //$request->status,
                'approved_by'       => $this->userid
            ]);
            return response()->json(['message' => 'Withdraw updated successfully'], 200);
        } catch (QueryException $e) {
            // Log the error or handle it as needed
            return response()->json(['error' => 'Database error occurred.'], 500);
        } catch (\Exception $e) {
            // Handle other exceptions
            return response()->json(['error' => 'An unexpected error occurred.'], 500);
        }
    }

    public function updateDepositRequest(Request $request)
    {

        try {
            $validator = Validator::make($request->all(), [
                'receivable_amount'  => 'required|numeric',
                'status'             => 'required|numeric',
                'id' => 'required',
            ]);
            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $deposit = Deposit::find($request->id);
            $deposit->update([
                'receivable_amount' => $request->receivable_amount,
                'status'            => $request->status,
                'approved_by'       => $this->userid
            ]);
            return response()->json(['message' => 'Deposit updated successfully'], 200);
        } catch (QueryException $e) {
            // Log the error or handle it as needed
            return response()->json(['error' => 'Database error occurred.'], 500);
        } catch (\Exception $e) {
            // Handle other exceptions
            return response()->json(['error' => 'An unexpected error occurred.'], 500);
        }
    }

    public function sendReciverBuySell(Request $request)
    {

        try {
            $validator = Validator::make($request->all(), [
                'receiver_user_id'      => 'required',
                'receiver_uic_address'  => 'required',
                'receiver_name'         => 'required',
                'password'              => 'required',
                'wallet_type'           => 'required',
                'amount'                => 'required',
            ]);
            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $today_date             = date("Y-m-d");
            $active_matching        = MiningServicesBuyHistory::where('user_id', $this->userid)->first();

            $sendRecived_uic        = SendReceived::where('user_id', $this->userid)->where('wallet_type', 1)->sum('amount');
            $sendRecived_usd        = SendReceived::where('user_id', $this->userid)->where('wallet_type', 2)->sum('amount');

            $usdtAmount             = Deposit::where('user_id', $this->userid)->where('status', 1)->sum('deposit_amount');
            $service_price          = ($active_matching && $active_matching->end_date >= $today_date) ? ($active_matching->service_price ?? 0) : 0;

            $user                   = User::find($this->userid);
            $receiver_uic_address   = User::where('uic_address', $request->receiver_uic_address)->first();
            // Check if the user exists
            if (!$user) {
                return response()->json(['error' => 'User not found'], 404);
            }

            // echo "Request User : ".$request->password."<br>";
            // echo " User : ".$user->show_password."<br>";
            // exit; 
            // Check if the provided password matches the user's password
            if (!Hash::check($request->password, $user->password)) {
                return response()->json(['errors' => ['password_wrong' => ['Incorrect password']]], 422);
            }

            // Check if the receiver_uic_address
            if (empty($receiver_uic_address)) {
                return response()->json(['errors' => ['invlaid_uic_address' => ['Invalid UIC Address']]], 422);
            }

            if ($request->wallet_type == 1) {

                if ($request->amount <= 0) {
                    return response()->json(['errors' => ['error_amount' => ['Invalid Request']]], 422);
                }

                $row               = User::where('id', $this->userid)->first();
                $mining_amount     = $row->mining_amount - $sendRecived_uic;

                //if ($request->amount > $mining_amount) {
                  //  return response()->json(['errors' => ['error_amount' => ['Invalid Request----']]], 422);
              //  }

                //For Reciver 
                $receiver_row                       = User::where('id', $request->receiver_user_id)->first();
                #echo "Reciver row {$receiver_row->mining_amount}<br/>";
                $initialAmount                      = $receiver_row->mining_amount;
                $mining_amount_final                = bcadd($initialAmount, (string) $request->amount, 7); //0.0000001 + $request->amount; // 10 decimal places
                $reciverupdate['mining_amount']     =  $mining_amount_final;
                User::where('id', $request->receiver_user_id)->update($reciverupdate);
                //END

                //For Sender 
                $intAmount                          = $row->mining_amount;
                $requestAmount                      = (string) $request->amount;
                $senderupdate['mining_amount']      = bcsub($intAmount, $requestAmount, 7); // 7 decimal places
                User::where('id', $this->userid)->update($senderupdate);
            }

            if ($request->wallet_type == 2) {
                $result          = $usdtAmount - $sendRecived_usd - $service_price;
                if ($request->amount <= 0) {
                    return response()->json(['errors' => ['error_amount' => ['Invalid Request']]], 422);
                }

                if ($request->amount > $result) {
                    return response()->json(['errors' => ['error_amount' => ['Invalid Request']]], 422);
                }
            }

            $data = array(
                'receiver_user_id'       => $request->receiver_user_id,
                'receiver_uic_address'   => $request->receiver_uic_address,
                'receiver_name'          => $request->receiver_name,
                'password'               => $request->password,
                'wallet_type'            => $request->wallet_type,
                'amount'                 => $request->amount,
                'user_id'                => $this->userid,
                'sender_user_id'         => $this->userid
            );
            $last_Id = SendReceived::insertGetId($data);

            $tran['user_id']     = $this->userid;
            $tran['type']        = 4; //Send Received
            $tran['last_Id']     = $last_Id;
            $tran['amount']      = $request->amount;
            if ($request->wallet_type == 1) {
                $tran['description'] = 'Send/Receive-UIC Amount';
            }

            if ($request->wallet_type == 2) {
                $tran['description'] = 'Send/Receive-USDT Amount';
            }

            TransactionHistory::insert($tran);

            return response()->json($last_Id);
        } catch (QueryException $e) {
            // Log the error or handle it as needed
            return response()->json(['error' => 'Database error occurred.'], 500);
        } catch (\Exception $e) {
            // Handle other exceptions
            return response()->json(['error' => 'An unexpected error occurred.'], 500);
        }
    }

    public function withdrawRequest(Request $request)
    {

        try {
            $validator = Validator::make($request->all(), [
                'withdrawal_method'  => 'required',
                'account_number'     => 'required',
                'confirm_password'   => 'required',
                'usd_amount'         => 'required',
                //'uic_amount'         => 'required',
            ]);
            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $user = User::find($this->userid);
            // Check if the user exists
            if (!$user) {
                return response()->json(['error' => 'User not found'], 404);
            }

            // Check if the provided password matches the user's password
            if (!Hash::check($request->confirm_password, $user->password)) {
                return response()->json(['errors' => ['password_wrong' => ['Incorrect password']]], 422);
            }

            $userid         = $request->userid;
            $response       = app('App\Http\Controllers\User\UserController')->getBalance($userid);
            $usdt_amount    = $response instanceof JsonResponse ? $response->getData(true)['usdt_amount'] : 0;
            $uic_amount     = $response instanceof JsonResponse ? $response->getData(true)['uic_amount'] : 0;

            if ($request->usd_amount > $usdt_amount) {
                return response()->json(['errors' => ['error_usdt' => ['You have no sufficiant USDT balance']]], 422);
            }

            // if ($request->uic_amount > $uic_amount) {
            //     return response()->json(['errors' => ['error_uic' => ['You have no sufficiant UIC balance']]], 422);
            // }

            $withmethod = $request->withdrawal_method;
            $getRow     = WithdrawMethod::where('id', $withmethod)->first();

            $uniqueID = 'W.' . $this->generateUnique4DigitNumber();
            $data = array(
                'withdrawID'     => $uniqueID,
                'depscription'   => $uniqueID,
                'withdraw_amount' => $request->uic_amount,
                'payment_method' => !empty($getRow) ? $getRow->name : "",
                'account_number' => $request->account_number,
                'usd_amount'     => $request->usd_amount,
               // 'uic_amount'     => $request->uic_amount,
                'password'       => $request->confirm_password,
                'status'         => 0,
                'user_id'        => $this->userid
            );
            $last_Id = Withdraw::insertGetId($data);

            /*
            $tran['user_id']     = $this->userid;
            $tran['type']        = 2; //Withdraw
            $tran['last_Id']     = $last_Id;
            $tran['amount']      = $request->uic_amount;
            $tran['description'] = 'Withdraw';
            TransactionHistory::insert($tran);
            */

            return response()->json($last_Id);
        } catch (QueryException $e) {
            // Log the error or handle it as needed
            return response()->json(['error' => 'Database error occurred.'], 500);
        } catch (\Exception $e) {
            // Handle other exceptions
            return response()->json(['error' => 'An unexpected error occurred.'], 500);
        }
    }

    public function depositRequest(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'deposit_amount'  => 'required|numeric',
                'payment_method' => 'required',
                'trxId' => 'required',
            ]);
            if ($validator->fails()) {
                return response()->json(['errors' => $validator->errors()], 422);
            }

            $setting = Setting::find(1);
            $checkSetting = $setting->minimum_deposit_amount;

            if ($request->deposit_amount <= $checkSetting) {
                return response()->json(['errors' => ['deposit_amount' => ['Your deposit amount is low']]], 422);
            }

            $uniqueID = 'D.' . $this->generateUnique4DigitNumber();
            $data = array(
                'depositID'      => $uniqueID,
                'depscription'   => $uniqueID,
                'deposit_amount' => $request->deposit_amount,
                'payment_method' => $request->payment_method,
                'trxId'          => $request->trxId,
                'status'         => 0,
                'user_id'        => $this->userid
            );
            $last_Id = Deposit::insertGetId($data);

            $tran['user_id']     = $this->userid;
            $tran['type']        = 1; //Deposit 
            $tran['last_Id']     = $last_Id;
            $tran['amount']      = $request->deposit_amount;
            $tran['description'] = 'Deposit';
            TransactionHistory::insert($tran);

            return response()->json($last_Id);
        } catch (QueryException $e) {
            // Log the error or handle it as needed
            return response()->json(['error' => 'Database error occurred.'], 500);
        } catch (\Exception $e) {
            // Handle other exceptions
            return response()->json(['error' => 'An unexpected error occurred.'], 500);
        }
    }

    function generateUnique4DigitNumber($existingNumbers = [])
    {
        do {
            $uniqueNumber = str_pad(mt_rand(0, 9999), 4, '0', STR_PAD_LEFT);
        } while (in_array($uniqueNumber, $existingNumbers));

        return md5($uniqueNumber);
    }

    public function getSendReceived()
    {

        $getrows     = SendReceived::where('user_id', $this->userid)->get();
        $history = [];
        foreach ($getrows as $v) {
            $history[] = [
                'id'                           => $v->id,
                'receiver_uic_address'         => $v->receiver_uic_address,
                'receiver_name'                => $v->receiver_name,
                'wallet_type'                  => $v->wallet_type,
                'amount'                       => $v->amount,
                'created_at'                   => date("d-m-Y H:i:s", strtotime($v->created_at)),
            ];
        }

        $thirtyDaysAgo          = Carbon::now()->subDays(30);
        $get_amounts            = SendReceived::where('user_id', $this->userid)
            ->where('created_at', '>=', $thirtyDaysAgo)
            ->sum('amount');
        $data['history']        = $history;
        $data['total_send']     = number_format($get_amounts, 8);
        $data['total_received'] = number_format($get_amounts, 8);

        return response()->json($data);
    }

    public function getWithMethodList()
    {
        $data     = WithdrawMethod::where('user_id', $this->userid)->get();
        foreach ($data as $v) {

            $tran[] = [
                'id'             => $v->id,
                'name'     => $v->name,
                'account_number' => $v->account_number,
            ];
        }

        return response()->json($tran, 200);
    }

    public function getWithdrawRequest()
    {

        $data     = Withdraw::where('user_id', $this->userid)->get();
        foreach ($data as $v) {

            if ($v->status == 0) {
                $wStatus = 'Review';
            } elseif ($v->status == 1) {
                $wStatus = 'Approved';
            } elseif ($v->status == 2) {
                $wStatus = 'Reject';
            }

            $tran[] = [
                'id'             => $v->id,
                'withdrawID'     => $v->withdrawID,
                'payment_method' => $v->payment_method,
                'account_number' => $v->account_number,
                'wStatus'        => $wStatus,
                'status'         => $v->status,
                'usd_amount'     => $v->usd_amount,
                'uic_amount'     => $v->uic_amount,
                'created_at'     => date("d-m-Y H:i:s", strtotime($v->created_at)),
            ];
        }

        return response()->json($tran, 200);
    }

    public function getwithdrawalList(Request $request)
    {
       // dd($request->all());
        $page = $request->input('page', 1);
        $pageSize = $request->input('pageSize', 10);

        // Get search query from the request
        $searchQuery    = $request->searchQuery;
        $selectedFilter = (int)$request->selectedFilter;
        $searchEmail    = $request->searchEmail;
        $filterFrmDate  = $request->filterFrmDate;
        $filterToDate   = $request->filterToDate;
        $searchOrderId  = $request->searchOrderId;

        $query = Withdraw::orderBy('withdraw.id', 'desc')
            ->select('withdraw.*', 'users.name', 'users.email', 'users.phone_number')
            ->join('users', 'withdraw.user_id', '=', 'users.id') // Join condition
            ->orderBy('withdraw.id', 'desc'); // Sorting by 'id' in descending order

        if (!empty($searchOrderId)) {
            $query->where('withdraw.withdrawID', $searchOrderId);
        }

        

        // Check if filter dates are provided
        if (!empty($filterFrmDate) && !empty($filterToDate)) {
            // Filter by range (inclusive)
            $query->whereBetween(DB::raw('DATE(withdraw.created_at)'), [$filterFrmDate, $filterToDate]);
        } elseif (!empty($filterFrmDate)) {
            // If only from date is provided, filter by that specific date
            $query->where(DB::raw('DATE(withdraw.created_at)'), $filterFrmDate);
        } elseif (!empty($filterToDate)) {
            // If only to date is provided, filter by that specific date
            $query->where(DB::raw('DATE(withdraw.created_at)'), $filterToDate);
        }

        if (!empty($searchEmail)) {
            $query->where('users.email', $searchEmail);
        }

        $cleanedSelectedFilter = isset($selectedFilter) ? (int) trim($selectedFilter) : null;

        if ($cleanedSelectedFilter == 5) {
            $query->whereIn('withdraw.status', [0, 1, 2]); 
        } else {
            $query->where('withdraw.status', $cleanedSelectedFilter);
        }

        $paginator = $query->paginate($pageSize, ['*'], 'page', $page);

        $modifiedCollection = $paginator->getCollection()->map(function ($item) {

            $status = "";
            if ($item->status == 0) {
                $status = "Review";
            } else if ($item->status == 1) {
                $status = "Approved";
            } else if ($item->status == 2) {
                $status = "Rejected";
            }
            $userrow = User::find($item->user_id);
            return [
                'id'                => $item->id,
                'withdrawID'        => $item->withdrawID,
                'user_info_name'    => !empty($userrow->name) ?  $userrow->name : "N/A",
                'user_info_email'   => !empty($userrow->email) ?  $userrow->email : "N/A",
                'user_info_phone'   => !empty($userrow->phone_number) ?  $userrow->phone_number : "N/A",
                'created_at'        => date("Y-m-d H:i:s", strtotime($item->created_at)),
                'usd_amount'        => $item->usd_amount,
                'uic_amount'        => $item->uic_amount,
                'payable_amount'    => $item->payable_amount,
                'transection_fee'   => $item->transection_fee,
                'withdrawal_method_id' => $item->withdrawal_method_id,
                'status'            => $status,
                'sts'               => $item->status,
            ];
        });

        // Return the modified collection along with pagination metadata
        return response()->json([
            'data' => $modifiedCollection,
            'current_page' => $paginator->currentPage(),
            'total_pages' => $paginator->lastPage(),
            'total_records' => $paginator->total(),
        ], 200);
    }

    public function getDepositList(Request $request)
    {

        $page           = $request->input('page', 1);
        $pageSize       = $request->input('pageSize', 10);
        // Get search query from the request
        $searchQuery    = $request->searchQuery;
        $selectedFilter = (int)$request->selectedFilter;
        $searchEmail    = $request->searchEmail;
        $filterFrmDate  = $request->filterFrmDate;
        $filterToDate   = $request->filterToDate;
        $searchOrderId  = $request->searchOrderId;

        // dd($selectedFilter);
        $query = Deposit::orderBy('deposit.id', 'desc')
            ->join('users', 'deposit.user_id', '=', 'users.id') // Join condition
            ->select('deposit.*', 'users.email', 'users.name', 'users.phone_number')
            ->orderBy('deposit.id', 'desc'); // Sorting by 'id' in descending order

        // Check if filter dates are provided
        if (!empty($filterFrmDate) && !empty($filterToDate)) {
            // Filter by range (inclusive)
            $query->whereBetween(DB::raw('DATE(deposit.created_at)'), [$filterFrmDate, $filterToDate]);
        } elseif (!empty($filterFrmDate)) {
            // If only from date is provided, filter by that specific date
            $query->where(DB::raw('DATE(deposit.created_at)'), $filterFrmDate);
        } elseif (!empty($filterToDate)) {
            // If only to date is provided, filter by that specific date
            $query->where(DB::raw('DATE(deposit.created_at)'), $filterToDate);
        }

        if (!empty($searchEmail)) {
            $query->where('users.email', $searchEmail);
        }

        if (!empty($searchOrderId)) {
            // $query->where('depositID', 'like', '%' . $searchQuery . '%');
            $query->where('deposit.depositID', $searchOrderId);
        }

       // $cleanedSelectedFilter = isset($selectedFilter) ? (int) trim($selectedFilter) : null;
       

        if ($selectedFilter == 5) {
            $query->whereIn('deposit.status', [0, 1, 2]); 
           
        } else {
            $query->where('deposit.status', $selectedFilter);
        }

        $paginator = $query->paginate($pageSize, ['*'], 'page', $page);

        $modifiedCollection = $paginator->getCollection()->map(function ($item) {

            $status = "";
            if ($item->status == 0) {
                $status = "Review";
            } else if ($item->status == 1) {
                $status = "Approved";
            } else if ($item->status == 2) {
                $status = "Rejected";
            }
            //Payment not received
            $userrow = User::find($item->user_id);
            return [
                'id'                => $item->id,
                'depositID'         => $item->depositID,
                'user_info_name'    => !empty($userrow->name) ?  $userrow->name : "N/A",
                'user_info_email'   => !empty($userrow->email) ?  $userrow->email : "N/A",
                'user_info_phone'   => !empty($userrow->phone_number) ?  $userrow->phone_number : "N/A",
                'deposit_amount'    => $item->deposit_amount,
                'receivable_amount' => !empty($item->receivable_amount) ? $item->receivable_amount : "Payment not received",
                'payment_method'    => $item->payment_method,
                'created_at'        =>  date("Y-m-d H:i:s", strtotime($item->created_at)),
                'status'            => $status,
                'sts'               => $item->status,
            ];
        });

        // Return the modified collection along with pagination metadata
        return response()->json([
            'data' => $modifiedCollection,
            'current_page' => $paginator->currentPage(),
            'total_pages' => $paginator->lastPage(),
            'total_records' => $paginator->total(),
        ], 200);
    }

    public function depositrow($id)
    {

        try {
            $user = Deposit::where('deposit.id', $id)
                ->select('users.name', 'deposit.*')
                ->leftJoin('users', 'deposit.user_id', '=', 'users.id')
                ->first();
            return response()->json($user);
        } catch (\Exception $e) {
            echo "Error: " . $e->getMessage();
            $error = $e->getMessage();
            return response()->json($error);
        }
    }

    public function withdrawrow($id)
    {

        try {

            $user = Withdraw::where('withdraw.id', $id)
            ->select('users.name', 'withdraw.*')
            ->join('users', 'withdraw.user_id', '=', 'users.id')
            ->first();
           
            $checkWalletAddress     =  WalletAddress::where('user_id', $user->user_id)->first();
            $wallet_address         = !empty($checkWalletAddress->wallet_address) ? $checkWalletAddress->wallet_address : "";
            $data['datarow']        = $user;
            $data['created_at']     = !empty($user->created_at) ? date("d-m-Y H:i:s", strtotime($user->created_at)) : "";
            $data['remarks']        = !empty($user->remarks) ? $user->remarks : "";
            $data['wallet_address'] = $wallet_address;
            return response()->json($data);
           
        } catch (\Exception $e) {
            echo "Error: " . $e->getMessage();
            $error = $e->getMessage();
            return response()->json($error);
        }
    }

    public function getWithMethodRow(Request $request)
    {
        $data = WithdrawMethod::where('id', $request->id)->first();
        return response()->json($data);
    }
}
