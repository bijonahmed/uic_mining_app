<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;


class LogRequestMiddleware
{
    
    public function handle($request, Closure $next)
    {
        $user = auth('api')->user();

        // Check if the user is authenticated
        if($user) {
            $user_id = $user->id; // Assuming the user ID is stored in the 'id' attribute of your User model
        } else {
            // If the user is not authenticated, set user_id to null or handle it as needed
            $user_id = null;
        }
        // Log request details
        $requestData = [
            'method'        => $request->method(),
            'url'           => $request->fullUrl(),
            'ip'            => $request->ip(),
            'user_agent'    => $request->header('User-Agent'),
            'user_id'       => $user_id,
            'full_request'  => json_encode($request->all()),
            // Add more fields as needed
        ];
        // Insert into the database
        DB::table('logs')->insert($requestData);

        return $next($request);
    }
}
