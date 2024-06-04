<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Community;
use App\Models\Deposit;
use App\Models\ExpenseHistory;
use App\Models\ManualAdjustment;
use App\Models\ManualAdjustmentDelete;
use App\Models\MystoreHistory;
use App\Models\Order;
use Illuminate\Http\Request;
use Auth;
use Validator;
use Helper;
use App\Models\User;
use App\Models\Profile;
use App\Models\RuleModel;
use App\Models\WalletAddress;
use App\Models\Withdraw;
use Illuminate\Support\Str;
use App\Rules\MatchOldPassword;
use Illuminate\Support\Facades\Hash;
use DB;
use File;
use PhpParser\Node\Stmt\TryCatch;
use function Ramsey\Uuid\v1;
use Illuminate\Http\JsonResponse;

class UserController extends Controller
{
    protected $frontend_url;
    protected $userid;
    protected $email;
    public function __construct(Request $request)
    {
        $this->middleware('auth:api');
        $id = auth('api')->user();
        if (!empty($id)) {
            $user = User::find($id->id);
            $this->userid = $user->id;
            $this->email = $user->email;
        }
    }

    public function me()
    {
        $me = auth('api')->user();
        return response()->json($me);
    }
    public function getCommunity(){

        try {
            $categories = Community::where('status', 1)->get();
            return response()->json($categories);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }


        
    }
    public function adujustmentrow($id)
    {
        $row = ManualAdjustment::where('manual_adjustment.id', (int)$id)
            ->select('manual_adjustment.*', 'users.name', 'users.email')
            ->leftJoin('users', 'manual_adjustment.user_id', '=', 'users.id')
            ->first();
        $response = [
            'data' => $row,
            'message' => 'success'
        ];
        return response()->json($response, 200);
    }

    public function checkminusAmount()
    {

        $usersWithNegativeBalance = User::where('available_balance', '<', 0)->get();
        $response = [
            'data' => $usersWithNegativeBalance,
            'message' => 'success'
        ];
        return response()->json($response, 200);
    }

    public function saveRole(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'status' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        $data = User::addEditRole($request->all());
        $response = [
            'data' => $data,
            'message' => 'success'
        ];
        return response()->json($response, 200);
    }
    public function getUsersList(Request $request)
    {
        $data = User::getUsersList($request->all());
        $response = [
            'data' => $data,
            'message' => 'success'
        ];
        return response()->json($response, 200);
    }

    public function getDepartmentList(Request $request)
    {
        try {
            $rows = User::allDepartment($request->all());
            $response = [
                'data' => $rows,
                'message' => 'success'
            ];
        } catch (\Throwable $th) {
            $response = [
                'data' => [],
                'message' => 'failed'
            ];
        }
        return response()->json($response, 200);
    }
    public function typeofdoucments(Request $request)
    {
        try {
            $rows = User::alltypedocutms($request->all());
            $response = [
                'data' => $rows,
                'message' => 'success'
            ];
        } catch (\Throwable $th) {
            $response = [
                'data' => [],
                'message' => 'failed'
            ];
        }
        return response()->json($response, 200);
    }
    public function getDesignationList(Request $request)
    {
        try {
            $rows = User::allDesignation($request->all());
            $response = [
                'data' => $rows,
                'message' => 'success'
            ];
        } catch (\Throwable $th) {
            $response = [
                'data' => [],
                'message' => 'failed'
            ];
        }
        return response()->json($response, 200);
    }
    public function getEmployeeList(Request $request)
    {
        try {
            $rows = User::allEmployee($request->all());
            $response = [
                'data' => $rows,
                'message' => 'success'
            ];
        } catch (\Throwable $th) {
            $response = [
                'data' => [],
                'message' => 'failed'
            ];
        }
        return response()->json($response, 200);
    }

