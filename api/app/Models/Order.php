<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    public $table = "orders";
    protected $fillable = ['category_id','update_by','orderId', 'user_id', 'product_id', 'product_name', 'selling_price', 'buying_price', 'profit', 'order_date', 'product_qty', 'status', 'thumnail_img', 'user_balance', 'user_mul_balance', 'order_inactive_time', 'created_at', 'order_type', 'pay_confirm_time', 'goods_to_be_received_time', 'platform_proceed_Time', 'to_be_shipped_time', 'complete_time', 'cancel_time', 'return_time', 'return_complete_time', 'abnormal_order_time','remarks'];
}
