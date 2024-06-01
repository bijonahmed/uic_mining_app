<?php

namespace App\Http\Controllers\Public;

use App\Http\Controllers\Controller;
use App\Models\MystoreHistory;
use App\Models\Order;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductCategory;
//use Darryldecode\Cart\Cart;
use Illuminate\Support\Facades\Session;
use Cart;
use Carbon\Carbon;

class PublicController extends Controller
{


    function printCategoryProducts($selectCat, $limit)
    {

        $productIDs = [];
        $totalSellingPrice = 0;
        foreach ($selectCat as $v) {
            $productid   = $v['product_id'];
            $category_id = $v['category_id'];
            $findProduct = Product::where('id', $productid)->first();
            if ($findProduct) {
                $sellingPrice = $findProduct->buying_price;
                // Check if adding the current selling price would exceed the limit
                if ($totalSellingPrice + $sellingPrice <= $limit) {
                    //  echo "Product ID: $productid ---------- Selling Price: $sellingPrice, CategoryID: $category_id<br/>";
                    // echo "$sellingPrice<br/>";
                    echo "Product ID: $productid <br/>";
                    $productIDs[] = $productid;
                    $totalSellingPrice += $sellingPrice;
                } else {
                    break; // Stop the loop if exceeding the limit
                }
            }
        }
        $productIDsString = implode(', ', $productIDs);
        return $productIDsString;
    }


