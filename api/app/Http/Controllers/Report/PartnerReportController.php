<?php

namespace App\Http\Controllers\Report;

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
use App\Models\Deposit;
use App\Models\ExpenseHistory;
use App\Models\Mystore;
use App\Models\MystoreHistory;
use App\Models\WishList;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Carbon\Carbon;
use Faker\Core\Number;
use Illuminate\Support\Facades\DB;
use Psy\Readline\Transient;

class PartnerReportController extends Controller
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

    public function levelOnePartnerReport(Request $request)
    {

            $searchQuery            = $request->searchQuery;
            $chkUsersData           =  User::where('email', $searchQuery)->select('id', 'email', 'name', 'ref_id')->first();
            $userId                 = $this->userid;
            
            //Level-1
            $checkL1 = User::where('ref_id', $userId)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();

            // Group all the check levels into an array
            //$checkLevels = [$checkL1, $checkL2, $checkL3, $checkL4, $checkL5];
            //start
            $commission_resp        = app('App\Http\Controllers\Dropshipping\DropUserController')->getComissionReportAdmin($userId);
            $commission_sum         = $commission_resp instanceof JsonResponse ? $commission_resp->getData(true)['commission_sum'] : 0;
            $downline_resp          = app('App\Http\Controllers\Dropshipping\DropUserController')->getDownlineDepositSum($userId);
            //dd($commission_sum);
            $downline_deposit_sum   = $downline_resp instanceof JsonResponse ? $downline_resp->getData(true)['downline_sum'] : 0;
            $downline_deposit_sum_1 = $downline_resp instanceof JsonResponse ? $downline_resp->getData(true)['downline_leve_1sum'] : 0;
            $downline_deposit_sum_2 = $downline_resp instanceof JsonResponse ? $downline_resp->getData(true)['downline_leve_2sum'] : 0;
            $downline_deposit_sum_3 = $downline_resp instanceof JsonResponse ? $downline_resp->getData(true)['downline_leve_3sum'] : 0;
            $downline_deposit_sum_4 = $downline_resp instanceof JsonResponse ? $downline_resp->getData(true)['downline_leve_4sum'] : 0;
            $downline_deposit_sum_5 = $downline_resp instanceof JsonResponse ? $downline_resp->getData(true)['downline_leve_5sum'] : 0;
            //end

            $checkLevels = [$checkL1];
            $levels = [];
            $current_date   = date("Y-m-d");
            $level_comission_sum = 0;
            foreach ($checkLevels as $level => $users) {

                $levelData = ['level' => $level, 'user_count' => count($users), 'users' => []];
                foreach ($users as $user) {
                    $active_stores  = MystoreHistory::where('user_id', $user->id)->get();

                    //$response               = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalanceCheckAdminIndivUser($user->id);
                    //$currentBalance         = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;
                    //comission
                    //$response_commission    = app('App\Http\Controllers\Dropshipping\DropUserController')->getComissionReportAdmin($user->id);
                    //$comission              = $response_commission instanceof JsonResponse ? $response_commission->getData(true)['commission_sum'] : 0;
                    //$level_comission_sum += $comission;

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
                        'id'                     => $user->id,
                        'name'                   => $user->name,
                        'email'                  => $user->email,
                        'inviteCode'             => $user->inviteCode,
                        'storeInfo'              => $storeInfoList,
                       // 'commission'             => !empty($comission) ? number_format($comission, 2) : "0.00",
                       // 'depositAmt'             => !empty($depositAmt) ? number_format($depositAmt, 2) : "0.00",
                       // 'currentBalance'         => !empty($currentBalance) ? number_format($currentBalance, 2) : "0.00",
                        'created_at'             => date("Y-M-d H:i:s", strtotime($user->created_at)),
                    ];
                }
                $levels[] = $levelData;
            }
            //dd($levels);
            $level1Count = $checkL1->count();
            $data['usersData']              = $levels;
            $data['commission_1']           = $level_comission_sum;
            $data['partner_count_1']        = $level1Count;
            $data['downline_deposit_sum_1'] = $downline_deposit_sum_1;
            $data['downline_deposit_sum_2'] = $downline_deposit_sum_2;
            $data['downline_deposit_sum_3'] = $downline_deposit_sum_3;
            $data['downline_deposit_sum_4'] = $downline_deposit_sum_4;
            $data['downline_deposit_sum_5'] = $downline_deposit_sum_5;
            //dd($data['downline_deposit_sum_1']);
            return response()->json($data, 200);
      
    }

    public function levelTwoPartnerReport(Request $request)
    {

        $searchQuery            = $request->searchQuery;
        $chkUsersData           =  User::where('email', $searchQuery)->select('id', 'email', 'name', 'ref_id')->first();

            $userId                 = $this->userid;
            //Level-1
            $checkL1 = User::where('ref_id', $userId)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level1_ids = $checkL1->pluck('id')->toArray();
            //Level-2
            $checkL2 = User::whereIn('ref_id', $level1_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level2_ids = $checkL2->pluck('id')->toArray();
            //dd($checkL2);
            // Group all the check levels into an array
            //$checkLevels = [$checkL1, $checkL2, $checkL3, $checkL4, $checkL5];
            //start
            $commission_resp        = app('App\Http\Controllers\Dropshipping\DropUserController')->getComissionReportAdmin($userId);
            $commission_sum         = $commission_resp instanceof JsonResponse ? $commission_resp->getData(true)['commission_sum'] : 0;
            $downline_resp          = app('App\Http\Controllers\Dropshipping\DropUserController')->getDownlineDepositSum($userId);

            $checkLevels = [$checkL2];
            $levels = [];
            $current_date   = date("Y-m-d");
            $level_comission_sum = 0;
            foreach ($checkLevels as $level => $users) {
                $levelData = ['level' => $level, 'user_count' => count($users), 'users' => []];
                foreach ($users as $user) {
                    $active_stores  = MystoreHistory::where('user_id', $user->id)->get();

                    // $response               = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalanceCheckAdminIndivUser($user->id);
                    // $currentBalance         = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;
                    // //comission
                    // $response_commission    = app('App\Http\Controllers\Dropshipping\DropUserController')->getComissionReportAdmin($user->id);
                    // $comission              = $response_commission instanceof JsonResponse ? $response_commission->getData(true)['commission_sum'] : 0;
                    // $level_comission_sum += $comission;

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
                        'id'                     => $user->id,
                        'name'                   => $user->name,
                        'email'                  => $user->email,
                        'inviteCode'             => $user->inviteCode,
                        'storeInfo'              => $storeInfoList,
                        // 'commission'             => !empty($comission) ? number_format($comission, 2) : "0.00",
                        // 'depositAmt'             => !empty($depositAmt) ? number_format($depositAmt, 2) : "0.00",
                        // 'currentBalance'         => !empty($currentBalance) ? number_format($currentBalance, 2) : "0.00",
                        'created_at'             => date("Y-M-d H:i:s", strtotime($user->created_at)),
                    ];
                }
                $levels[] = $levelData;
            }
           // $level1Count = $checkL1->count();
            $level2Count = $checkL2->count();
            //dd($levels);
            $data['partner_count_2']        = $level2Count;
            $data['usersData']              = $levels;
            $data['commission_2']           = $level_comission_sum;
            return response()->json($data, 200);
        
    }


    public function levelThreePartnerReport(Request $request)
    {


        $searchQuery            = $request->searchQuery;
        $chkUsersData           =  User::where('email', $searchQuery)->select('id', 'email', 'name', 'ref_id')->first();

            $userId                 = $this->userid;
            //Level-1
            $checkL1 = User::where('ref_id', $userId)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level1_ids = $checkL1->pluck('id')->toArray();
            //Level-2
            $checkL2 = User::whereIn('ref_id', $level1_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level2_ids = $checkL2->pluck('id')->toArray();
            //Level-3
            $checkL3 = User::whereIn('ref_id', $level2_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
             
            // Group all the check levels into an array
            //$checkLevels = [$checkL1, $checkL2, $checkL3, $checkL4, $checkL5];

            $checkLevels = [$checkL3];
            $levels = [];
            $current_date   = date("Y-m-d");
            $level_comission_sum = 0;
            $count = 0;
            foreach ($checkLevels as $level => $users) {
                $count++;
                $levelData = ['level' => $level, 'user_count' => count($users), 'users' => []];
                foreach ($users as $user) {
                    $active_stores  = MystoreHistory::where('user_id', $user->id)->get();

                    // $response               = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalanceCheckAdminIndivUser($user->id);
                    // $currentBalance         = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;
                    // //comission
                    // $response_commission    = app('App\Http\Controllers\Dropshipping\DropUserController')->getComissionReportAdmin($user->id);
                    // $comission              = $response_commission instanceof JsonResponse ? $response_commission->getData(true)['commission_sum'] : 0;
                    // $level_comission_sum += $comission;

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
                        'id'                     => $user->id,
                        'name'                   => $user->name,
                        'email'                  => $user->email,
                        'inviteCode'             => $user->inviteCode,
                        'storeInfo'              => $storeInfoList,
                        // 'commission'             => !empty($comission) ? number_format($comission, 2) : "0.00",
                        // 'depositAmt'             => !empty($depositAmt) ? number_format($depositAmt, 2) : "0.00",
                        // 'currentBalance'         => !empty($currentBalance) ? number_format($currentBalance, 2) : "0.00",
                        'created_at'             => date("Y-M-d H:i:s", strtotime($user->created_at)),
                    ];
                }
                $levels[] = $levelData;
            }
          
            $level3Count = $checkL3->count();
            //dd($levels);
            $data['partner_count_3']        = $level3Count;
            $data['usersData']              = $levels;
            $data['commission_3']           = number_format($level_comission_sum, 2);
            return response()->json($data, 200);
       
    }


    public function levelFourPartnerReport(Request $request)
    {

        $searchQuery            = $request->searchQuery;
        $chkUsersData           =  User::where('email', $searchQuery)->select('id', 'email', 'name', 'ref_id')->first();

            $userId             = $this->userid;
            //Level-1
            $checkL1 = User::where('ref_id', $userId)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level1_ids = $checkL1->pluck('id')->toArray();
            //Level-2
            $checkL2 = User::whereIn('ref_id', $level1_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level2_ids = $checkL2->pluck('id')->toArray();
            //Level-3
            $checkL3 = User::whereIn('ref_id', $level2_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level3_ids = $checkL3->pluck('id')->toArray();
            //Level-4
            $checkL4 = User::whereIn('ref_id', $level3_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();

            // Group all the check levels into an array
            //$checkLevels = [$checkL1, $checkL2, $checkL3, $checkL4, $checkL5];

            $checkLevels = [$checkL4];
            $levels = [];
            $current_date   = date("Y-m-d");
            $level_comission_sum = 0;
            foreach ($checkLevels as $level => $users) {
                $levelData = ['level' => $level, 'user_count' => count($users), 'users' => []];
                foreach ($users as $user) {
                    $active_stores  = MystoreHistory::where('user_id', $user->id)->get();

                    // $response               = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalanceCheckAdminIndivUser($user->id);
                    // $currentBalance         = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;
                    // //comission
                    // $response_commission    = app('App\Http\Controllers\Dropshipping\DropUserController')->getComissionReportAdmin($user->id);
                    // $comission              = $response_commission instanceof JsonResponse ? $response_commission->getData(true)['commission_sum'] : 0;
                    // $level_comission_sum += $comission;

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
                        'id'                     => $user->id,
                        'name'                   => $user->name,
                        'email'                  => $user->email,
                        'inviteCode'             => $user->inviteCode,
                        'storeInfo'              => $storeInfoList,
                        'commission'             => !empty($comission) ? number_format($comission, 2) : "0.00",
                        // 'depositAmt'             => !empty($depositAmt) ? number_format($depositAmt, 2) : "0.00",
                        // 'currentBalance'         => !empty($currentBalance) ? number_format($currentBalance, 2) : "0.00",
                        'created_at'             => date("Y-M-d H:i:s", strtotime($user->created_at)),
                    ];
                }
                $levels[] = $levelData;
            }
          
            $level4Count = $checkL4->count();
            $data['partner_count_4']        = $level4Count;
            $data['usersData']              = $levels;
            $data['commission_4']           = number_format($level_comission_sum, 2);
            return response()->json($data, 200);
      
    }

    public function levelFivePartnerReport(Request $request)
    {

        $searchQuery            = $request->searchQuery;
        $chkUsersData           =  User::where('email', $searchQuery)->select('id', 'email', 'name', 'ref_id')->first();

            $userId             = $this->userid;
            // $dd =$this->getUserLevels($userId);
            //Level-1
            $checkL1 = User::where('ref_id', $userId)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level1_ids = $checkL1->pluck('id')->toArray();
            //Level-2
            $checkL2 = User::whereIn('ref_id', $level1_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level2_ids = $checkL2->pluck('id')->toArray();
            //Level-3
            $checkL3 = User::whereIn('ref_id', $level2_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level3_ids = $checkL3->pluck('id')->toArray();
            //Level-4
            $checkL4 = User::whereIn('ref_id', $level3_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level4_ids = $checkL4->pluck('id')->toArray();
            //Level-5
            $checkL5 = User::whereIn('ref_id', $level4_ids)->select('id', 'name', 'email', 'created_at', 'ref_id')->get();
            $level5_ids = $checkL5->pluck('id')->toArray();
            // Group all the check levels into an array
            //$checkLevels = [$checkL1, $checkL2, $checkL3, $checkL4, $checkL5];

            $checkLevels = [$checkL5];
            $levels = [];
            $current_date   = date("Y-m-d");
            $level_comission_sum = 0;
            foreach ($checkLevels as $level => $users) {
                $levelData = ['level' => $level, 'user_count' => count($users), 'users' => []];
                foreach ($users as $user) {
                    $active_stores  = MystoreHistory::where('user_id', $user->id)->get();

                    // $response               = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalanceCheckAdminIndivUser($user->id);
                    // $currentBalance         = $response instanceof JsonResponse ? $response->getData(true)['currentbalance'] : 0;
                    // //comission
                    $response_commission    = app('App\Http\Controllers\Dropshipping\DropUserController')->getComissionReportAdmin($user->id);
                    $comission              = $response_commission instanceof JsonResponse ? $response_commission->getData(true)['commission_sum'] : 0;
                    $level_comission_sum += $comission;

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
                        'id'                     => $user->id,
                        'name'                   => $user->name,
                        'email'                  => $user->email,
                        'inviteCode'             => $user->inviteCode,
                        'storeInfo'              => $storeInfoList,
                        'commission'             => !empty($comission) ? number_format($comission, 2) : "0.00",
                        // 'depositAmt'             => !empty($depositAmt) ? number_format($depositAmt, 2) : "0.00",
                        // 'currentBalance'         => !empty($currentBalance) ? number_format($currentBalance, 2) : "0.00",
                        'created_at'             => date("Y-M-d H:i:s", strtotime($user->created_at)),
                    ];
                }
                $levels[] = $levelData;
            }
           
            $level5Count = $checkL5->count();
            $data['partner_count_5']        = $level5Count;
            $data['usersData']              = $levels;
            $data['commission_5']           = number_format($level_comission_sum, 2);
            return response()->json($data, 200);
     
    }

    public function getUserLevels($userId)
    {
        $checkLevels = [];

        // Initialize level 1 with the provided user's ID
        $levelIds = [$userId];

        // Loop through levels 1 to 5
        for ($i = 1; $i <= 5; $i++) {
            // Get users for the current level
            $checkLevel = User::whereIn('ref_id', $levelIds)
                ->select('id', 'name', 'email', 'created_at', 'ref_id')
                ->get();

            // Add the current level users to the checkLevels array
            $checkLevels[] = $checkLevel;

            // Update the levelIds array with the IDs of users from the current level
            $levelIds = $checkLevel->pluck('id')->toArray();
        }

        return $checkLevels;
    }
}
