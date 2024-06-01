<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Public\PublicController;
use App\Http\Controllers\Public\PublicOrderStatusUpdate;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\User\UserController;

Route::get('/clear-cache', function () {
    $exitCode = Artisan::call('optimize:clear');
    // return what you want
});
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::get('showProfileData', [UserController::class, 'me']);
Route::get('createOrderSchedule', [PublicController::class, 'createOrderSchedule']);
Route::get('removeOrderSchedule', [PublicController::class, 'removeOrderSchedule']);
Route::get('orderStatus', [PublicOrderStatusUpdate::class, 'updateOrderStatus']);
Route::get('/', function () {
    return view('welcome');
});