    public function createOrderSchedule()
    {

        $current_date   = date("Y-m-d H:i:s");

        $customTimeZone             = 'Asia/Dubai';
        $currentTime                = Carbon::now($customTimeZone);
        $startTime                  = Carbon::now($customTimeZone);
        $currentTime->addHours(11);
        //$currentTime->addMinutes(2);
        // Format the datetime as needed
        $currentTimeFormatted       = $currentTime->format('Y-m-d H:i:s');

        $active_stores = MystoreHistory::where('end_date', '>=', $current_date)
            ->whereIn('user_id', [2456])
            //->groupBy('user_id')
            ->get(); // Convert collection to array

        $allstoreUsers = MystoreHistory::where('end_date', '>=', $current_date)
            ->whereIn('user_id', [2456])
            //->groupBy('user_id')
            ->get(); // Convert collection to array



        $selectCatOne = [];
        $selectCatTwo = [];
        $selectCatThree = [];
        $selectCatFour = [];
        $allUsers = [];
        if (!empty($active_stores)) {
            foreach ($active_stores as $store) {
                $allUsers[] = [
                    'user_id'           => $store->user_id,
                ];
                // echo "User ID: $store->user_id, My Store ID:  $store->mystore_id .  CategoryID: $store->category_id.  End Date:  $store->end_date<br>";
                $categors = ProductCategory::where('category_id', $store->category_id)->get();
                foreach ($categors as $cat) {

                    if ($cat->category_id == 1) {
                        $selectCatOne[] = [
                            'category_id'       => $cat->category_id,
                            'product_id'        => $cat->product_id,
                            'user_id'           => $cat->user_id,
                        ];
                    }

                    if ($cat->category_id == 2) {
                        $selectCatTwo[] = [
                            'category_id'       => $cat->category_id,
                            'product_id'        => $cat->product_id,
                            'user_id'           => $cat->user_id,
                        ];
                    }

                    if ($cat->category_id == 3) {
                        $selectCatThree[] = [
                            'category_id'       => $cat->category_id,
                            'product_id'        => $cat->product_id,
                            'user_id'           => $cat->user_id,
                        ];
                    }
                    if ($cat->category_id == 4) {
                        $selectCatFour[] = [
                            'category_id'       => $cat->category_id,
                            'product_id'        => $cat->product_id,
                            'user_id'           => $cat->user_id,
                        ];
                    }
                }
            }

            echo "Category------------------------1------------------------------------------<br>";
            $selectCatOneProducts = $this->printCategoryProducts($selectCatOne, 200);
            echo "Category------------------------2------------------------------------------<br>";
            $selectCatTwoProducts = $this->printCategoryProducts($selectCatTwo, 1000);
            echo "Category------------------------3------------------------------------------<br>";
            $selectCatThreeProducts = $this->printCategoryProducts($selectCatThree, 2000);
            echo "Category------------------------4------------------------------------------<br>";
            $selectCatFourProducts =  $this->printCategoryProducts($selectCatFour, 5000);
            echo "Category-----------------------make foreach------------------------------------------<br>";
            //  exit;
            // Merge the arrays
            $productIDStrings = array_filter([$selectCatOneProducts, $selectCatTwoProducts, $selectCatThreeProducts, $selectCatFourProducts]);
            // Check if there are any non-empty product ID strings
            if (!empty($productIDStrings)) {
                // Merge the non-empty strings and remove duplicates
                $productIDsString = implode(', ', array_unique($productIDStrings));
                echo "Merged Product IDs: $productIDsString";
                //start 
                $productIDsArray = explode(', ', $productIDsString);
                // Initialize an array to store product models

                /*
               foreach ($acstores as $key => $user) {
                    // Check if $user is an array and contains a 'user_id' or other key
                   if (is_array($user) && isset($user['user_id'])) {
                        //echo "----User ID: " . $user['user_id'] . "<br>";
                        foreach ($productIDsArray as $product) {
                            $pro_row = Product::find($product);
                            $pro_cat = ProductCategory::where('product_id',$pro_row->id)->first();
                            Order::create([
                                'category_id'       => !empty($pro_cat->category_id) ? $pro_cat->category_id : "",
                                'product_id'        => $pro_row->id,
                                'product_name'      => $pro_row->name,
                                'selling_price'     => $pro_row->selling_price, ///$product['selling_price'],
                                'order_date'        => date("Y-m-d"),
                                'created_at'        =>  $startTime,
                                'order_inactive_time' =>  $currentTimeFormatted,
                                'profit'            => $pro_row->profit,
                                'user_id'           => 2456,//$user['user_id'],
                                'orderId'           => $this->generateUniqueRandomNumber(),
                                'product_qty'       => 1,
                                'buying_price'      => $pro_row->buying_price, //$product['buying_price'],
                                'order_status'      => 1, //To be paid.
                                'order_type'        => 'System', //To be paid.
                                'thumnail_img'      => !empty($pro_row->thumbnail_img) ? url($pro_row->thumbnail_img) : "",
                            ]);
                        }
                     } else {
                     echo "Invalid user data at key $key<br>";
                 }
               }*/


                foreach ($allstoreUsers as $user) {
                    $userID = $user['user_id'];
                    $store_id = $user['id'];
                    echo "<br>UserID: $userID----, storeID: $store_id<br>";
                   // if (is_array($user) && isset($user['user_id'])) {
                    /*
                        foreach ($productIDsArray as $product) {
                            $pro_row = Product::find($product);
                            $pro_cat = ProductCategory::where('product_id', $pro_row->id)->first();
                            Order::create([
                                'category_id'       => !empty($pro_cat->category_id) ? $pro_cat->category_id : "",
                                'product_id'        => $pro_row->id,
                                'product_name'      => $pro_row->name,
                                'selling_price'     => $pro_row->selling_price, ///$product['selling_price'],
                                'order_date'        => date("Y-m-d"),
                                'created_at'        =>  $startTime,
                                'order_inactive_time' =>  $currentTimeFormatted,
                                'profit'            => $pro_row->profit,
                                'user_id'           => $userID, //$user['user_id'],
                                'orderId'           => $this->generateUniqueRandomNumber(),
                                'product_qty'       => 1,
                                'buying_price'      => $pro_row->buying_price, //$product['buying_price'],
                                'order_status'      => 1, //To be paid.
                                'order_type'        => 'System', //To be paid.
                                'thumnail_img'      => !empty($pro_row->thumbnail_img) ? url($pro_row->thumbnail_img) : "",
                            ]);
                        }
                        */
                    //}
                }



                exit;
            }
            //dd($allUsers);
            $data['msg'] = "Successfully insert orders";
            return response()->json($data, 200);
        } else {
            return response()->json("No active stores found", 200);
        }
    }

