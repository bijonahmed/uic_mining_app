<?php

namespace App\Http\Controllers\Store;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use Validator;
use Helper;
use App\Models\User;
use App\Models\Categorys;
use App\Category;
use App\Models\Category as ModelsCategory;
use App\Models\Mystore;
use App\Models\Service;
use App\Models\Deposit;
use App\Models\ExpenseHistory;
use Carbon\Carbon;
use App\Models\MystoreHistory;
use App\Models\Order;
use App\Models\ProductAttributes;
use App\Models\ProductAttributeValue;
use App\Models\Product;
use Illuminate\Support\Str;
use App\Rules\MatchOldPassword;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\JsonResponse;

use DB;
use Illuminate\Contracts\Cache\Store;

class StoreController extends Controller
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


    public function checkingStoreCounting()
    {
        $current_date           = date("Y-m-d");
        // Query to get active users by counting records per 'user_id' with 'end_date' >= current_date
        $userActiveMembers      = MystoreHistory::select('user_id', DB::raw('count(*) as total_count')) // Count per 'user_id'
            ->where('end_date', '>=', $current_date) // Condition for active stores
            ->groupBy('user_id') // Group by 'user_id'
            ->get();
        $allActiveMembersCount  = $userActiveMembers->count(); // This gives you the number of unique active users

        $userActiveStore        = MystoreHistory::where('end_date', '>=', $current_date) // Condition for active stores
            ->get();
        $activeStoreCount           = $userActiveStore->count(); // This gives you the number of unique active users
        $data['activeStoreCount']   = $activeStoreCount;
        $data['activeMembersCount'] = $allActiveMembersCount;
        return response()->json($data, 200);
    }



    public function getActiveStoreList()
    {

        $tobePaid               = Order::where('order_status', 1)->count();
        $tobeconfiremed         = Order::where('order_status', 2)->count();
        $goodsTobereceived      = Order::where('order_status', 3)->count();
        $platformprocced        = Order::where('order_status', 4)->count();
        $tobeshipped            = Order::where('order_status', 5)->count();
        $complete               = Order::where('order_status', 6)->count();
        $activeStores           = Categorys::whereIn('id',[1,2,3,4])->where('status', 1)->get();
        $tobePaid               = Order::where('order_status', 1)->count();
        

        $data = array(
            'tobePaid_count'         => $tobePaid,
            'tobeconfiremed_count'   => $tobeconfiremed,
            'goodsTobereceived_count'=> $goodsTobereceived,
            'platformprocced_count'  => $platformprocced,
            'tobeshipped_count'      => $tobeshipped,
            'complete_count'         => $complete,
            'activeStores'           => $activeStores,
            'tobePaid'               => $tobePaid,
            );

       
        
        return response()->json($data, 200);
    }



    public function storeActivationReport(Request $request)
    {
        // Get search query from the request

        $searchQuery            = $request->searchQuery;
        $chkUsersData           =  User::where('email', $searchQuery)->select('id', 'email', 'name', 'ref_id')->first();

        $commission_resp        = app('App\Http\Controllers\Dropshipping\DropUserController')->getComissionReportAdmin($chkUsersData->id);
        $commission_sum         = $commission_resp instanceof JsonResponse ? $commission_resp->getData(true)['commission_sum'] : 0;
        $downline_resp          = app('App\Http\Controllers\Dropshipping\DropUserController')->getDownlineDepositSum($chkUsersData->id);
        $downline_deposit_sum   = $downline_resp instanceof JsonResponse ? $downline_resp->getData(true)['downline_sum'] : 0;
        $downline_deposit_sum_1 = $downline_resp instanceof JsonResponse ? $downline_resp->getData(true)['downline_leve_1sum'] : 0;
        $downline_deposit_sum_2 = $downline_resp instanceof JsonResponse ? $downline_resp->getData(true)['downline_leve_2sum'] : 0;
        $downline_deposit_sum_3 = $downline_resp instanceof JsonResponse ? $downline_resp->getData(true)['downline_leve_3sum'] : 0;
        $downline_deposit_sum_4 = $downline_resp instanceof JsonResponse ? $downline_resp->getData(true)['downline_leve_4sum'] : 0;
        $downline_deposit_sum_5 = $downline_resp instanceof JsonResponse ? $downline_resp->getData(true)['downline_leve_5sum'] : 0;
        //dd($downline_deposit_sum);

        $allActiveCount   = 0;
        $allInactiveCount = 0;
        $current_date   = date("Y-m-d");
        $active_stores  = MystoreHistory::get();


        if (!empty($chkUsersData)) {

            $chkInviteUser  = User::where('id', $chkUsersData->ref_id)->select('name', 'phone_number', 'email', 'ref_id', 'id')->first();

            $inviteData['id']       = !empty($chkInviteUser->id) ? $chkInviteUser->id : "";
            $inviteData['name']     = !empty($chkInviteUser->name) ? $chkInviteUser->name : "";
            $inviteData['email']    = !empty($chkInviteUser->email) ? $chkInviteUser->email : "";

            $active_stores  = MystoreHistory::where('user_id', $chkUsersData->id)->get();
            //   dd($active_stores);
            if ($active_stores->isNotEmpty()) {
                // Initializing counters
                $storeArr = [];
                $activeCount = 0;
                $inactiveCount = 0;
                foreach ($active_stores as $store) {
                    $storeName = Categorys::where('id', $store->category_id)->select('id', 'name')->first();

                    if ($store->end_date >= $current_date) {
                        //echo "Active Store Store ID: {$store->mystore_id}, userID: {$store->user_id}, CategoryID: {$store->category_id}, End Date: {$store->end_date}" . "<br>";
                        $activeCount++; // Incrementing active store count
                        $storeArr[] = [
                            'store_id'          => !empty($storeName->id) ? $storeName->id : "",
                            'store_name'        => !empty($storeName->name) ? $storeName->name : "",
                            'start_date'        => $store->start_date,
                            'end_date'          => $store->end_date,
                            'status'            => "Active Store",
                        ];
                    } else {
                        //echo "Inactive Store Store ID: {$store->mystore_id}, userID: {$store->user_id}, CategoryID: {$store->category_id}, End Date: {$store->end_date}" . "<br>";
                        $inactiveCount++; // Incrementing inactive store count
                        $storeArr[] = [
                            'store_id'          => !empty($storeName->id) ? $storeName->id : "",
                            'store_name'        => !empty($storeName->name) ? $storeName->name : "",
                            'start_date'        => $store->start_date,
                            'end_date'          => $store->end_date,
                            'status'            => "Inactive Store",
                        ];
                    }
                    //END Logic
                }
                //dd($storeArr);
                $data['userData']            = $chkUsersData;
                $data['invite_user']         = $inviteData;
                $data['storeData']           = $storeArr;
                $data['user_activeStore']    = $activeCount;
                $data['user_inactiveStore']  = $inactiveCount;
                $data['all_inactiveStore']   = $allInactiveCount;
                $data['commission_sum']      = $commission_sum;
                $data['downline_deposit_sum'] = $downline_deposit_sum;
                $data['downline_deposit_sum_1'] = $downline_deposit_sum_1;
                $data['downline_deposit_sum_2'] = $downline_deposit_sum_2;
                $data['downline_deposit_sum_3'] = $downline_deposit_sum_3;
                $data['downline_deposit_sum_4'] = $downline_deposit_sum_4;
                $data['downline_deposit_sum_5'] = $downline_deposit_sum_5;

                return response()->json($data, 200);
            } else {

                $data['userData']            = $chkUsersData;
                $data['invite_user']         = "";
                $data['storeData']           = "";
                $data['user_activeStore']    = "";
                $data['user_inactiveStore']  = "";
                $data['all_inactiveStore']   = $allInactiveCount;
                $data['commission_sum']      = $commission_sum;
                $data['downline_deposit_sum'] = $downline_deposit_sum;
                $data['downline_deposit_sum'] = $downline_deposit_sum;
                $data['downline_deposit_sum_1'] = $downline_deposit_sum_1;
                $data['downline_deposit_sum_2'] = $downline_deposit_sum_2;
                $data['downline_deposit_sum_3'] = $downline_deposit_sum_3;
                $data['downline_deposit_sum_4'] = $downline_deposit_sum_4;
                $data['downline_deposit_sum_5'] = $downline_deposit_sum_5;
                return response()->json($data, 200);
            }
        }
    }

    public function insertService(Request $request)
    {
        // dd($request->all());
        $customMessages = [
            'mystore_id.required'  => 'Store ID is required.',
            'mystore_id.integer'   => 'Store ID must be an integer.',
            'duration.required'    => 'Duration is required.',
            'duration.integer'     => 'Duration must be an integer.',
        ];
        // Perform validation with custom messages
        $validator = Validator::make($request->all(), [
            'mystore_id'  => 'required',
            'duration'    => 'required|integer',
        ], $customMessages);

        // Check if validation fails
        if ($validator->fails()) {
            // Return error messages
            return response()->json(['errors' => $validator->errors()], 422);
        }
        $response       = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalance();
        $currentBalance = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;
        $store_price    = (int)$request->store_price; // Get the store price from the request
        // Check if the store price is greater than the current balance
        if ($store_price > $currentBalance) {
            //  return response()->json(['errors' => 'Insufficient balance. You need more funds to make this purchase.'], 422);
            $errors = [
                'mystore_id' => ['Insufficient balance. You need more deposit. You have Balance: ' . $currentBalance]
            ];
            return response()->json(['errors' => $errors], 422);
        } elseif ($store_price <= $currentBalance) {
            $selectedIds   = $request->mystore_id;
            //$mystore_id  = (int)$request->mystore_id;
            $duration      = (int)$request->duration;
            $store_price   = (int)$request->store_price;
            $idArray       = explode(',', $selectedIds);
            // dd($idArray);
            // Get the current date
            $startDate = Carbon::today(); // Today's date
            // Calculate the end date by adding 4 months
            $endDate = $startDate->copy()->addMonths($duration); // Copy to avoid modifying the original date
            // dd($idArray);
            foreach ($idArray as $id) {
                $chkstore   =  Mystore::where('id', $id)->select('id', 'category_id')->first();
                $storePrice =  Categorys::where('id', $chkstore->category_id)->select('id', 'store_price')->first();
                //$check    = Service::where('id', $id)->first();
                //dd($check);
                $data['user_id']      = $this->userid;
                $data['mystore_id']   = $id;
                $data['category_id']  = $chkstore->category_id;
                $data['service_price'] = $storePrice->store_price * $duration;
                $data['duration']     = $duration;
                $data['start_date']   = $startDate->format('Y-m-d');
                $data['end_date']     = $endDate->format('Y-m-d');
                $data['status']       = 1;
                // Example using Laravel's Eloquent ORM
                MystoreHistory::create($data);
            }
            foreach ($idArray as $id) {
                $chkstore   =  Mystore::where('id', $id)->select('id', 'category_id')->first();
                $storePrice =  Categorys::where('id', $chkstore->category_id)->select('id', 'store_price')->first();
                $hdata['user_id']           = $this->userid;
                $hdata['business_type']     = 'System';
                $hdata['operation_type']    = 'Reduce';
                $hdata['amount_type']       = 'Valid';
                $hdata['operation_amount']  = $storePrice->store_price * $duration;
                $hdata['charge_description'] = "Buy service pack*1(Decrease in effective amount)";
                $hdata['operation_date']    = date("Y-m-d");
                // Example using Laravel's Eloquent ORM
                ExpenseHistory::create($hdata);
            }
            return response()->json("Successfully insert store", 200); //Mystore
        }
    }

    public function mystoreInfo()
    {
        $userId = $this->userid;

        $getCategoryList = Categorys::select('id', 'name')->where('parent_id', 0)->where('status', 1)->get();
        foreach ($getCategoryList as $category) {
            // Check if a record with the same user_id and category_id exists
            $existingRecord = Mystore::where('user_id', $userId) // Assuming $userId is the current user's ID
                ->where('category_id', $category->id)
                ->exists();
            // If no record exists, insert the new record
            if (!$existingRecord) {
                $mystoreData = [
                    'user_id' => $userId, // Assuming $userId is the current user's ID
                    'category_id' => $category->id,
                ];
                // Assuming you have a model for 'mystore', you can use it like this:
                Mystore::create($mystoreData);
            }
        }

        $mystoreRecords = Mystore::join('categorys', 'mystore.category_id', '=', 'categorys.id')
            ->where('mystore.user_id', $userId)
            ->get(['mystore.*', 'categorys.name as category_name', 'categorys.store_images']);

        $result = [];
        foreach ($mystoreRecords as $v) {
            $result[] = [
                'my_store_id'   => $v->id,
                'category_id'   => $v->category_id,
                'category_name' => $v->category_name,
                'store_images'  => url($v->store_images)
            ];
        }

        return response()->json($result); //Mystore
    }

    public function checkMystoreData(Request $request)
    {
        $my_store_id = $request->my_store_id;
        $getrow      = Mystore::join('categorys', 'mystore.category_id', '=', 'categorys.id')
            ->select('categorys.id', 'categorys.name')
            ->where('mystore.id', $my_store_id)
            ->where('mystore.user_id', $this->userid)->first();
        //echo "UserID: ".$this->userid;
        $depositAmt      = Deposit::where('user_id', $this->userid)->where('status', 1)->sum('receivable_amount');
        $expenseHistory  = MystoreHistory::where('user_id', $this->userid)->sum('service_price');
        //dd($expenseHistory);

        $data['category_name']  = !empty($getrow) ? $getrow->name : "";
        $data['deposit_amount'] =  $depositAmt - (int)$expenseHistory;
        //dd($data);
        return response()->json($data, 200);
    }

    public function getAllServices()
    {
        $data = Mystore::where('mystore.user_id', $this->userid)->get();
        $result = [];
        foreach ($data as $v) {
            $chk_category  = Categorys::where('id', $v->category_id)->first();
            $checkrow = MystoreHistory::where('mystore_id', $v->id)->first();
            // Get start date and end date from the checkrow, or use defaults
            $startDate = $checkrow->start_date ?? ""; // Null coalescing to handle null cases
            $endDate = !empty($checkrow->end_date) ? Carbon::parse($checkrow->end_date) : null;
            // Current date
            $currentDate = Carbon::today(); // Using Carbon for date operations
            // Determine the status based on end date
            if ($endDate && $currentDate->gt($endDate)) {
                $status = "Inactive"; // If current date is greater than end date, it's inactive
            } else {
                $status = isset($checkrow->status) && $checkrow->status ? "Active" : "Inactive";
            }
            $result[] = [
                'id'            => $v->id,
                'name'          => !empty($chk_category->name) ? $chk_category->name : "",
                'store_price'   => !empty($chk_category->store_price) ? $chk_category->store_price : "", //$v->store_price,
                'status'        => $status, //isset($checkrow->status) && $checkrow->status ? "Active" : "Inactive",
                'end_date'      => !empty($checkrow->end_date) ? $checkrow->end_date : "",
                'duration'      => 0,

            ];
        }
        $data['storeData'] = $result;
        //dd($data);
        return response()->json($data, 200);
    }

    // Store Calculation 

    public function activeInactiveStoreLevelFive()
    {

        $userId = $this->userid;
        // Fetch level 1 users
        $checkL1 = User::where('ref_id', $userId)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        // Extract IDs from level 1 users
        $level1_ids = $checkL1->pluck('id')->toArray();
        // Fetch level 2 users based on level 1 IDs
        $checkL2 = User::whereIn('ref_id', $level1_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level2_ids = $checkL2->pluck('id')->toArray();
        // Fetch level 3 users based on level 1 IDs
        $checkL3 = User::whereIn('ref_id', $level2_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level3_ids = $checkL3->pluck('id')->toArray();
        // Fetch level 4 users based on level 1 IDs
        $checkL4 = User::whereIn('ref_id', $level3_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level4_ids = $checkL4->pluck('id')->toArray();
        // Fetch level 5 users based on level 1 IDs
        $checkL5 = User::whereIn('ref_id', $level4_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $levels = [];
        // Combine all users into a single array
        // Combine all users into one array
        $allUsers = array_merge($checkL5->toArray());
        // Total number of users
        $userCount = count($allUsers);
        // Calculate the number of active shops
        $activeShopCount = 0;
        $today = Carbon::today();
        foreach ($allUsers as $user) {
            // Fetch shops for each user
            $shops = MystoreHistory::where('user_id', $user['id'])->get();

            foreach ($shops as $shop) {
                if ($today->gt(Carbon::parse($shop->end_date))) {
                    // Shop is inactive
                    continue;
                }
                // If shop is active, increment the count
                $activeShopCount++;
            }
        }

        // Calculate the number of inactive shops
        $inactiveShopCount = $userCount - $activeShopCount;

        // Return the summary
        return response()->json([
            'number_of_users' => $userCount,
            'active_shop_count' => $activeShopCount,
            'inactive_shop_count' => $inactiveShopCount,
        ]);

        return response()->json($levels);
    }

    public function activeInactiveStoreLevelFour()
    {

        $userId = $this->userid;
        // Fetch level 1 users
        $checkL1 = User::where('ref_id', $userId)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        // Extract IDs from level 1 users
        $level1_ids = $checkL1->pluck('id')->toArray();
        // Fetch level 2 users based on level 1 IDs
        $checkL2 = User::whereIn('ref_id', $level1_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level2_ids = $checkL2->pluck('id')->toArray();
        // Fetch level 3 users based on level 1 IDs
        $checkL3 = User::whereIn('ref_id', $level2_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level3_ids = $checkL3->pluck('id')->toArray();
        // Fetch level 4 users based on level 1 IDs
        $checkL4 = User::whereIn('ref_id', $level3_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level4_ids = $checkL4->pluck('id')->toArray();
        // Fetch level 5 users based on level 1 IDs
        $checkL5 = User::whereIn('ref_id', $level4_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();

        $levels = [];
        // Combine all users into a single array
        // Combine all users into one array
        $allUsers = array_merge($checkL4->toArray());

        // Total number of users
        $userCount = count($allUsers);

        // Calculate the number of active shops
        $activeShopCount = 0;
        $today = Carbon::today();

        foreach ($allUsers as $user) {
            // Fetch shops for each user
            $shops = MystoreHistory::where('user_id', $user['id'])->get();

            foreach ($shops as $shop) {
                if ($today->gt(Carbon::parse($shop->end_date))) {
                    // Shop is inactive
                    continue;
                }
                // If shop is active, increment the count
                $activeShopCount++;
            }
        }

        // Calculate the number of inactive shops
        $inactiveShopCount = $userCount - $activeShopCount;

        // Return the summary
        return response()->json([
            'number_of_users' => $userCount,
            'active_shop_count' => $activeShopCount,
            'inactive_shop_count' => $inactiveShopCount,
        ]);

        return response()->json($levels);
    }
    public function activeInactiveStoreLevelThree()
    {

        $userId = $this->userid;
        // Fetch level 1 users
        $checkL1 = User::where('ref_id', $userId)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        // Extract IDs from level 1 users
        $level1_ids = $checkL1->pluck('id')->toArray();
        // Fetch level 2 users based on level 1 IDs
        $checkL2 = User::whereIn('ref_id', $level1_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level2_ids = $checkL2->pluck('id')->toArray();
        // Fetch level 3 users based on level 1 IDs
        $checkL3 = User::whereIn('ref_id', $level2_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();

        $levels = [];
        // Combine all users into a single array
        // Combine all users into one array
        $allUsers = array_merge($checkL3->toArray());

        // Total number of users
        $userCount = count($allUsers);

        // Calculate the number of active shops
        $activeShopCount = 0;
        $today = Carbon::today();

        foreach ($allUsers as $user) {
            // Fetch shops for each user
            $shops = MystoreHistory::where('user_id', $user['id'])->get();

            foreach ($shops as $shop) {
                if ($today->gt(Carbon::parse($shop->end_date))) {
                    // Shop is inactive
                    continue;
                }
                // If shop is active, increment the count
                $activeShopCount++;
            }
        }

        // Calculate the number of inactive shops
        $inactiveShopCount = $userCount - $activeShopCount;

        // Return the summary
        return response()->json([
            'number_of_users' => $userCount,
            'active_shop_count' => $activeShopCount,
            'inactive_shop_count' => $inactiveShopCount,
        ]);

        return response()->json($levels);
    }

    public function activeInactiveStoreLevelTwo()
    {

        $userId = $this->userid;
        // Fetch level 1 users
        $checkL1 = User::where('ref_id', $userId)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        // Extract IDs from level 1 users
        $level1_ids = $checkL1->pluck('id')->toArray();
        // Fetch level 2 users based on level 1 IDs
        $checkL2 = User::whereIn('ref_id', $level1_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();

        $levels = [];
        // Combine all users into a single array
        // Combine all users into one array
        $allUsers = array_merge($checkL2->toArray());

        // Total number of users
        $userCount = count($allUsers);

        // Calculate the number of active shops
        $activeShopCount = 0;
        $today = Carbon::today();

        foreach ($allUsers as $user) {
            // Fetch shops for each user
            $shops = MystoreHistory::where('user_id', $user['id'])->get();

            foreach ($shops as $shop) {
                if ($today->gt(Carbon::parse($shop->end_date))) {
                    // Shop is inactive
                    continue;
                }
                // If shop is active, increment the count
                $activeShopCount++;
            }
        }

        // Calculate the number of inactive shops
        $inactiveShopCount = $userCount - $activeShopCount;

        // Return the summary
        return response()->json([
            'number_of_users' => $userCount,
            'active_shop_count' => $activeShopCount,
            'inactive_shop_count' => $inactiveShopCount,
        ]);

        return response()->json($levels);
    }
    public function activeInactiveStoreLevelOne()
    {

        $userId = $this->userid;
        // Fetch level 1 users
        $checkL1 = User::where('ref_id', $userId)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        // Initialize levels with additional data
        $levels = [];
        // Combine all users into a single array
        // Combine all users into one array
        $allUsers = array_merge($checkL1->toArray());

        // Total number of users
        $userCount = count($allUsers);

        // Calculate the number of active shops
        $activeShopCount = 0;
        $today = Carbon::today();

        foreach ($allUsers as $user) {
            // Fetch shops for each user
            $shops = MystoreHistory::where('user_id', $user['id'])->get();

            foreach ($shops as $shop) {
                if ($today->gt(Carbon::parse($shop->end_date))) {
                    // Shop is inactive
                    continue;
                }
                // If shop is active, increment the count
                $activeShopCount++;
            }
        }

        // Calculate the number of inactive shops
        $inactiveShopCount = $userCount - $activeShopCount;

        // Return the summary
        return response()->json([
            'number_of_users' => $userCount,
            'active_shop_count' => $activeShopCount,
            'inactive_shop_count' => $inactiveShopCount,
        ]);

        return response()->json($levels);
    }
    public function activeInactiveStore()
    {

        $userId = $this->userid;
        // Fetch level 1 users
        $checkL1 = User::where('ref_id', $userId)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        // Extract IDs from level 1 users
        $level1_ids = $checkL1->pluck('id')->toArray();
        // Fetch level 2 users based on level 1 IDs
        $checkL2 = User::whereIn('ref_id', $level1_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level2_ids = $checkL2->pluck('id')->toArray();
        // Fetch level 3 users based on level 1 IDs
        $checkL3 = User::whereIn('ref_id', $level2_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level3_ids = $checkL3->pluck('id')->toArray();
        // Fetch level 4 users based on level 1 IDs
        $checkL4 = User::whereIn('ref_id', $level3_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level4_ids = $checkL4->pluck('id')->toArray();
        // Fetch level 5 users based on level 1 IDs
        $checkL5 = User::whereIn('ref_id', $level4_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        // Initialize levels with additional data
        $levels = [];
        // Combine all users into a single array
        // Combine all users into one array
        $allUsers = array_merge($checkL1->toArray(), $checkL2->toArray(), $checkL3->toArray(), $checkL4->toArray(), $checkL5->toArray());

        // Total number of users
        $userCount = count($allUsers);

        // Calculate the number of active shops
        $activeShopCount = 0;
        $today = Carbon::today();

        foreach ($allUsers as $user) {
            // Fetch shops for each user
            $shops = MystoreHistory::where('user_id', $user['id'])->get();

            foreach ($shops as $shop) {
                if ($today->gt(Carbon::parse($shop->end_date))) {
                    // Shop is inactive
                    continue;
                }
                // If shop is active, increment the count
                $activeShopCount++;
            }
        }

        // Calculate the number of inactive shops
        $inactiveShopCount = $userCount - $activeShopCount;

        // Return the summary
        return response()->json([
            'number_of_users' => $userCount,
            'active_shop_count' => $activeShopCount,
            'inactive_shop_count' => $inactiveShopCount,
        ]);

        return response()->json($levels);
    }

    public function getMyPartnersAdmin(Request $request)
    {
        $chkPoint = User::where('email', $request->searchQuery)->first();

        if (!empty($chkPoint)) {

            $userId = $chkPoint->id;
            // Fetch level 1 users
            $checkL1 = User::where('ref_id', $userId)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            // Extract IDs from level 1 users
            $level1_ids = $checkL1->pluck('id')->toArray();
            // Fetch level 2 users based on level 1 IDs
            $checkL2 = User::whereIn('ref_id', $level1_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level2_ids = $checkL2->pluck('id')->toArray();
            // Fetch level 3 users based on level 1 IDs
            $checkL3 = User::whereIn('ref_id', $level2_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level3_ids = $checkL3->pluck('id')->toArray();
            // Fetch level 4 users based on level 1 IDs
            $checkL4 = User::whereIn('ref_id', $level3_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level4_ids = $checkL4->pluck('id')->toArray();
            // Fetch level 5 users based on level 1 IDs
            $checkL5 = User::whereIn('ref_id', $level4_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level5_ids = $checkL5->pluck('id')->toArray();
            // Group all the check levels into an array
            $checkLevels = [$checkL1, $checkL2, $checkL3, $checkL4, $checkL5];
            $levels = [];

            $current_date   = date("Y-m-d");
            foreach ($checkLevels as $level => $users) {
                $levelData = ['level' => $level, 'user_count' => count($users), 'users' => []];
                foreach ($users as $user) {
                    // $active_stores  = MystoreHistory::where('end_date', '>=', $current_date)->where('user_id', $user->id)->first();
                    $active_stores  = MystoreHistory::where('user_id', $user->id)->get();
                    //MystoreHistory::where('user_id', $user->id)->get();
                    $storeInfoList = []; // List to hold formatted store information
                    // Loop through each store and construct a formatted string
                    foreach ($active_stores as $store) {
                        $catName =  Categorys::where('id', $store->category_id)->first();
                        if ($store->end_date >= $current_date) {
                            $storeInfoList[] = [
                                'id'                => $store->user_id,
                                'start_date'        => date("Y-M-d", strtotime($store->start_date)),
                                'end_date'          => date("Y-M-d", strtotime($store->end_date)),
                                'store_name'        => !empty($catName->name) ? $catName->name : "",
                                'status'            => "Active Store",
                            ];
                            //"Store User ID: {$store->user_id}, Start Date: " . date("Y-M-d", strtotime($store->start_date)) . ", End Date: " . date("Y-M-d", strtotime($store->end_date));
                        }
                    }

                    $levelData['users'][] = [
                        'id'        => $user->id,
                        'name'      => $user->name,
                        'email'     => $user->email,
                        'inviteCode' => $user->inviteCode,
                        'storeInfo'  => $storeInfoList,
                        'created_at' => date("Y-M-d", strtotime($user->created_at)),
                    ];
                }
                $levels[] = $levelData;
            }

            return response()->json($levels);
        } else {
            return response()->json("Invalid request", 404);
        }
    }

    public function getMyPartners()
    {
        $userId = $this->userid;
        // Fetch level 1 users
        $checkL1 = User::where('ref_id', $userId)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        // Extract IDs from level 1 users
        $level1_ids = $checkL1->pluck('id')->toArray();
        // Fetch level 2 users based on level 1 IDs
        $checkL2 = User::whereIn('ref_id', $level1_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level2_ids = $checkL2->pluck('id')->toArray();
        // Fetch level 3 users based on level 1 IDs
        $checkL3 = User::whereIn('ref_id', $level2_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level3_ids = $checkL3->pluck('id')->toArray();
        // Fetch level 4 users based on level 1 IDs
        $checkL4 = User::whereIn('ref_id', $level3_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level4_ids = $checkL4->pluck('id')->toArray();
        // Fetch level 5 users based on level 1 IDs
        $checkL5 = User::whereIn('ref_id', $level4_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
        $level5_ids = $checkL5->pluck('id')->toArray();
        // Group all the check levels into an array
        // Group all the check levels into an array
        $checkLevels = [$level1_ids, $level2_ids, $level3_ids, $level4_ids, $level5_ids];
        $checkLevelsCount = [];
        foreach ($checkLevels as $level) {
            $checkLevelsCount[] = count($level);
        }

        $sum = array_sum($checkLevelsCount);
        return response()->json($sum);
    }
}
