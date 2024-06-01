<?php

namespace App\Http\Controllers\Public;

use App\Http\Controllers\Controller;
use App\Models\MystoreHistory;
use App\Models\Order;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\Setting;
//use Darryldecode\Cart\Cart;
use Illuminate\Support\Facades\Session;
use Cart;
use Carbon\Carbon;

class PublicOrderStatusUpdate extends Controller
{

    public function updateOrderStatus()
    {

        $setting        = Setting::where('id',1)->first();
        //New Agency Store
        $nags_receive_minites   = $setting->nags_receive;
        $nags_process_minites   = $setting->nags_process;
        $nags_shipped_minites   = $setting->nags_shipped;
        $nags_complete_minites  = $setting->nags_complete;
        echo "New Agency Store: $nags_receive_minites---$nags_process_minites---$nags_shipped_minites---$nags_complete_minites<br>";
        //General Agency Store
        $gas_receive_minites   = $setting->gas_receive;
        $gas_process_minites   = $setting->gas_process;
        $gas_shipped_minites   = $setting->gas_shipped;
        $gas_complete_minites  = $setting->gas_complete;
        echo "General Agency Store: $gas_receive_minites---$gas_process_minites---$gas_shipped_minites---$gas_complete_minites<br>";
        //Super Agency Store
        $sag_receive_minites   = $setting->sag_receive;
        $sag_process_minites   = $setting->sag_process;
        $sag_shipped_minites   = $setting->sag_shipped;
        $sag_complete_minites  = $setting->sag_complete;
        echo "Super Agency Store: $sag_receive_minites---$sag_process_minites---$sag_shipped_minites---$sag_complete_minites<br>";
        //Mega Agency Store
        $mas_receive_minites   = $setting->mas_receive;
        $mas_process_minites   = $setting->mas_process;
        $mas_shipped_minites   = $setting->mas_shipped;
        $mas_complete_minites  = $setting->mas_cmplete;
        echo "Mega Agency Store: $mas_receive_minites---$mas_process_minites---$mas_shipped_minites---$mas_complete_minites<br>";

        $getOrders              = Order::where('order_status', 2)->select('id', 'orderId', 'user_id', 'order_status', 'pay_confirm_time', 'product_id')->get();
        $getOrdersConvertThree  = Order::where('order_status', 3)->select('id', 'orderId', 'user_id', 'order_status', 'pay_confirm_time', 'product_id')->get();
        $getOrdersConvertFour   = Order::where('order_status', 4)->select('id', 'orderId', 'user_id', 'order_status', 'pay_confirm_time', 'product_id')->get();
        $getOrdersConvertFive   = Order::where('order_status', 5)->select('id', 'orderId', 'user_id', 'order_status', 'pay_confirm_time', 'product_id')->get();
        $getOrdersConvertSix    = Order::where('order_status', 6)->select('id', 'orderId', 'user_id', 'order_status', 'pay_confirm_time', 'product_id')->get();
        $now = Carbon::now();
        $customTimeZone             = 'Asia/Dubai';
        $currentTime                = Carbon::now($customTimeZone);
        $currentTimeFormatted       = $currentTime->format('Y-m-d H:i:s');

        echo "<hr>Asia/Dubai:".$currentTimeFormatted . "<br>";

        //"For New Agency Store
        foreach ($getOrders as $order) {
            if (isset($order->pay_confirm_time) && !is_null($order->pay_confirm_time)) {
                // Calculate the difference in minutes between now and the payment confirmation time
                $elapsedMinutes = $now->diffInMinutes(Carbon::parse($order->pay_confirm_time));
                $categoryrow    = ProductCategory::where('product_id', $order->product_id)->select('category_id')->first();
                $category_id    = $categoryrow->category_id;

                if ($category_id == 1) {
                    $scheduleTimes = $nags_receive_minites;//1080;  
                } elseif ($category_id == 2) {
                    $scheduleTimes = $nags_process_minites;//1440;   
                } elseif ($category_id == 3) {
                    $scheduleTimes = $nags_shipped_minites; //1440;  
                } elseif ($category_id == 4) {
                    $category_id == $nags_complete_minites;//1440;
                } else {
                    $scheduleTimes  = 0;  //come form admin dynamically 
                }

                $payConfirmTime = Carbon::parse($order->pay_confirm_time);
                // Make a copy and add 2 minutes
                $payConfirmTimePlusTwo = $payConfirmTime->copy()->addMinutes($scheduleTimes);
                echo "ID: {$order->id}, Pay confirm Time: {$order->pay_confirm_time}, Order Status: {$order->order_status}, CategoryID: $category_id, Estimated Last Time: $payConfirmTimePlusTwo<br>";
                //echo $order->id."<br>";
                // Update `order_status` to 3 if 2 minutes or more have passed
                if ($elapsedMinutes >= $scheduleTimes) {
                    $order->order_status = 3;
                    $order->save(); // Save the updated order
                }
            }
        }
        //For General Agency Store
        foreach ($getOrdersConvertThree as $order) {
            if (isset($order->pay_confirm_time) && !is_null($order->pay_confirm_time)) {
                // Calculate the difference in minutes between now and the payment confirmation time
                $elapsedMinutes = $now->diffInMinutes(Carbon::parse($order->pay_confirm_time));
                $payConfirmTime = Carbon::parse($order->pay_confirm_time);

                $categoryrow    = ProductCategory::where('product_id', $order->product_id)->select('category_id')->first();
                $category_id    = $categoryrow->category_id;

                if ($category_id == 1) {
                    $scheduleTimes = $gas_receive_minites;//2160;  
                } elseif ($category_id == 2) {
                    $scheduleTimes = $gas_process_minites;//2880;  
                } elseif ($category_id == 3) {
                    $scheduleTimes = $gas_shipped_minites;//2880;  
                } elseif ($category_id == 4) {
                    $scheduleTimes = $$gas_complete_minites;//2880;  
                } else {
                    $scheduleTimes  = 0;  
                }

                // Make a copy and add 2 minutes
                $payConfirmTimePlusTwo = $payConfirmTime->copy()->addMinutes($scheduleTimes);
                //  $payConfirmTimePlusTwo = $payConfirmTime->copy()->addMinutes(2);
                echo "ID: {$order->id}, Pay confirm Time: {$order->pay_confirm_time}, Order Status: {$order->order_status}, CategoryID: $category_id, Estimated Last Time: $payConfirmTimePlusTwo<br>";
                //echo $order->id."<br>";
                // Update `order_status` to 3 if 2 minutes or more have passed
                if ($elapsedMinutes >= $scheduleTimes) {
                    $order->order_status = 4;
                    $order->save(); // Save the updated order
                }
            }
        }


        //For Super Agency Store
        foreach ($getOrdersConvertFour as $order) {
            if (isset($order->pay_confirm_time) && !is_null($order->pay_confirm_time)) {
                // Calculate the difference in minutes between now and the payment confirmation time
                $elapsedMinutes = $now->diffInMinutes(Carbon::parse($order->pay_confirm_time));
                $payConfirmTime = Carbon::parse($order->pay_confirm_time);
                $categoryrow    = ProductCategory::where('product_id', $order->product_id)->select('category_id')->first();
                $category_id    = $categoryrow->category_id;

                if ($category_id == 1) {
                    $scheduleTimes = $$sag_receive_minites;//3240;  
                } elseif ($category_id == 2) {
                    $scheduleTimes = $sag_process_minites;//4320;
                } elseif ($category_id == 3) {
                    $scheduleTimes = $sag_shipped_minites;//4320;
                } elseif ($category_id == 4) {
                    $category_id == $sag_complete_minites;//4320;
                } else {
                    $scheduleTimes  = 0;
                }
                $payConfirmTimePlusTwo = $payConfirmTime->copy()->addMinutes($scheduleTimes);
                //  $payConfirmTimePlusTwo = $payConfirmTime->copy()->addMinutes(2);

                echo "ID: {$order->id}, Pay confirm Time: {$order->pay_confirm_time}, Order Status: {$order->order_status}, CategoryID: $category_id, Estimated Last Time: $payConfirmTimePlusTwo<br>";
                //echo $order->id."<br>";
                // Update `order_status` to 3 if 2 minutes or more have passed
                if ($elapsedMinutes >= $scheduleTimes) {
                    $order->order_status = 5;
                    $order->save(); // Save the updated order
                }
            }
        }

        //For Mega Agency Store
        foreach ($getOrdersConvertFive as $order) {
            if (isset($order->pay_confirm_time) && !is_null($order->pay_confirm_time)) {
                // Calculate the difference in minutes between now and the payment confirmation time
                $elapsedMinutes = $now->diffInMinutes(Carbon::parse($order->pay_confirm_time));
                $payConfirmTime = Carbon::parse($order->pay_confirm_time);

                $categoryrow    = ProductCategory::where('product_id', $order->product_id)->select('category_id')->first();
                $category_id    = $categoryrow->category_id;

                if ($category_id == 1) {
                    $scheduleTimes = $mas_receive_minites;//4320; 
                } elseif ($category_id == 2) {
                    $scheduleTimes = $mas_process_minites;//5760;
                } elseif ($category_id == 3) {
                    $scheduleTimes = $mas_shipped_minites;//5760;
                } elseif ($category_id == 4) {
                    $category_id == $mas_complete_minites;//5760;
                } else {
                    $scheduleTimes  = 0;
                }

                $payConfirmTimePlusTwo = $payConfirmTime->copy()->addMinutes($scheduleTimes);
                //  $payConfirmTimePlusTwo = $payConfirmTime->copy()->addMinutes(2);

                echo "ID: {$order->id}, Pay confirm Time: {$order->pay_confirm_time}, Order Status: {$order->order_status}, CategoryID: $category_id, Estimated Last Time: $payConfirmTimePlusTwo<br>";
                //echo $order->id."<br>";
                // Update `order_status` to 3 if 2 minutes or more have passed
                if ($elapsedMinutes >= $scheduleTimes) {
                    $order->order_status = 6;
                    $order->save(); // Save the updated order
                }
            }
        }

        foreach ($getOrdersConvertSix as $order) {
            echo "ID: {$order->id}, Pay confirm Time: {$order->pay_confirm_time}, Order Status: {$order->order_status}<br>";
        }
    }
}
