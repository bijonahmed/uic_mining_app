<?php

namespace App\Http\Controllers\Public;

use App\Http\Controllers\Controller;
use App\Models\MystoreHistory;
use App\Models\Order;
use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Crypt;
use App\Models\ProductCategory;
use App\Models\User;
//use Darryldecode\Cart\Cart;
use Illuminate\Support\Facades\Session;
use Cart;
use Carbon\Carbon;
use Illuminate\Support\Facades\Redirect;

class PublicController extends Controller
{

    public function activationAccount(Request $request)
    {

        $activationUrl  = !empty($request->token) ? $request->token : ""; // Example URL
        $decryptedToken = Crypt::decryptString(urldecode($activationUrl));

        if (!empty($decryptedToken)) {
            //echo $decryptedToken;
            $user = User::where('email', trim($decryptedToken))->first();
            //dd($user->id);
            $userId = $user->id;
            $data['status'] = 1;
            User::where('id', $userId)->update($data);
            return Redirect::away('https://uicmax.com/login/');
        }
    }

    function generateUniqueRandomNumber()
    {
        // Get current microtime as a string and remove the decimal point
        $microtime          = (string) microtime(true); // Current time with microseconds
        $microtimeStr       = str_replace('.', '', $microtime); // Remove the dot0.656545545455000
        // Extract the last 6 digits

        return md5($microtimeStr); // Return the 6-digit unique value
    }
}