    public function AllPartnerList(Request $request)
    {

        $page = $request->input('page', 1);
        $pageSize = $request->input('pageSize', 10);

        // Get search query from the request
        $searchQuery    = $request->searchQuery;
        $selectedFilter = (int)$request->selectedFilter;
        // dd($selectedFilter);
        $query = User::orderBy('users.id', 'desc')
            ->join('rule', 'users.role_id', '=', 'rule.id')
            ->select('users.ref_id', 'users.inviteCode', 'users.register_ip', 'users.lastlogin_country', 'users.lastlogin_ip', 'users.created_at', 'users.role_id', 'users.id', 'users.id as userid', 'users.name', 'users.email', 'users.phone_number', 'users.show_password', 'users.status', 'rule.name as rulename');
        if ($searchQuery !== null) {
            $query->where('users.name', 'like', '%' . $searchQuery . '%');
        }

        if ($selectedFilter !== null) {

            $query->where('users.status', $selectedFilter);
        }
        $query->whereNotIn('users.role_id', [1]);
        $paginator = $query->paginate($pageSize, ['*'], 'page', $page);

        $modifiedCollection = $paginator->getCollection()->map(function ($item) {

            $lastDeposit            = 100;
            $totalDeposit           = 120;
            $totalreward            = 5;
            $lastWithdraw           = 20;
            $total_withdraw         = 21;
            $totalexpance           = 30;
            $runningNumberofOrder   = 5;
            $orderAmount            = 75;
            $total_profit           = 10;
            $formula_result_1 = $totalDeposit + $totalreward + $total_profit;
            $formula_result_2 = $total_withdraw + $totalexpance + $orderAmount;
            $result           = $formula_result_1 - $formula_result_2;
            $refby            = User::where('id', $item->ref_id)->first();
            //$status  = 'Active';
            return [
                'id'            => $item->id,
                'userid'        => $item->userid,
                'name'          => substr($item->name, 0, 250),
                'rulename'      => substr($item->rulename, 0, 250),
                'email'         => $item->email,
                'created_at'    => date("d/m/Y H:i:s", strtotime($item->created_at)),
                'phone_number'  => $item->phone_number,
                'show_password' => $item->show_password,
                'lastDeposit'   => $lastDeposit,
                'totalDeposit'  => $totalDeposit,
                'reward'        => $totalreward,
                'lastWithdraw'  => $lastWithdraw,
                'total_withdraw' => $total_withdraw,
                'expance'       => $totalexpance,
                'balance'       => $result,
                'run_order'     => $runningNumberofOrder,
                'orderAmount'   => $orderAmount,
                'total_profit'  => $total_profit,
                'lastloginIp'   => $item->lastlogin_ip,
                'lastloginCountry' => $item->lastlogin_country,
                'register_ip'   => $item->register_ip,
                'inviteCode'    => $item->inviteCode,
                'name'          => $item->name,
                'refby'         => !empty($refby) ? $refby->name : "",
                'status'        => $item->status == 1 ? 'Active' : 'Inactive',
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

    public function allrolelist()
    {
        $activeRule = RuleModel::where('status', 1)->whereNot('id', 3)->get();
        return response()->json($activeRule);
    }
    public function allrolelistsInfo()
    {
        $activeRule = RuleModel::where('status', 1)->get();
        return response()->json($activeRule);
    }

    public function getRoleList(Request $request)
    {
        //RuleModel::all();

        $page = $request->input('page', 1);
        $pageSize = $request->input('pageSize', 10);

        // Get search query from the request
        $searchQuery    = $request->searchQuery;
        $selectedFilter = (int)$request->selectedFilter;
        // dd($selectedFilter);
        $query = RuleModel::orderBy('rule.id', 'desc');
        if ($searchQuery !== null) {
            $query->where('rule.name', 'like', '%' . $searchQuery . '%');
        }

        if ($selectedFilter !== null) {

            $query->where('rule.status', $selectedFilter);
        }
        // $query->whereNotIn('users.role_id', [2]);
        $paginator = $query->paginate($pageSize, ['*'], 'page', $page);

        $modifiedCollection = $paginator->getCollection()->map(function ($item) {
            return [
                'id'            => $item->id,
                'name'          => $item->name,
                'created_at'    => date("Y-M-d H:i:s", strtotime($item->created_at)),
                'updated_at'    => date("Y-M-d H:i:s", strtotime($item->updated_at)),
                'status'        => $item->status == 1 ? 'Active' : 'Inactive',
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

    public function getUserWiseCurrentBalance(Request $request)
    {
        $userid = $request->userid;
        $response       = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalanceCheckAdminIndivUser($userid);
        $currentBalance = $response instanceof JsonResponse ? $response->getData(true)['current_balance'] : 0;
        return response()->json($currentBalance);
    }

    public function findUserDetails(Request $request)
    {

        $current_date   = date("Y-m-d");
        $response       = app('App\Http\Controllers\Dropshipping\DropUserController')->getCurrentBalanceCheckAdminIndivUser($request->id);
        $currentBalance = $response instanceof JsonResponse ? $response->getData(true)['current_balance'] : 0;

        $commission_resp        = app('App\Http\Controllers\Dropshipping\DropUserController')->getComissionReportAdmin($request->id);
        $commission_sum         = $commission_resp instanceof JsonResponse ? $commission_resp->getData(true)['commission_sum'] : 0;
        $profit_amount          = Order::where('user_id', $request->id)->whereIn('order_status', [6])->sum('profit');

        $manAdjstSum            = ManualAdjustment::where('user_id', $request->id)->where('adjustment_type', 1)->sum('adjustment_amount');
        $manAdjstMinus          = ManualAdjustment::where('user_id', $request->id)->where('adjustment_type', 2)->sum('adjustment_amount');

        // echo "manAdjstSum:------$manAdjstSum, manAdjstMinus:----$manAdjstMinus";exit;
        $epense                 = MystoreHistory::where('user_id', $request->id)->sum('service_price');

        //getComissionReportAdmin

        $item = User::join('rule', 'users.role_id', '=', 'rule.id')
            ->select('users.doc_file', 'users.created_at', 'users.updated_at', 'lastlogin_country', 'register_ip', 'lastlogin_ip', 'users.ref_id', 'users.telegram', 'users.whtsapp', 'users.role_id', 'users.id', 'users.name', 'users.email', 'users.phone_number', 'users.show_password', 'users.status', 'rule.name as rulename')
            ->where('users.id', $request->id)
            ->first();

        $chkPendingOrder = Order::where('user_id', $request->id)->whereIn('order_status', [2, 3, 4, 5])->sum('buying_price');

        $totalDeposit               =  Deposit::where('user_id', $request->id)->where('status', 1)->sum('receivable_amount');

        $totalWithdraw_success      =  Withdraw::where('user_id', $request->id)->where('status', 1)->sum('withdraw_amount');
        $totalWithdraw_processing   =  Withdraw::where('user_id', $request->id)->where('status', 0)->sum('withdraw_amount');

        $telegram       = !empty($item->telegram) ? $item->telegram : "None";
        $phone          = !empty($item->phone_number) ? $item->phone_number : "";
        $whatsapp       = !empty($item->whatsapp) ? $item->whatsapp : "None";
        $status         = $item->status == 1 ? 'Active' : "None";
        $ref_id         = !empty($item->ref_id) ? $item->ref_id : "";
        $chkInviteUser  = User::where('id', $ref_id)->select('name', 'phone_number', 'email')->first();
        $registerIP     = $item->register_ip;
        $ipdat          = @json_decode(file_get_contents("http://www.geoplugin.net/json.gp?ip=" . $registerIP));

        $data = [
            'user_id'    => $item->id,
            'name'       => substr($item->name, 0, 250),
            'rulename'   => substr($item->rulename, 0, 250),
            'userInfo_1' => $item->name,
            'userInfo_2' => $phone,
            'userInfo_3' => $item->email,
            'userInfo_4' => $telegram,
            'userInfo_5' => $whatsapp,
            'invite_user_1' => !empty($chkInviteUser->name) ? $chkInviteUser->name : "",
            'invite_user_2' => !empty($chkInviteUser->phone_number) ? $chkInviteUser->phone_number : "",
            'invite_user_3' => !empty($chkInviteUser->email) ? $chkInviteUser->email : "",
            'email'         => $item->email,
            'register_ip'   => $item->register_ip,
            'lastlogin_ip'  => $item->lastlogin_ip,
            'register_country'  => isset($ipdat->geoplugin_countryName) ? $ipdat->geoplugin_countryName : "",
            'lastlogin_country' => $item->lastlogin_country,
            'created_at'        => date("Y-M-d H:i:s", strtotime($item->created_at)),
            'updated_at'        => date("Y-M-d H:i:s", strtotime($item->updated_at)),
            'phone_number'      => $item->phone_number,
            'show_password'     => $item->show_password,
            'u_details_avail_balance'  => '$' . $currentBalance,
            'u_details_frozenAmount'  => '$' . $chkPendingOrder,
            'u_details_kyc'     => !empty($item->doc_file) ? url($item->doc_file) : "",
            'status'            => $status,
            'total_success_deposit'       => '$' . number_format($totalDeposit, 2),
            'total_success_withdraw'      => '$' . number_format($totalWithdraw_success, 2),
            'total_processing_withdraw'   => '$' . number_format($totalWithdraw_processing, 2),
            'total_profit'                => '$' . number_format($profit_amount, 2),
            'total_commission'            => '$' . number_format($commission_sum, 2),
            'total_redward_plus'          => '$' . number_format($manAdjstSum, 2),
            'total_redward_minus'         => '$' . number_format($manAdjstMinus, 2),
            'total_expense'               => '$' . number_format($epense, 2)
        ];
        //dd($data);
        return response()->json($data);
    }

    public function allAgent(Request $request)
    {
        $page = $request->input('page', 1);
        $pageSize = $request->input('pageSize', 10);

        // Get search query from the request
        $searchQuery    = $request->searchQuery;
        $selectedFilter = (int)$request->selectedFilter;
        // dd($selectedFilter);
        $query = User::orderBy('users.id', 'desc')
            ->join('rule', 'users.role_id', '=', 'rule.id')
            ->select('users.created_at', 'users.updated_at', 'lastlogin_country', 'register_ip', 'lastlogin_ip', 'users.ref_id', 'users.telegram', 'users.whtsapp', 'users.role_id', 'users.id', 'users.name', 'users.email', 'users.phone_number', 'users.show_password', 'users.status', 'rule.name as rulename');
        if ($searchQuery !== null) {
            $query->where('users.name', 'like', '%' . $searchQuery . '%');
        }

        if ($selectedFilter !== null) {
            $query->where('users.status', $selectedFilter);
        }
        $query->where('users.role_id', 4);
        $paginator = $query->paginate($pageSize, ['*'], 'page', $page);

        $modifiedCollection = $paginator->getCollection()->map(function ($item) {

            $status         = $item->status == 1  ? 'Active' : "None";
            $ref_id         = !empty($item->ref_id) ? $item->ref_id : ""; //$item->ref_id == 1  ? 'Active' : "None";
            $chkInviteUser  = User::where('id', $ref_id)->select('name', 'phone_number', 'email')->first();
            $registerIP     = $item->register_ip;
            $ipdat = @json_decode(file_get_contents(
                "http://www.geoplugin.net/json.gp?ip=" . $registerIP
            ));

            return [
                'id'            => $item->id,
                'name'          => substr($item->name, 0, 250),
                'rulename'      => substr($item->rulename, 0, 250),
                'email'         => $item->email,
                'phone_number'  => $item->phone_number,
                'show_password' => $item->show_password,
                'status'        => $status,
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

    public function allAdmin(Request $request)
    {

        $page = $request->input('page', 1);
        $pageSize = $request->input('pageSize', 10);

        // Get search query from the request
        $searchQuery    = $request->searchQuery;
        $selectedFilter = (int)$request->selectedFilter;
        // dd($selectedFilter);
        $query = User::orderBy('users.id', 'desc')
            ->join('rule', 'users.role_id', '=', 'rule.id')
            ->select('users.created_at', 'users.updated_at', 'lastlogin_country', 'register_ip', 'lastlogin_ip', 'users.ref_id', 'users.telegram', 'users.whtsapp', 'users.role_id', 'users.id', 'users.name', 'users.email', 'users.phone_number', 'users.show_password', 'users.status', 'rule.name as rulename');
        if ($searchQuery !== null) {
            $query->where('users.name', 'like', '%' . $searchQuery . '%');
        }

        if ($selectedFilter !== null) {
            $query->where('users.status', $selectedFilter);
        }
        $query->where('users.role_id', 3);
        $paginator = $query->paginate($pageSize, ['*'], 'page', $page);

        $modifiedCollection = $paginator->getCollection()->map(function ($item) {

            $status         = $item->status == 1  ? 'Active' : "None";
            $ref_id         = !empty($item->ref_id) ? $item->ref_id : ""; //$item->ref_id == 1  ? 'Active' : "None";
            $chkInviteUser  = User::where('id', $ref_id)->select('name', 'phone_number', 'email')->first();
            $registerIP     = $item->register_ip;
            $ipdat = @json_decode(file_get_contents(
                "http://www.geoplugin.net/json.gp?ip=" . $registerIP
            ));

            return [
                'id'            => $item->id,
                'name'          => substr($item->name, 0, 250),
                'rulename'      => substr($item->rulename, 0, 250),
                'email'         => $item->email,
                'phone_number'  => $item->phone_number,
                'show_password' => $item->show_password,
                'status'        => $status,
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
    public function allSuperAdmin(Request $request)
    {

        $page = $request->input('page', 1);
        $pageSize = $request->input('pageSize', 10);

        // Get search query from the request
        $searchQuery    = $request->searchQuery;
        $selectedFilter = (int)$request->selectedFilter;
        // dd($selectedFilter);
        $query = User::orderBy('users.id', 'desc')
            ->join('rule', 'users.role_id', '=', 'rule.id')
            ->select('users.created_at', 'users.updated_at', 'lastlogin_country', 'register_ip', 'lastlogin_ip', 'users.ref_id', 'users.telegram', 'users.whtsapp', 'users.role_id', 'users.id', 'users.name', 'users.email', 'users.phone_number', 'users.show_password', 'users.status', 'rule.name as rulename');
        if ($searchQuery !== null) {
            $query->where('users.name', 'like', '%' . $searchQuery . '%');
        }

        if ($selectedFilter !== null) {
            $query->where('users.status', $selectedFilter);
        }
        $query->where('users.role_id', 1);
        $paginator = $query->paginate($pageSize, ['*'], 'page', $page);

        $modifiedCollection = $paginator->getCollection()->map(function ($item) {

            $status         = $item->status == 1  ? 'Active' : "None";
            $ref_id         = !empty($item->ref_id) ? $item->ref_id : ""; //$item->ref_id == 1  ? 'Active' : "None";
            $chkInviteUser  = User::where('id', $ref_id)->select('name', 'phone_number', 'email')->first();
            $registerIP     = $item->register_ip;
            $ipdat = @json_decode(file_get_contents(
                "http://www.geoplugin.net/json.gp?ip=" . $registerIP
            ));

            return [
                'id'            => $item->id,
                'name'          => substr($item->name, 0, 250),
                'rulename'      => substr($item->rulename, 0, 250),
                'email'         => $item->email,
                'phone_number'  => $item->phone_number,
                'show_password' => $item->show_password,
                'status'        => $status,
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

    public function autocompleteUser(Request $request)
    {

        $query = $request->query('query', ''); // Get the 'query' parameter from the request
        // Retrieve users whose names contain the search query, case-insensitive
        $users = User::where('email', 'LIKE', "%{$query}%")->get();

        return response()->json($users); // Return the result as JSON

    }

    public function inactiveUser(Request $request)
    {

        $userId = $request->user_id;
        $data['status'] = 0;
        User::where('id', $userId)->update($data);
        return response()->json("Update successfully");
    }

    public function AllUsersList(Request $request)
    {

        $page = $request->input('page', 1);
        $pageSize = $request->input('pageSize', 10);

        // Get search query from the request
        $searchQuery    = $request->searchQuery;
        $selectedFilter = (int)$request->selectedFilter;
        // dd($selectedFilter);
        $query = User::orderBy('users.id', 'desc')
            ->join('rule', 'users.role_id', '=', 'rule.id')
            ->select('users.created_at', 'users.updated_at', 'lastlogin_country', 'register_ip', 'lastlogin_ip', 'users.ref_id', 'users.telegram', 'users.whtsapp', 'users.role_id', 'users.id', 'users.name', 'users.email', 'users.phone_number', 'users.show_password', 'users.status', 'rule.name as rulename');

        if ($searchQuery !== null) {
            //$query->where('users.email', 'like', '%' . $searchQuery . '%');
            $query->where('users.email', $searchQuery);
        }

        if ($selectedFilter !== null) {

            $query->where('users.status', $selectedFilter);
        }
        $query->where('users.role_id', 2);
        $paginator = $query->paginate($pageSize, ['*'], 'page', $page);

        $modifiedCollection = $paginator->getCollection()->map(function ($item) {

            $telegram       = !empty($item->telegram) ? $item->telegram : "None";
            $phone          = !empty($item->phone_number) ? $item->phone_number : "";
            $whtsapp        = !empty($item->whtsapp) ? $item->whtsapp : "None";
            $status         = $item->status == 1  ? 'Active' : "Inactive";
            $ref_id         = !empty($item->ref_id) ? $item->ref_id : ""; //$item->ref_id == 1  ? 'Active' : "None";
            $chkInviteUser  = User::where('id', $ref_id)->select('name', 'phone_number', 'email')->first();
            $registerIP     = $item->register_ip;
            $ipdat = @json_decode(file_get_contents(
                "http://www.geoplugin.net/json.gp?ip=" . $registerIP
            ));

            return [
                'id'            => $item->id,
                'name'          => substr($item->name, 0, 250),
                'rulename'      => substr($item->rulename, 0, 250),
                'userInfo_1'    => "Name:" . $item->name,
                'userInfo_2'    => "Phone:" . $phone,
                'userInfo_3'    => "Email:" . $item->email,
                'userInfo_4'    => "Telegram:" . $telegram,
                'userInfo_5'    => "WhatsApp:" . $whtsapp,
                'invite_user_1' => !empty("Name:" . $chkInviteUser->name) ? "Name:" . $chkInviteUser->name : "",
                'invite_user_2' => !empty("Cell Phone:" . $chkInviteUser->phone_number) ? "Cell Phone:" . $chkInviteUser->phone_number : "",
                'invite_user_3' => !empty("Email:" . $chkInviteUser->email) ? "Email:" . $chkInviteUser->email : "",
                'email'         => $item->email,
                'register_ip'   => $item->register_ip,
                'lastlogin_ip'  => $item->lastlogin_ip,

                'register_country'   => !empty($ipdat->geoplugin_countryName) ? $ipdat->geoplugin_countryName : "",
                'lastlogin_country'  => !empty($item->lastlogin_country) ?: "",

                'created_at'  => date("Y-M-d H:i:s", strtotime($item->created_at)), //$item->created_at,
                'updated_at'  => date("Y-M-d H:i:s", strtotime($item->updated_at)), //$item->updated_at,

                'phone_number'  => $item->phone_number,
                'show_password' => $item->show_password,
                'status'        => $status,
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

    public function allemployeeType(Request $request)
    {
        try {
            $rows = User::allEmpType($request->all());
            $response = [
                'data' => $rows,
                'message' => 'success'
            ];
        } catch (\Throwable $th) {
            $response = [
                'data' => [],
                'message' => 'failed'
            ];
        }
        return response()->json($response, 200);
    }

    public function editUserId($id)
    {
        $data = User::checkUserRow($id);

        $response = [
            'data' => $data,
            'dataImg'  => !empty($data->image) ? url($data->image) : "",
            'doc_file' => !empty($data->doc_file) ? url($data->doc_file) : "",
            'message'  => 'success'
        ];
        return response()->json($response, 200);
    }
    public function employeeRow($id)
    {
        $data = User::checkEmployeRow($id);
        $response = [
            'data'                   => $data,
            'image'                  => !empty($data->image) ? url($data->image) : "",
            'type_of_doc'            => !empty($data->type_of_doc) ? url($data->type_of_doc) : "",
            'passport_upload_docs'   => !empty($data->passport_upload_docs) ? url($data->passport_upload_docs) : "",
            'visa_upload_documents'  => !empty($data->visa_upload_documents) ? url($data->visa_upload_documents) : "",
            'euss_upload_documents'  => !empty($data->euss_upload_documents) ? url($data->euss_upload_documents) : "",
            'nid_upload_documents'   => !empty($data->nid_upload_documents) ? url($data->nid_upload_documents) : "",
            'other_upload_documents' => !empty($data->other_upload_documents) ? url($data->other_upload_documents) : "",
            'message' => 'success'
        ];

        return response()->json($response, 200);
    }

    public function selectOrganisationProfile()
    {
        $email = auth('api')->user()->email;
        $data       = User::orgProfile();
        //dd($data);
        $data_two   = User::orgProfiletwo();
        $data_three = User::orgProfilethree();

        $response = [
            'data'                => $data,
            'email'               => $email,
            'data_two'            => $data_two,
            'data_three'          => $data_three,
            'your_logo'           => !empty($data->your_logo) ? url($data->your_logo) : "",
            'auth_person_prof_id' => !empty($data->auth_person_prof_id) ? url($data->auth_person_prof_id) : "",
            'level_1_prof_id'     => !empty($data->level_1_prof_id) ? url($data->level_1_prof_id) : "",
            'key_contact_prof_id' => !empty($data->key_contact_prof_id) ? url($data->key_contact_prof_id) : "",
            'data_three_docs_1'     => !empty($data_three->type_of_doc_1) ? url($data_three->type_of_doc_1) : "",
            'data_three_docs_2'     => !empty($data_three->type_of_doc_2) ? url($data_three->type_of_doc_2) : "",
            'data_three_docs_3'     => !empty($data_three->type_of_doc_3) ? url($data_three->type_of_doc_3) : "",
            'data_three_docs_4'     => !empty($data_three->type_of_doc_4) ? url($data_three->type_of_doc_4) : "",
            'data_three_docs_5'     => !empty($data_three->type_of_doc_5) ? url($data_three->type_of_doc_5) : "",
            'data_three_docs_6'     => !empty($data_three->type_of_doc_6) ? url($data_three->type_of_doc_6) : "",
            'data_three_docs_7'     => !empty($data_three->type_of_doc_7) ? url($data_three->type_of_doc_7) : "",
            'data_three_docs_8'     => !empty($data_three->type_of_doc_8) ? url($data_three->type_of_doc_8) : "",
            'data_three_docs_9'     => !empty($data_three->type_of_doc_9) ? url($data_three->type_of_doc_9) : "",
            'data_three_docs_10'    => !empty($data_three->type_of_doc_10) ? url($data_three->type_of_doc_10) : "",
            'data_three_docs_11'    => !empty($data_three->type_of_doc_11) ? url($data_three->type_of_doc_11) : "",
            'data_three_docs_12'    => !empty($data_three->type_of_doc_12) ? url($data_three->type_of_doc_12) : "",
            'data_three_docs_13'    => !empty($data_three->type_of_doc_13) ? url($data_three->type_of_doc_13) : "",
            'data_three_docs_14'    => !empty($data_three->type_of_doc_14) ? url($data_three->type_of_doc_14) : "",
            'data_three_docs_15'    => !empty($data_three->type_of_doc_15) ? url($data_three->type_of_doc_15) : "",
            'data_three_docs_16'    => !empty($data_three->type_of_doc_16) ? url($data_three->type_of_doc_16) : "",
            'data_three_docs_17'    => !empty($data_three->type_of_doc_17) ? url($data_three->type_of_doc_17) : "",
            'data_three_docs_18'    => !empty($data_three->type_of_doc_18) ? url($data_three->type_of_doc_18) : "",
            'message' => 'success'
        ];
        //dd($response);
        return response()->json($response, 200);
    }

    public function roleCheck($id)
    {
        $data = User::checkRoleRow($id);
        $response = [
            'data' => $data,
            'message' => 'success'
        ];
        return response()->json($response, 200);
    }
    public function departmentCheck($id)
    {
        $data = User::checkDepartmentRow($id);
        $response = [
            'data' => $data,
            'message' => 'success'
        ];
        return response()->json($response, 200);
    }
    public function designationCheck($id)
    {
        $data = User::checkDesignationRow($id);
        $response = [
            'data' => $data,
            'message' => 'success'
        ];
        return response()->json($response, 200);
    }
    public function checkUserDetails($id)
    {
        $data = User::checkRoleRow($id);
        $response = [
            'data' => $data,
            'message' => 'success'
        ];
        return response()->json($response, 200);
    }
    public function getCountry()
    {
        $data = User::countryList();
        $response = [
            'data' => $data,
            'message' => 'success'
        ];
        return response()->json($response, 200);
    }
    public function getTime()
    {
        $data = User::getTimes();
        $response = [
            'data' => $data,
            'message' => 'success'
        ];
        return response()->json($response, 200);
    }
    public function inactiveEmployee()
    {
        $data = User::inactiveEmployees();
        $response = [
            'data' => $data,
            'message' => 'success'
        ];
        return response()->json($response, 200);
    }
    public function saveDepartment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'status' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        $data = array(
            'name'     => !empty($request->name) ? $request->name : "",
            'entry_by' => $this->userid,
            'status'   => $request->status,
        );
        if (empty($request->id)) {
            $id = DB::table('department')->insertGetId($data);
        } else {
            $id = $request->id;
            DB::table('department')->where('id', $request->id)->update($data);
        }
        $response = [
            'message' => 'User register successfully insert UserID:' . $id
        ];
        return response()->json($response);
    }
    public function saveDesignation(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'status' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        $data = array(
            'name' => !empty($request->name) ? $request->name : "",
            'entry_by' => $this->userid,
            'status' => $request->status,
        );
        if (empty($request->id)) {
            $id = DB::table('designation')->insertGetId($data);
        } else {
            $id = $request->id;
            DB::table('designation')->where('id', $request->id)->update($data);
        }
        $response = [
            'message' => 'Successfull:' . $id,
        ];
        return response()->json($response);
    }

    public function updateUserProfileImg(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            //'file'    => 'required',
            'file' => 'required|image|mimes:jpeg,png,jpg,gif', // Adjust max file size as needed
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        if (!empty($request->file('file'))) {
            $files = $request->file('file');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['image'] = $file_url;
            DB::table('users')->where('id', $this->userid)->update($data);
            $response = [
                'dataImg' => !empty($file_url) ? url($file_url) : "",
                'message' => 'success'
            ];
        } else {
            $response = [
                'dataImg' =>  "",
                'message' => 'failed'
            ];
        }
        return response()->json($response);
    }

    public function updateUser(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'role_id'    => 'required',
            'name'       => 'required',
            'phone'      => 'required',
            'email'      => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = User::find($this->userid);
        if ($request->email === $user->email) {
            // $unqie=uniqid();
            //  $email= $request->email.$unqie;
        } else {
            $email = $request->email;
        }

        $data['role_id']        = !empty($request->role_id) ? $request->role_id : "";
        $data['name']           = !empty($request->name) ? $request->name : "";
        $data['address']        = !empty($request->addres) ? $request->addres : "";
        $data['phone_number']   = !empty($request->phone) ? $request->phone : "";
        $data['email']          = $email;
        $data['status']         = !empty($request->status) ? $request->status : "";
        $data['entry_by']       = !empty($request->entry_by) ? $request->entry_by : "";

        if (!empty($request->file('file'))) {
            $files = $request->file('file');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['image'] = $file_url;
        }

        DB::table('users')->where('id', $request->id)->update($data);
        $response = [
            'message' => 'User register successfully insert UserID:',
        ];
        return response()->json($response);
    }

    public function sendUserManualAdjst(Request $request)
    {

        //dd($request->all());
        $validator = Validator::make($request->all(), [
            'userId'             => 'required',
            'adjustment_type'   => 'required',
            'adjustment_amount' => 'required',
            'detailed_remarks'  => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        $data = array(
            'user_id'           => !empty($request->userId) ? $request->userId : "",
            'adjustment_type'   => !empty($request->adjustment_type) ? $request->adjustment_type : "",
            'adjustment_amount' => !empty($request->adjustment_amount) ? $request->adjustment_amount : "",
            'detailed_remarks'  => !empty($request->detailed_remarks) ? $request->detailed_remarks : "",
            // 'status'        => $request->status,
            'entry_by'      => $this->userid,
        );

        $last_id = ManualAdjustment::insertGetId($data);

        if ($request->adjustment_type == 1) {
            $expData['operation_type']      =  "Debited";
            $expData['charge_description']  =  "$request->detailed_remarks [ID: $last_id] ";
        }

        if ($request->adjustment_type == 2) {
            $expData['operation_type']      =  "Credited";
            $expData['charge_description']  =  "$request->detailed_remarks [ID: $last_id] ";
        }

        $expData['user_id']             =  $request->userId;
        $expData['operation_amount']    =  $request->adjustment_amount;
        $expData['operation_date']      =  date("Y-m-d");
        //dd($expData);
        ExpenseHistory::insertGetId($expData);

        $response = [
            'message' => 'Adjustment Done:' . $last_id
        ];
        return response()->json($response);
    }

    public function deleteManualAdjusment(Request $request)
    {

        $row =  ManualAdjustment::where('id', $request->id)->first();
        $data = array(
            'delete_adj_id'     => $row->id,
            'user_id'           => $row->user_id,
            'adjustment_type'   => $row->adjustment_type,
            'adjustment_amount' => $row->adjustment_amount,
            'detailed_remarks'  => $row->detailed_remarks,
            'entry_by'          => $row->entry_by,
            'delete_by'         => $this->userid,
        );
        ManualAdjustmentDelete::insertGetId($data);

        $manualAdjustment = ManualAdjustment::find($request->id);
        if ($manualAdjustment) {
            // Delete the record
            $manualAdjustment->delete();
        }
        $response = [
            'message' => 'Successfully delete.',
        ];
        return response()->json($response);
    }



 public function deletewithdrawalAddress(Request $request)
    {

        $manualAdjustment = WalletAddress::find($request->id);
        if ($manualAdjustment) {
            // Delete the record
            $manualAdjustment->delete();
        }
        $response = [
            'message' => 'Successfully delete.',
        ];
        return response()->json($response);
    }

    public function editsendUserManualAdjst(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'userId'             => 'required',
            'adjustment_type'   => 'required',
            'adjustment_amount' => 'required',
            'detailed_remarks'  => 'required',

        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        $data = array(
            'user_id'           => !empty($request->userId) ? $request->userId : "",
            'adjustment_type'   => !empty($request->adjustment_type) ? $request->adjustment_type : "",
            'adjustment_amount' => !empty($request->adjustment_amount) ? $request->adjustment_amount : "",
            'detailed_remarks'  => !empty($request->detailed_remarks) ? $request->detailed_remarks : "",
            // 'status'        => $request->status,
            'entry_by'      => $this->userid,
        );

        $manualAdjustment = ManualAdjustment::find($request->id);
        if ($manualAdjustment) {
            $manualAdjustment->update($data);
        }
        $response = [
            'message' => 'Adjustment update done:',
        ];
        return response()->json($response);
    }

    public function saveUser(Request $request)
    {
        //dd($request->all());
        $validator = Validator::make($request->all(), [
            'role_id'    => 'required',
            'name'       => 'required',
            'phone'      => 'required',
            'email'      => 'required|email',
            // 'email' => 'required|email|unique:users',
            'password' => 'min:2|required_with:password_confirmation|same:password_confirmation',
            'password_confirmation' => 'min:2'
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        $data = array(
            'role_id'       => !empty($request->role_id) ? $request->role_id : "",
            'name'          => !empty($request->name) ? $request->name : "",
            'address'       => !empty($request->address) ? $request->address : "",
            'phone_number'  => !empty($request->phone) ? $request->phone : "",
            'email'         => !empty($request->email) ? $request->email : "",
            'password'      => !empty($request->password) ? Hash::make($request->password) : "",
            'show_password' => !empty($request->password) ? $request->password : "",
            'status'        => $request->status,
            'entry_by'      => $this->userid,
        );
        if (!empty($request->file('file'))) {
            $files = $request->file('file');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['image'] = $file_url;
        }

        if (empty($request->id)) {
            $userId = DB::table('users')->insertGetId($data);
        } else {
            $userId = $request->id;
            DB::table('users')->where('id', $request->id)->update($data);
        }
        $response = [
            'message' => 'User register successfully insert UserID:' . $userId
        ];
        return response()->json($response);
    }
    public function assignToUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'role_id'    => 'required',
            'employee_id' => 'required',
            'name'       => 'required',
            'phone'      => 'required',
            'email'      => 'required|email',
            // 'email' => 'required|email|unique:users',
            'password' => 'min:2|required_with:password_confirmation|same:password_confirmation',
            'password_confirmation' => 'min:2'
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        $data = array(
            'role_id'       => !empty($request->role_id) ? $request->role_id : "",
            'employee_id'   => !empty($request->employee_id) ? $request->employee_id : "",
            'name'          => !empty($request->name) ? $request->name : "",
            'address'       => !empty($request->address) ? $request->address : "",
            'phone_number'  => !empty($request->phone) ? $request->phone : "",
            'email'         => !empty($request->email) ? $request->email : "",
            'password'      => !empty($request->password) ? Hash::make($request->password) : "",
            'show_password' => $request->password,
            'status'        => $request->status,
            'entry_by'      => $this->userid,
        );
        if (!empty($request->file('file'))) {
            $files = $request->file('file');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['image'] = $file_url;
        }

        $userId = DB::table('users')->insertGetId($data);

        // if (empty($request->id)) {
        //     $userId = DB::table('users')->insertGetId($data);
        // } else {
        //     $userId = $request->id;
        //     DB::table('users')->where('id', $request->id)->update($data);
        // }
        $response = [
            'message' => 'Successfully Assign to User. UserID:' . $userId
        ];
        return response()->json($response);
    }
    public function saveEmployee(Request $request)
    {
        ///dd($request->all());
        $validator = Validator::make($request->all(), [
            //'name'              => 'required',
            'phone'             => 'required',
            'age'               => 'required',
            'email'             => 'required|email',
            'gender'            => 'required',
            'joning_date'       => 'required',
            'date_of_birth'     => 'required',
            'department_id'     => 'required',
            'designation_id'    => 'required',
            'salary'            => 'required',
            'marital_status'    => 'required',
            'employee_code'     => 'required',
            'first_name'        => 'required',
            'middle_name'       => 'required',
            'last_name'         => 'required',
            'country_id'        => 'required',
            'employee_type'     => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        $data = array(
            'name'             => "$request->first_name $request->middle_name $request->last_name",
            'email'            => !empty($request->email) ? $request->email : "",
            'address'          => !empty($request->address) ? $request->address : "",
            'phone'            => !empty($request->phone) ? $request->phone : "",
            'department_id'    => !empty($request->department_id) ? $request->department_id : "",
            'designation_id'   => !empty($request->designation_id) ? $request->designation_id : "",
            'salary'           => !empty($request->salary) ? $request->salary : "",
            'employee_code'    => !empty($request->employee_code) ? $request->employee_code : "",
            'first_name'       => !empty($request->first_name) ? $request->first_name : "",
            'middle_name'      => !empty($request->middle_name) ? $request->middle_name : "",
            'last_name'        => !empty($request->last_name) ? $request->last_name : "",
            'ni_no'            => !empty($request->ni_no) ? $request->ni_no : "",
            'marital_status'   => !empty($request->marital_status) ? $request->marital_status : "",
            'country_id'           => !empty($request->country_id) ? $request->country_id : "",
            'employee_type'        => !empty($request->employee_type) ? $request->employee_type : "",
            'date_of_confirmation' => !empty($request->date_of_confirmation) ? $request->date_of_confirmation : "",
            'contact_start_date'   => !empty($request->contact_start_date) ? $request->contact_start_date : "",
            'contact_end_date'     => !empty($request->contact_end_date) ? $request->contact_end_date : "",
            'job_location'         => !empty($request->job_location) ? $request->job_location : "",
            'reporting_authority'  => !empty($request->reporting_authority) ? $request->reporting_authority : "",
            'leave_sanction_auth'  => !empty($request->leave_sanction_auth) ? $request->leave_sanction_auth : "",
            'education_details'    => !empty($request->education_details) ? $request->education_details : "",
            'job_details'          => !empty($request->job_details) ? $request->job_details : "",
            'key_respons'          => !empty($request->key_respons) ? $request->key_respons : "",
            'age'                  => !empty($request->age) ? $request->age : "",
            'joning_date'          => !empty($request->joning_date) ? date("Y-m-d", strtotime($request->joning_date)) : "",
            'date_of_birth'        => !empty($request->date_of_birth) ? date("Y-m-d", strtotime($request->date_of_birth)) : "",
            'gender'               => !empty($request->gender) ? $request->gender : "",
            'status'               => $request->status,
            'training_details'     => !empty($request->training_details) ? $request->training_details : "",
            //Emgergency
            'emger_contact_name'   => !empty($request->emger_contact_name) ? $request->emger_contact_name : "",
            'emger_email'          => !empty($request->emger_email) ? $request->emger_email : "",
            'emger_contact_no'     => !empty($request->emger_contact_no) ? $request->emger_contact_no : "",
            'emger_address'        => !empty($request->emger_address) ? $request->emger_address : "",
            //Certificate
            'certifi_title'        => !empty($request->certifi_title) ? $request->certifi_title : "",
            'certifi_license_number' => !empty($request->certifi_license_number) ? $request->certifi_license_number : "",
            'certifi_start_date'   => !empty($request->certifi_start_date) ? $request->certifi_start_date : "",
            'certifi_end_date'     => !empty($request->certifi_end_date) ? $request->certifi_end_date : "",
            //Contact
            'contact_info_post_code'   => !empty($request->contact_info_post_code) ? $request->contact_info_post_code : "",
            'contact_info_address'     => !empty($request->contact_info_address) ? $request->contact_info_address : "",
            'contact_info_address_1'   => !empty($request->contact_info_address_1) ? $request->contact_info_address_1 : "",
            'contact_info_address_2'   => !empty($request->contact_info_address_2) ? $request->contact_info_address_2 : "",
            'contact_info_address_3'   => !empty($request->contact_info_address_3) ? $request->contact_info_address_3 : "",
            'contact_info_city_country' => !empty($request->contact_info_city_country) ? $request->contact_info_city_country : "",
            'contact_info_country_id'  => !empty($request->contact_info_country_id) ? $request->contact_info_country_id : "",
            'certifi_title'            => !empty($request->certifi_title) ? $request->certifi_title : "",
            //Pass
            'pass_no'                 => !empty($request->pass_no) ? $request->pass_no : "",
            'pass_nationality'        => !empty($request->pass_nationality) ? $request->pass_nationality : "",
            'pass_place_birth'        => !empty($request->pass_place_birth) ? $request->pass_place_birth : "",
            'pass_issued_by'          => !empty($request->pass_issued_by) ? $request->pass_issued_by : "",
            'pass_date'               => !empty($request->pass_date) ? $request->pass_date : "",
            'pass_expire_date'        => !empty($request->pass_expire_date) ? $request->pass_expire_date : "",
            'pass_review_date'        => !empty($request->pass_review_date) ? $request->pass_review_date : "",
            'contact_info_post_code'  => !empty($request->contact_info_post_code) ? $request->contact_info_post_code : "",
            //VISA
            'visa_brp_np'              => !empty($request->visa_brp_np) ? $request->visa_brp_np : "",
            'visa_nationality'         => !empty($request->visa_nationality) ? $request->visa_nationality : "",
            'visa_country_residence'   => !empty($request->visa_country_residence) ? $request->visa_country_residence : "",
            'visa_issuedby'            => !empty($request->visa_issuedby) ? $request->visa_issuedby : "",
            'visa_issued_date'         => !empty($request->visa_issued_date) ? $request->visa_issued_date : "",
            'visa_expire_date'         => !empty($request->visa_expire_date) ? $request->visa_expire_date : "",
            'visa_eligbible_review_date' => !empty($request->visa_eligbible_review_date) ? $request->visa_eligbible_review_date : "",
            'visa_current_yesno'       => !empty($request->visa_current_yesno) ? $request->visa_current_yesno : "",
            'visa_remarks'             => !empty($request->visa_remarks) ? $request->visa_remarks : "",
            //ESS
            'ess_ref_no'               => !empty($request->ess_ref_no) ? $request->ess_ref_no : "",
            'ess_nationality'          => !empty($request->ess_nationality) ? $request->ess_nationality : "",
            'ess_issued_by'            => !empty($request->ess_issued_by) ? $request->ess_issued_by : "",
            'ess_issued_date'          => !empty($request->ess_issued_date) ? $request->ess_issued_date : "",
            'ess_expire_date'          => !empty($request->ess_expire_date) ? $request->ess_expire_date : "",
            'ess_eligible_review_date' => !empty($request->ess_eligible_review_date) ? $request->ess_eligible_review_date : "",
            'ess_current_visa'         => !empty($request->ess_current_visa) ? $request->ess_current_visa : "",
            'ess_remarks'              => !empty($request->ess_remarks) ? $request->ess_remarks : "",
            //NID
            'nid_number'               => !empty($request->nid_number) ? $request->nid_number : "",
            'nid_nationality'          => !empty($request->nid_nationality) ? $request->nid_nationality : "",
            'nid_country_residence'    => !empty($request->nid_country_residence) ? $request->nid_country_residence : "",
            'nid_issue_date'           => !empty($request->nid_issue_date) ? $request->nid_issue_date : "",
            'nid_expire_date'          => !empty($request->nid_expire_date) ? $request->nid_expire_date : "",
            'nid_eli_review_date'      => !empty($request->nid_eli_review_date) ? $request->nid_eli_review_date : "",
            'nid_current_visa'         => !empty($request->nid_current_visa) ? $request->nid_current_visa : "",
            'nid_remarks'              => !empty($request->nid_remarks) ? $request->nid_remarks : "",
            //Othres
            'others_doc_name'          => !empty($request->others_doc_name) ? $request->others_doc_name : "",
            'others_ref_name'          => !empty($request->others_ref_name) ? $request->others_ref_name : "",
            'others_nationality'       => !empty($request->others_nationality) ? $request->others_nationality : "",
            'others_issue_date'        => !empty($request->others_issue_date) ? $request->others_issue_date : "",
            'others_expire_date'       => !empty($request->others_expire_date) ? $request->others_expire_date : "",
            'others_eligb_review_date' => !empty($request->others_eligb_review_date) ? $request->others_eligb_review_date : "",
            'others_visa_sts'          => !empty($request->others_visa_sts) ? $request->others_visa_sts : "",
            'others_remarks'           => !empty($request->others_remarks) ? $request->others_remarks : "",
            //Pay
            'pay_group'                => !empty($request->pay_group) ? $request->pay_group : "",
            'pay_annual_pay'           => !empty($request->pay_annual_pay) ? $request->pay_annual_pay : "",
            'pay_wedges_pay_mode'      => !empty($request->pay_wedges_pay_mode) ? $request->pay_wedges_pay_mode : "",
            'pay_payment_type'         => !empty($request->pay_payment_type) ? $request->pay_payment_type : "",
            'pay_basic_daily_wedges'   => !empty($request->pay_basic_daily_wedges) ? $request->pay_basic_daily_wedges : "",
            'pay_min_working_hour'     => !empty($request->pay_min_working_hour) ? $request->pay_min_working_hour : "",
            'pay_tax_code'             => !empty($request->pay_tax_code) ? $request->pay_tax_code : "",
            'pay_tax_ref'              => !empty($request->pay_tax_ref) ? $request->pay_tax_ref : "",
            'pay_percentage'           => !empty($request->pay_percentage) ? $request->pay_percentage : "",
            'pay_payment_mode'         => !empty($request->pay_payment_mode) ? $request->pay_payment_mode : "",
            'pay_bank_name'            => !empty($request->pay_bank_name) ? $request->pay_bank_name : "",
            'pay_branch_name'          => !empty($request->pay_branch_name) ? $request->pay_branch_name : "",
            'pay_account_no'           => !empty($request->pay_account_no) ? $request->pay_account_no : "",
            'pay_sort_code'            => !empty($request->pay_sort_code) ? $request->pay_sort_code : "",
            'pay_remarks'              => !empty($request->pay_remarks) ? $request->pay_remarks : "",
            //Payment
            'payment_da'               => !empty($request->payment_da) ? $request->payment_da : "",
            'payment_hra'              => !empty($request->payment_hra) ? $request->payment_hra : "",
            'payment_conven_ta'        => !empty($request->payment_conven_ta) ? $request->payment_conven_ta : "",
            'payment_perfomance'       => !empty($request->payment_perfomance) ? $request->payment_perfomance : "",
            'payment_monthly_al'       => !empty($request->payment_monthly_al) ? $request->payment_monthly_al : "",
            //NI
            'ni_dedu_da'               => !empty($request->ni_dedu_da) ? $request->ni_dedu_da : "",
            'ni_dedu_hra'              => !empty($request->ni_dedu_hra) ? $request->ni_dedu_hra : "",
            'ni_dedu_conven_ta'        => !empty($request->ni_dedu_conven_ta) ? $request->ni_dedu_conven_ta : "",
            'ni_dedu_perfomance'       => !empty($request->ni_dedu_perfomance) ? $request->ni_dedu_perfomance : "",
            'ni_dedu_monthly_al'       => !empty($request->ni_dedu_monthly_al) ? $request->ni_dedu_monthly_al : "",
            'entry_by'                 => $this->userid,
        );
        // dd($data);
        if (!empty($request->file('file'))) {
            $files = $request->file('file');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['image'] = $file_url;
        }
        if (!empty($request->file('type_of_doc'))) {
            $files = $request->file('type_of_doc');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['type_of_doc'] = $file_url;
        }
        if (!empty($request->file('passport_upload_docs'))) {
            $files = $request->file('passport_upload_docs');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['passport_upload_docs'] = $file_url;
        }
        if (!empty($request->file('visa_upload_documents'))) {
            $files = $request->file('visa_upload_documents');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['visa_upload_documents'] = $file_url;
        }
        if (!empty($request->file('euss_upload_documents'))) {
            $files = $request->file('euss_upload_documents');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['euss_upload_documents'] = $file_url;
        }
        if (!empty($request->file('nid_upload_documents'))) {
            $files = $request->file('nid_upload_documents');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['nid_upload_documents'] = $file_url;
        }
        if (!empty($request->file('other_upload_documents'))) {
            $files = $request->file('other_upload_documents');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['other_upload_documents'] = $file_url;
        }
        //type_of_doc
        // dd($data);
        if (empty($request->id)) {
            $id = DB::table('employee')->insertGetId($data);
        } else {
            $id = $request->id;
            DB::table('employee')->where('id', $request->id)->update($data);
        }
        $response = [
            'message' => 'Successfully:' . $id
        ];
        return response()->json($response);
    }
    public function organisationUpdateprofile(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'organisation_name'         => 'required',
            'type_of_organisation'      => 'required',
            'registration_no'           => 'required',
            'contact_no'                => 'required',
            'organisatin_email_id'      => 'required',
            'website'                   => 'required',
            'landline_number'           => 'required',
            'trading_name'              => 'required',
            'trading_period'            => 'required',
            'nameofsector'              => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        $data = array(
            'organisation_name'                 => $request->organisation_name,
            'type_of_organisation'              => !empty($request->type_of_organisation) ? $request->type_of_organisation : "",
            'registration_no'                   => !empty($request->registration_no) ? $request->registration_no : "",
            'contact_no'                        => !empty($request->contact_no) ? $request->contact_no : "",
            'organisatin_email_id'              => !empty($request->organisatin_email_id) ? $request->organisatin_email_id : "",
            'website'                           => !empty($request->website) ? $request->website : "",
            'landline_number'                   => !empty($request->landline_number) ? $request->landline_number : "",
            'trading_name'                      => !empty($request->trading_name) ? $request->trading_name : "",
            'trading_period'                    => !empty($request->trading_period) ? $request->trading_period : "",
            'nameofsector'                      => !empty($request->nameofsector) ? $request->nameofsector : "",
            'have_you_change_organisation'      => !empty($request->have_you_change_organisation) ? $request->have_you_change_organisation : "",
            'did_your_organisation_faced'       => !empty($request->did_your_organisation_faced) ? $request->did_your_organisation_faced : "",
            'auth_person_first_name'            => !empty($request->auth_person_first_name) ? $request->auth_person_first_name : "",
            'auth_person_last_name'             => !empty($request->auth_person_last_name) ? $request->auth_person_last_name : "",
            'auth_person_designation'           => !empty($request->auth_person_designation) ? $request->auth_person_designation : "",
            'auth_person_phone_no'              => !empty($request->auth_person_phone_no) ? $request->auth_person_phone_no : "",
            'auth_person_email'                 => !empty($request->auth_person_email) ? $request->auth_person_email : "",
            'auth_person_did_you_have_history'  => !empty($request->auth_person_did_you_have_history) ? $request->auth_person_did_you_have_history : "",
            'auth_person_prof_id'               => !empty($request->auth_person_prof_id) ? $request->auth_person_prof_id : "",
            'key_contact_first_name'            => !empty($request->key_contact_first_name) ? $request->key_contact_first_name : "",
            'key_contact_last_name'             => !empty($request->key_contact_last_name) ? $request->key_contact_last_name : "",
            'key_contact_designation'           => !empty($request->key_contact_designation) ? $request->key_contact_designation : "",
            'key_contact_phone_no'              => !empty($request->key_contact_phone_no) ? $request->key_contact_phone_no : "",
            'key_contact_email'                 => !empty($request->key_contact_email) ? $request->key_contact_email : "",
            'key_contact_do_you_have_history'   => !empty($request->key_contact_do_you_have_history) ? $request->key_contact_do_you_have_history : "",
            'level_1_first_name'                => !empty($request->level_1_first_name) ? $request->level_1_first_name : "",
            'level_1_last_name'                 => !empty($request->level_1_last_name) ? $request->level_1_last_name : "",
            'level_1_designation'               => !empty($request->level_1_designation) ? $request->level_1_designation : "",
            'level_1_phone_no'                  => !empty($request->level_1_phone_no) ? $request->level_1_phone_no : "",
            'level_1_email'                     => !empty($request->level_1_email) ? $request->level_1_email : "",
            'level_1_prof_id'                   => !empty($request->level_1_prof_id) ? $request->level_1_prof_id : "",
            'level_1_do_you_have_a_history'     => !empty($request->level_1_do_you_have_a_history) ? $request->level_1_do_you_have_a_history : "",
            'orgian_post_code'                  => !empty($request->orgian_post_code) ? $request->orgian_post_code : "",
            'orgian_address'                    => !empty($request->orgian_address) ? $request->orgian_address : "",
            'orgian_level_1'                    => !empty($request->orgian_level_1) ? $request->orgian_level_1 : "",
            'orgian_level_2'                    => !empty($request->orgian_level_2) ? $request->orgian_level_2 : "",
            'orgian_level_3'                    => !empty($request->orgian_level_3) ? $request->orgian_level_3 : "",
            'orgian_city'                       => !empty($request->orgian_city) ? $request->orgian_city : "",
            'orgian_country'                    => !empty($request->orgian_country) ? $request->orgian_country : "",
            'entry_by'                          => $this->userid,
        );
        if (!empty($request->file('your_logo'))) {
            $files = $request->file('your_logo');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['your_logo'] = $file_url;
        }
        if (!empty($request->file('key_contact_prof_id'))) {
            $files = $request->file('key_contact_prof_id');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['key_contact_prof_id'] = $file_url;
        }
        if (!empty($request->file('auth_person_prof_id'))) {
            $files = $request->file('auth_person_prof_id');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['auth_person_prof_id'] = $file_url;
        }

        if (!empty($request->file('level_1_prof_id'))) {
            $files = $request->file('level_1_prof_id');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['level_1_prof_id'] = $file_url;
        }

        DB::table('orgainsation_profile_1')->where('id', $request->id)->update($data);
        $data_two = array(
            'mon_status'                        => !empty($request->mon_status) ? $request->mon_status : "",
            'mon_open'                          => !empty($request->mon_open) ? $request->mon_open : "",
            'mon_close'                         => !empty($request->mon_close) ? $request->mon_close : "",
            'tuesday_status'                    => !empty($request->tuesday_status) ? $request->tuesday_status : "",
            'tuesday_open'                      => !empty($request->tuesday_open) ? $request->tuesday_open : "",
            'tuesday_close'                     => !empty($request->tuesday_close) ? $request->tuesday_close : "",
            'wed_status'                        => !empty($request->wed_status) ? $request->wed_status : "",
            'wed_open'                          => !empty($request->wed_open) ? $request->wed_open : "",
            'wed_close'                         => !empty($request->wed_close) ? $request->wed_close : "",
            'thursday_status'                   => !empty($request->thursday_status) ? $request->thursday_status : "",
            'thursday_open'                     => !empty($request->thursday_open) ? $request->thursday_open : "",
            'thursday_close'                    => !empty($request->thursday_close) ? $request->thursday_close : "",
            'friday_status'                     => !empty($request->friday_status) ? $request->friday_status : "",
            'friday_open'                       => !empty($request->friday_open) ? $request->friday_open : "",
            'friday_close'                      => !empty($request->friday_close) ? $request->friday_close : "",
            'satday_status'                     => !empty($request->satday_status) ? $request->satday_status : "",
            'satday_open'                       => !empty($request->satday_open) ? $request->satday_open : "",
            'satday_close'                      => !empty($request->satday_close) ? $request->satday_close : "",
            'sunday_status'                     => !empty($request->sunday_status) ? $request->sunday_status : "",
            'sunday_open'                       => !empty($request->sunday_open) ? $request->sunday_open : "",
            'sunday_close'                      => !empty($request->sunday_close) ? $request->sunday_close : "",
        );
        DB::table('orgainsation_profile_2')->where('id', $request->id)->update($data_two);
        $data_three = array(
            'docs_type_1'                        => !empty($request->docs_type_1) ? $request->docs_type_1 : "",
            'docs_type_2'                        => !empty($request->docs_type_2) ? $request->docs_type_2 : "",
            'docs_type_3'                        => !empty($request->docs_type_3) ? $request->docs_type_3 : "",
            'docs_type_4'                        => !empty($request->docs_type_4) ? $request->docs_type_4 : "",
            'docs_type_5'                        => !empty($request->docs_type_5) ? $request->docs_type_5 : "",
            'docs_type_6'                        => !empty($request->docs_type_6) ? $request->docs_type_6 : "",
            'docs_type_7'                        => !empty($request->docs_type_7) ? $request->docs_type_7 : "",
            'docs_type_8'                        => !empty($request->docs_type_8) ? $request->docs_type_8 : "",
            'docs_type_9'                        => !empty($request->docs_type_9) ? $request->docs_type_9 : "",
            'docs_type_10'                       => !empty($request->docs_type_10) ? $request->docs_type_10 : "",
            'docs_type_11'                       => !empty($request->docs_type_11) ? $request->docs_type_11 : "",
            'docs_type_12'                       => !empty($request->docs_type_12) ? $request->docs_type_12 : "",
            'docs_type_13'                       => !empty($request->docs_type_13) ? $request->docs_type_13 : "",
            'docs_type_14'                       => !empty($request->docs_type_14) ? $request->docs_type_14 : "",
            'docs_type_15'                       => !empty($request->docs_type_15) ? $request->docs_type_15 : "",
            'docs_type_16'                       => !empty($request->docs_type_16) ? $request->docs_type_16 : "",
            'docs_type_17'                       => !empty($request->docs_type_17) ? $request->docs_type_17 : "",
            'docs_type_18'                       => !empty($request->docs_type_18) ? $request->docs_type_18 : "",
        );
        if (!empty($request->file('type_of_doc_1'))) {
            $files = $request->file('type_of_doc_1');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_1'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_2'))) {
            $files = $request->file('type_of_doc_2');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_2'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_3'))) {
            $files = $request->file('type_of_doc_3');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_3'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_4'))) {
            $files = $request->file('type_of_doc_4');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_4'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_5'))) {
            $files = $request->file('type_of_doc_5');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_5'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_6'))) {
            $files = $request->file('type_of_doc_6');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_6'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_7'))) {
            $files = $request->file('type_of_doc_7');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_7'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_8'))) {
            $files = $request->file('type_of_doc_8');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_8'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_9'))) {
            $files = $request->file('type_of_doc_9');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_9'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_10'))) {
            $files = $request->file('type_of_doc_10');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_10'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_11'))) {
            $files = $request->file('type_of_doc_11');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_11'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_12'))) {
            $files = $request->file('type_of_doc_12');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_12'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_13'))) {
            $files = $request->file('type_of_doc_13');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_13'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_14'))) {
            $files = $request->file('type_of_doc_14');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_14'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_15'))) {
            $files = $request->file('type_of_doc_15');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_15'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_16'))) {
            $files = $request->file('type_of_doc_16');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_16'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_17'))) {
            $files = $request->file('type_of_doc_17');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_17'] = $file_url;
        }
        if (!empty($request->file('type_of_doc_18'))) {
            $files = $request->file('type_of_doc_18');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data_three['type_of_doc_18'] = $file_url;
        }
        //dd($data_three);
        DB::table('orgainsation_profile_3')->where('id', $request->id)->update($data_three);
        $response = [
            'message' => 'Profile Update:' . $request->id
        ];
        return response()->json($response);
    }

    public function changeEmailPartner(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email'        => 'required',
            'password'     => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        // Find the user by ID
        $user = User::find($this->userid);
        // Check if the provided password matches the user's password
        if (!Hash::check($request->password, $user->password)) {
            return response()->json(['errors' => ['password' => ['Invalid password']]], 422);
        }
        // Update the phone number
        $user->email = $request->email;
        $user->save();

        $response = "Phone number successfully updated!";
        return response()->json($response);
    }

    public function changeMobileNumPartner(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone_number' => 'required',
            'password'     => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        // Find the user by ID
        $user = User::find($this->userid);
        // Check if the provided password matches the user's password
        if (!Hash::check($request->password, $user->password)) {
            return response()->json(['errors' => ['password' => ['Invalid password']]], 422);
        }
        // Update the phone number
        $user->phone_number = $request->phone_number;
        $user->save();

        $response = "Phone number successfully updated!";
        return response()->json($response);
    }


    public function changePasswordClient(Request $request){

        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'password' => 'required|min:2|confirmed', // Use 'confirmed' rule for password confirmation
            'password_confirmation' => 'required|min:2',
            'old_password' => 'required|min:2', // Add validation for old password
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = User::find($request->id);

        // Validate old password before updating
        if (!Hash::check($request->old_password, $user->password)) {
            return response()->json(['errors' => ['old_password' => ['The old password does not match.']]], 422);
        }

        $user->password = Hash::make($request->password);
        $user->show_password = $request->password; // Consider removing this line for security reasons
        $user->save();

        $response = "Password successfully changed!";
        return response()->json($response);



    }

    public function changePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'password' => 'min:2|required_with:password_confirmation|same:password_confirmation',
            'password_confirmation' => 'min:2'
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        $user = User::find($request->id);
        $user->password = Hash::make($request->password);
        $user->show_password = $request->password;
        $user->save();
        $response = "Password successfully changed!";
        return response()->json($response);
    }

    public function cancelAccount(Request $request)
    {

        $data['status']         = !empty($request->status) ? $request->status : "";
        DB::table('users')->where('id', $this->userid)->update($data);
        $response = [
            'message' => 'cancel Account',
        ];
        return response()->json($response);
    }

    public function updateUserProPass(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            //'file'    => 'required',
            'doc_file' => 'required|image|mimes:jpeg,png,jpg,gif', // Adjust max file size as needed
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }
        if (!empty($request->file('doc_file'))) {
            $files = $request->file('doc_file');
            $fileName = Str::random(20);
            $ext = strtolower($files->getClientOriginalExtension());
            $path = $fileName . '.' . $ext;
            $uploadPath = '/backend/files/';
            $upload_url = $uploadPath . $path;
            $files->move(public_path('/backend/files/'), $upload_url);
            $file_url = $uploadPath . $path;
            $data['doc_file'] = $file_url;
            DB::table('users')->where('id', $this->userid)->update($data);
            $response = [
                'doc_file' => !empty($file_url) ? url($file_url) : "",
                'message' => 'success'
            ];
        } else {
            $response = [
                'doc_file' =>  "",
                'message' => 'failed'
            ];
        }
        return response()->json($response);
    }

    public function withdrawPasswordByAdmin(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'password' => 'min:6|required_with:password_confirmation|same:password_confirmation',
            'password_confirmation' => 'min:6'
        ]);
        if ($validator->fails()) {
            return response()->json(['witherrors' => $validator->errors()], 422);
        }

        $data['with_password']      = Hash::make($request->password);
        $data['with_show_password'] = $request->password;

        User::where('id', $request->id)->update($data);

        $response = "Password successfully changed!";
        return response()->json($response);
    }

    public function withdrawPasswordPartner(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'password' => 'min:6|required_with:password_confirmation|same:password_confirmation',
            'password_confirmation' => 'min:6'
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // Retrieve the user from the database
        $user = User::find($this->userid);
        // Update the password
        $user->with_password = Hash::make($request->password);
        $user->with_show_password = $request->password;
        $user->save();

        $response = "Password successfully changed!";
        return response()->json($response);
    }

    public function changePasswordPartner(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'old_password' => 'required',
            'password' => 'min:4|required_with:password_confirmation|same:password_confirmation',
            'password_confirmation' => 'min:4'
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // Retrieve the user from the database
        $user = User::find($this->userid);
        // Check if the old password matches
        if (!Hash::check($request->old_password, $user->password)) {
            return response()->json(['errors' => ['old_password' => ['The old password is incorrect.']]], 422);
        }

        // Update the password
        $user->password = Hash::make($request->password);
        $user->show_password = $request->password;
        $user->save();

        $response = "Password successfully changed!";
        return response()->json($response);
    }

    public function getInviteCode()
    {
        $response  = User::where('id', $this->userid)->first();
        return response()->json($response);
    }

    public function getFastLevel()
    {

        $response  = User::where('ref_id', $this->userid)->get();
        return response()->json($response);
    }

    public function addrealname(request $request)
    {
        $validator = Validator::make($request->all(), [
            'real_name' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = User::findOrFail($this->userid);
        $user->update([
            'real_name' => $request->input('real_name'),
        ]);
        return response()->json(['data' => 'Real name updated successfully'], 200);
    }
}