    public function backupcreateOrderSchedule()
    {

        $current_date   = date("Y-m-d");
        $active_stores  = MystoreHistory::where('end_date', '>=', $current_date)->get();

        $customTimeZone             = 'Asia/Dubai';
        $currentTime                = Carbon::now($customTimeZone);
        $startTime                  = Carbon::now($customTimeZone);
        $currentTime->addHours(11);
        //$currentTime->addMinutes(2);
        // Format the datetime as needed
        $currentTimeFormatted       = $currentTime->format('Y-m-d H:i:s');
        //new 
        // Query Mystore to find stores where the end_date is on or after the current date
        $active_stores  = MystoreHistory::where('end_date', '>=', $current_date)->get();

        // Output the results
        if ($active_stores->isNotEmpty()) {
            $productsArr = [];
            $selected_products = [];
            $allUsers = [];
            foreach ($active_stores as $store) {
                $allUsers[] = [
                    'user_id'           => $store->user_id,
                ];
                //echo "User ID: $store->user_id, My Store ID:  $store->mystore_id .  CategoryID: $store->category_id.  End Date:  $store->end_date<br>";
                $category_id = $store->category_id;
                $pro_category = ProductCategory::where('category_id', $category_id)->pluck('product_id')->toArray();
                //Start Logic
                if ($category_id == 1) {
                    //Store 1 = daily orders = 200$
                    $products_in_range = Product::whereIn('id', $pro_category)
                        // ->where('order_date', $cdate)
                        ->whereBetween('selling_price', [0, 200])
                        ->select('id', 'name', 'selling_price', 'thumnail_img', 'profit', 'buying_price')
                        ->get();

                    // Step 2: Filter to maintain the total selling_price under 200
                    $cumulative_limit = 200;
                    $cumulative_sum = 0;
                    $selected_products = $products_in_range->filter(function ($product) use (&$cumulative_sum, $cumulative_limit) {
                        // If adding this product's selling_price exceeds the limit, exclude it
                        if ($cumulative_sum + $product->selling_price > $cumulative_limit) {
                            return false;
                        }

                        // Otherwise, include it and update the cumulative sum
                        $cumulative_sum += $product->selling_price;
                        return true;
                    });
                }

                if ($category_id == 2) {
                    //Store 2 =  Daily  orders = 1000$
                    $products_in_range = Product::whereIn('id', $pro_category)
                        // ->where('order_date', $cdate)
                        ->whereBetween('selling_price', [0, 1000])
                        ->select('id', 'name', 'selling_price', 'thumnail_img', 'profit', 'buying_price')
                        ->get();

                    // Step 2: Filter to maintain the total selling_price under 200
                    $cumulative_limit = 1000;
                    $cumulative_sum = 0;
                    $selected_products = $products_in_range->filter(function ($product) use (&$cumulative_sum, $cumulative_limit) {
                        // If adding this product's selling_price exceeds the limit, exclude it
                        if ($cumulative_sum + $product->selling_price > $cumulative_limit) {
                            return false;
                        }

                        // Otherwise, include it and update the cumulative sum
                        $cumulative_sum += $product->selling_price;
                        return true;
                    });
                }

                if ($category_id == 3) {
                    //Store 3 = daily orders= 2000$
                    $products_in_range = Product::whereIn('id', $pro_category)
                        // ->where('order_date', $cdate)
                        ->whereBetween('selling_price', [0, 2000])
                        ->select('id', 'name', 'selling_price', 'thumnail_img', 'profit', 'buying_price')
                        ->get();

                    // Step 2: Filter to maintain the total selling_price under 200
                    $cumulative_limit = 2000;
                    $cumulative_sum = 0;
                    $selected_products = $products_in_range->filter(function ($product) use (&$cumulative_sum, $cumulative_limit) {
                        // If adding this product's selling_price exceeds the limit, exclude it
                        if ($cumulative_sum + $product->selling_price > $cumulative_limit) {
                            return false;
                        }

                        // Otherwise, include it and update the cumulative sum
                        $cumulative_sum += $product->selling_price;
                        return true;
                    });
                }

                if ($category_id == 4) {
                    //Store 4 = daily Orders  = 5000$
                    $products_in_range = Product::whereIn('id', $pro_category)
                        // ->where('order_date', $cdate)
                        ->whereBetween('selling_price', [0, 5000])
                        ->select('id', 'name', 'selling_price', 'thumnail_img', 'profit', 'buying_price')
                        ->get();

                    // Step 2: Filter to maintain the total selling_price under 200
                    $cumulative_limit = 5000;
                    $cumulative_sum = 0;
                    $selected_products = $products_in_range->filter(function ($product) use (&$cumulative_sum, $cumulative_limit) {
                        // If adding this product's selling_price exceeds the limit, exclude it
                        if ($cumulative_sum + $product->selling_price > $cumulative_limit) {
                            return false;
                        }

                        // Otherwise, include it and update the cumulative sum
                        $cumulative_sum += $product->selling_price;
                        return true;
                    });
                }
                //echo $store->user_id."<br>";
                //END Logic
            }
            //    dd($selected_products);
            foreach ($allUsers as $key => $user) {
                // Check if $user is an array and contains a 'user_id' or other key
                if (is_array($user) && isset($user['user_id'])) {
                    //echo "----User ID: " . $user['user_id'] . "<br>";
                    foreach ($selected_products as $product) {

                        Order::create([
                            'product_id'        => $product['id'],
                            'product_name'      => $product['name'],
                            'selling_price'     => $product['selling_price'],
                            'order_date'        => date("Y-m-d"),
                            'created_at'        =>  $startTime,
                            'order_inactive_time' =>  $currentTimeFormatted,
                            'profit'            => $product['profit'],
                            'user_id'           => $user['user_id'],
                            'orderId'           => $this->generateUniqueRandomNumber(),
                            'product_qty'       => 1,
                            'buying_price'      => $product['buying_price'],
                            'order_status'      => 1, //To be paid.
                            'order_type'        => 'System', //To be paid.
                            'thumnail_img'      => !empty($product['thumbnail_img']) ? url($product['thumbnail_img']) : "",
                        ]);
                    }
                } else {
                    echo "Invalid user data at key $key<br>";
                }
            }
            /*
            if (!empty($productsArr)) {
                $existingOrder = Order::whereDate('order_date', $current_date)->first();
                if (!$existingOrder) {
                    Order::insert($productsArr);
                }
            }
            */
            $productsArr = Order::where('order_date', $current_date)
                ->where('order_status', 1)->get();
            // dd($productsArr);
            $data['product_count'] = count($productsArr);
            return response()->json($data, 200);
        } else {
            //echo "No active stores found.";
            return response()->json("No active stores found", 200);
        }
    }



    public function removeOrderSchedule()
    {

        $currentDateTime = now();
        echo "Time Zone : Asia/Dubai<br>";
        echo "Server Time" . $currentDateTime . "<br>";
        $current_date    = date("Y-m-d");
        $productsArr     = Order::where('order_date', $current_date)->where('order_status', 1)->get();

        foreach ($productsArr as $product) {
            $inactiveTime = $product->order_inactive_time;

            // Convert inactive time to a Carbon instance for comparison
            $inactiveDateTime = \Carbon\Carbon::parse($inactiveTime);

            if ($currentDateTime > $inactiveDateTime) {
                // Delete the row from the Order model
                Order::where('id', $product->id)->delete();
            } else {

                echo "PID:$product->id,Inactive Time: $product->order_inactive_time<br>";
            }
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
