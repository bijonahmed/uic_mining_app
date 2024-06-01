<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Auth;
use Validator;
use Helper;
use App\Models\Product;
use App\Models\Sliders;
use App\Models\ProductCategory;
use App\Models\Categorys;
use App\Models\VerifyEmail;
use App\Models\Mystore;
use App\Models\ProductAdditionalImg;
use Illuminate\Support\Str;
use App\Rules\MatchOldPassword;
use Illuminate\Support\Facades\Hash;
use DB;
use File;
use PhpParser\Node\Stmt\TryCatch;
use function Ramsey\Uuid\v1;

class UnauthenticatedController extends Controller
{
    protected $frontend_url;
    protected $userid;




    public function productWiseSubcategory(Request $request)
    {
        $subcategory  = Categorys::where('parent_id', $request->categoryid)->get();
        $result = [];
        foreach ($subcategory as $v) {
            $result[] = [
                'id'            => $v->id,
                'name'          => $v->name,
                'thumnail'      => !empty($v->file) ? url($v->file) : "",
                'slug'          => $v->slug,

            ];
        }
        return response()->json($result, 200);
    }


    public function productWiseBrand(Request $request)
    {


        $catId             = (int)$request->mainCategoryId;
        $subCatId          = (int)$request->subcategoryId;

        //echo "Category : $catId----subcategory: $subCatId";
        //exit; 
        //$category          = Categorys::where('slug', $request->categorySlug)->first();
        $subcategory       = Categorys::where('parent_id', $catId)->get();


        $products        = ProductCategory::join('product', 'product.id', '=', 'produc_categories.product_id')
                        ->join('categorys', 'categorys.id', '=', 'produc_categories.category_id')
                        ->select('product.slug','product.id', 'product.name', 'categorys.name as category_name','product.thumnail_img','product.selling_price','product.buying_price')
                        ->where('product.status', 1)
                        ->whereRaw("FIND_IN_SET($catId, produc_categories.parent_id) > 0")
                        ->whereRaw("FIND_IN_SET($subCatId, produc_categories.parent_id) > 0")->get();

        $result = [];
        foreach ($products as $v) {
            $result[] = [
                'id'            => $v->id,
                'name'          => $v->name, //substr($v->name, 0, 12) . '...',
                'thumnail'      => !empty($v->thumnail_img) ? url($v->thumnail_img) : "",
                'slug'          => $v->slug,
                'selling_price' => $v->selling_price,
                'buying_price'  => $v->buying_price,
            ];
        }

        $subcatresult = [];
        foreach ($subcategory as $v) {
            $subcatresult[] = [
                'id'            => $v->id,
                'name'          => $v->name, //substr($v->name, 0, 12) . '...',
                'thumnail'      => !empty($v->file) ? url($v->file) : "",
                'slug'          => $v->slug,
            ];
        }

      //  $data['allCategory']    = Categorys::where('status', 1)->where('parent_id', 0)->get();
        $data['subCategory']    = $subcatresult;
        $data['result']         = $result;

        return response()->json($data, 200);
    }


    public function backup_ProductWiseBrand(Request $request)
    {


        dd($request->all());

        //  echo "category: $request->categorySlug ---- subcategory  : $request->subcategorySlug";

        $category          = Categorys::where('slug', $request->categorySlug)->first();
        $subcategory       = Categorys::where('slug', $request->subcategorySlug)->first();
        //$subcategory       = Categorys::where('parent_id', $category->id)->where('slug', $request->subcategorySlug)->first();
        //echo "Subcateogry: ".$request->subcategorySlug;
        // dd($subcategory);


        //
        $catId             = $category->id;
        $subCatId          = $subcategory->id;
        //  echo "cate: $catId------subcat: $subCatId";
        //  exit;

        $ids               = implode(',', [$catId, $subCatId]);
        $idsArray          = explode(',', $ids);

        if (!empty($idsArray)) {
            $query = ProductCategory::join('product', 'product.id', '=', 'produc_categories.product_id')
                ->join('categorys', 'categorys.id', '=', 'produc_categories.category_id')
                ->select('product.id', 'product.name', 'categorys.name as category_name')
                ->where('product.status', 1)
                ->whereRaw("FIND_IN_SET($catId, produc_categories.parent_id) > 0")
                ->whereRaw("FIND_IN_SET($subCatId, produc_categories.parent_id) > 0");

            $data = $query->get();
        } else {
            $data = [];
        }

        $result = [];
        foreach ($data as $v) {
            $result[] = [
                'id'            => $v->id,
                'name'          => $v->name, //substr($v->name, 0, 12) . '...',
                'thumnail'      => !empty($v->thumnail_img) ? url($v->thumnail_img) : "",
                'slug'          => $v->slug,
                'selling_price' => $v->selling_price,
                'buying_price'  => $v->buying_price,
            ];
        }


        $subcatsArray = Categorys::where('parent_id', $category->id)->where('status', 1)->get();

        $subcatresult = [];
        foreach ($subcatsArray as $v) {
            $subcatresult[] = [
                'id'            => $v->id,
                'catslug'       => $category->slug,
                'name'          => $v->name, //substr($v->name, 0, 12) . '...',
                'thumnail'      => !empty($v->file) ? url($v->file) : "",
                'slug'          => $v->slug,
            ];
        }

        // dd($subcatresult);


        $data['allCategory']    = Categorys::where('status', 1)->where('parent_id', 0)->get();
        $data['subCategory']    = $subcatresult;
        $data['result']         = $result;

        return response()->json($data, 200);
    }
    public function allCategory(Request $request)
    {
        $categories = Categorys::with('children.children.children.children.children')->where('parent_id', 0)->get();
        return response()->json($categories);
    }

    public function generateUniqueRandomNumber()
    {
        $numbers = [];

        while (count($numbers) < 4) {
            $randomNumber = rand(1000, 9999);
            if (!in_array($randomNumber, $numbers)) {
                $numbers[] = $randomNumber;
            }
        }

        return $numbers[0]; // Since we're generating only one number, return the first (and only) element of the array
    }

    public function checkEmail(Request $request)
    {
        // echo $email;
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|unique:verifyEmail,email',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $uniqueNumber = $this->generateUniqueRandomNumber();
        $data = [
            'email' => $request->email,
            'code'  => $uniqueNumber,
            'status' => 0,
        ];
        VerifyEmail::create($data);

        //dd($request->all());

        $to      = $request->email;
        $subject = 'Dropshipping Verification Code';
        $message = "Your Verification Code :  $uniqueNumber";
        $headers = 'From: dropshping@gmail.com'       . "\r\n" .
            'Reply-To: dropshping@gmail.com' . "\r\n";
        mail($to, $subject, $message, $headers);

        $response = [
            'message' => 'Sending Vertification Email'
        ];
        return response()->json($response, 200);
    }

    public function limitedProducts()
    {

        $data = Product::orderBy('id', 'desc')->select('id', 'name', 'thumnail_img', 'slug')->limit(12)->get();
        //dd($data);
        $collection = collect($data);
        $modifiedCollection = $collection->map(function ($item) {
            return [
                'id'        => $item['id'],
                'name'      => substr($item['name'], 0, 20),
                'thumnail'  => !empty($item->thumnail_img) ? url($item->thumnail_img) : "",
                'slug'      => $item['slug'],
            ];
        });
        //dd($modifiedCollection);
        return response()->json($modifiedCollection, 200);
    }

    public function topSellProducts()
    {
        $data = Product::orderBy('id', 'desc')->select('id', 'name', 'thumnail_img', 'slug')->limit(12)->get();
        foreach ($data as $v) {
            $result[] = [
                'id'   => $v->id,
                'name' => substr($v->name, 0, 12) . '...',
                'thumnail'  => !empty($v->thumnail_img) ? url($v->thumnail_img) : "",
                'slug'     => $v->slug,
            ];
        }

        // dd($result);
        return response()->json($result, 200);
    }

    public function slidersImages()
    {

        $data = Sliders::where('status', 1)->get();

        foreach ($data as $v) {
            $result[] = [
                'id'           => $v->id,
                'images'       => !empty($v->images) ? $v->images : "",
            ];
        }

        return response()->json($result, 200);
    }

    public function getCategory()
    {

        $mainCategories = Categorys::where('status', 1)
            ->where('parent_id', 0)
            ->get();

        $categoryTree = [];

        foreach ($mainCategories as $mainCategory) {
            $subCategories = Categorys::where('status', 1)
                ->where('parent_id', $mainCategory->id)
                ->get();

            $subCategoryArray = [];
            foreach ($subCategories as $subCategory) {
                $subCategoryArray[] = [
                    'id'            => $subCategory->id,
                    'name'          => $subCategory->name,
                    'slug'          => $subCategory->slug,
                    'bg_images'     => !empty($subCategory->bg_images) ? url($subCategory->bg_images) : "",
                    'logo'          => !empty($subCategory->file) ? url($subCategory->file) : "",
                    // Add more fields if needed
                ];
            }

            $categoryTree[] = [
                'id'           => $mainCategory->id,
                'name'         => $mainCategory->name,
                'slug'         => $mainCategory->slug,
                'subcategories' => $subCategoryArray,
            ];
        }

        return response()->json($categoryTree, 200);
    }

    public function productCategory(Request $request)
    {

        $category_id = $request->category_id;
        $category    = Categorys::find($category_id);
        $categorys   = ProductCategory::join('product', 'product.id', '=', 'produc_categories.product_id')
            ->select('produc_categories.product_id', 'product.name', 'product.slug', 'product.thumnail_img')
            ->where('produc_categories.category_id', $category_id)
            ->orderByDesc('product.id')
            ->limit(10)
            ->get();

        foreach ($categorys as $v) {
            $result[] = [
                'product_id'   => $v->product_id,
                'name'         => substr($v->name, 0, 12) . '...',
                'thumnail'     => !empty($v->thumnail_img) ? url($v->thumnail_img) : "",
                'slug'         => $v->slug,
            ];
        }

        $data['result']  = !empty($result) ? $result : "";
        $data['name']    = $category->name;
        $data['catslug'] = $category->slug;
        return response()->json($data, 200);
    }

    public function filterCategory(Request $request)
    {
        $categories = Categorys::where('status', 1)->orderBy("name", "asc")->get();;
        return response()->json($categories);
    }

    public function sliders(Request $request)
    {
        $data = Sliders::where('status', 1)->orderBy("name", "asc")->get();;
        return response()->json($data);
    }

    //filter category
    public function findCategorys(Request $request)
    {

        $slug = $request->slug;
        $chkCategory   = Categorys::where('slug', $slug)->select('id', 'slug', 'parent_id', 'name')->first();

        $proCategorys  = ProductCategory::where('category_id', $chkCategory->id)
            ->select('product.id', 'product.download_link', 'produc_categories.product_id', 'product.name as pro_name', 'produc_categories.category_id', 'description', 'thumnail_img', 'product.slug as pro_slug')
            ->join('product', 'product.id', '=', 'produc_categories.product_id')->limit(32)->get();

        $result = [];
        foreach ($proCategorys as $key => $v) {
            $result[] = [
                'id'           => $v->id,
                'product_id'   => $v->product_id,
                'product_name' => substr($v->pro_name, 0, 12) . '...',
                'p_name'       => $v->pro_name,
                'category_id'  => $v->category_id,
                'download_link' => $v->download_link,
                'thumnail_img' => url($v->thumnail_img),
                'pro_slug'     => $v->pro_slug,

            ];
        }

        $data['result']        = $result;
        $data['pro_count']     = count($result);
        $data['categoryname']  = $chkCategory->name;
        $data['category_slug'] = $chkCategory->slug;
        $data['category_id']   = $chkCategory->parent_id;
        // dd($data);
        return response()->json($data, 200);
    }

    public function filderProduct(Request $request)
    {
        $slug = $request->slug;
        $chkProNameRow   = Product::where('slug', $slug)->select('id', 'slug', 'name')->first();

        $prodata  = ProductCategory::where('product_id', $chkProNameRow->id)
            ->select('product.id', 'categorys.name as category_name', 'produc_categories.product_id', 'product.description', 'product.name as pro_name', 'produc_categories.category_id', 'thumnail_img', 'product.slug as pro_slug', 'product.download_link')
            ->join('product', 'product.id', '=', 'produc_categories.product_id')
            ->join('categorys', 'categorys.id', '=', 'produc_categories.category_id')
            ->first();
        //dd($prodata);
        $data['categoryname']  = $prodata->category_name;
        $data['description']   = $prodata->description;
        $data['download_link'] = $prodata->download_link;
        $data['product_name']  = substr($prodata->pro_name, 0, 12) . '...';
        $data['thumnail_img']  =  url($prodata->thumnail_img);
        return response()->json($data, 200);
    }

    public function getPaginatedData(Request $request)
    {

        $chkCategory = Categorys::where('slug', $request->slug)->select('id', 'parent_id', 'name', 'slug')->first();
        $proCategorys = ProductCategory::where('category_id', $chkCategory->id)
            ->select('product.id', 'product.discount', 'produc_categories.product_id', 'product.name as pro_name', 'produc_categories.category_id', 'description', 'price', 'thumnail_img', 'product.slug as pro_slug')
            ->join('product', 'product.id', '=', 'produc_categories.product_id')
            ->paginate($request->input('perPage', 20));

        $result = [];
        foreach ($proCategorys as $key => $v) {
            $result[] = [
                'id'           => $v->id,
                'product_name' => substr($v->pro_name, 0, 12) . '...', //$v->pro_name, // Use the alias 'pro_name' here
                'thumnail_img' => url($v->thumnail_img),
                'pro_slug'     => $v->pro_slug,
            ];
        }
        $data['result']        = $result;
        $data['pro_count']     = count($result);
        $data['categoryname']  = $chkCategory->name;
        $data['category_id']   = $chkCategory->parent_id;
        $data['category_slug'] = $chkCategory->slug;
        return response()->json($data, 200);
    }

    public function getProductrow(Request $request)
    {

        $products     = Product::where('slug', $request->slug)->select('product.selling_price', 'product.buying_price', 'product.profit', 'product.counter', 'product.id', 'product.name', 'description_full', 'description_short', 'thumnail_img', 'product.download_link')->first();
        $proCategorys = ProductCategory::where('product_id', $products->id)
            ->select('produc_categories.id', 'produc_categories.parent_id', 'categorys.id', 'categorys.name', 'categorys.slug')
            ->join('categorys', 'categorys.id', '=', 'produc_categories.category_id')
            ->first();

        $smilarPro  = ProductCategory::join('product', 'product.id', '=', 'produc_categories.product_id')
            ->join('categorys', 'categorys.id', '=', 'produc_categories.category_id')
            ->select('product.*', 'categorys.name as category_name')
            ->whereNotIn('produc_categories.parent_id', [$proCategorys->parent_id])->where('product.status', 1)
            ->limit(5) // Limiting to 10 records
            ->get();

        $s_products = [];
        foreach ($smilarPro as $v) {
            $s_products[] = [
                'id'            => $v->id,
                'name'          => substr($v->name, 0, 12) . '...',
                'thumnail'      => !empty($v->thumnail_img) ? url($v->thumnail_img) : "",
                'slug'          => $v->slug,
                'selling_price' => $v->selling_price,
                'profit'        => $v->profit,
                'buying_price'  => $v->buying_price,
            ];
        }

        $addproducts  =  ProductAdditionalImg::where('product_id', $products->id)->select('images', 'id')->get();
        foreach ($addproducts as $v) {
            $addi_products[] = [
                'id'            => $v->id,
                'images'        => !empty($v->images) ? url($v->images) : "",
            ];
        }

        $data['product_name']       = !empty($products->name) ? $products->name : "";
        $data['description_full']   = !empty($products->description_full) ? $products->description_full : "";
        $data['description_short']  = !empty($products->description_short) ? strip_tags($products->description_short) : "";
        $data['thumnail_img']       = url($products->thumnail_img);
        $data['download_link']      = !empty($products->download_link) ? $products->download_link : "";
        $data['category_id']        = $proCategorys->id;
        $data['category_slug']      = $proCategorys->slug;
        $data['category_name']      = $proCategorys->name;
        $data['selling_price']      = $products->selling_price;
        $data['buying_price']       = $products->buying_price;
        $data['profit']             = $products->profit;
        $data['similarproducts']    = $s_products;
        $data['addi_products']      = $addi_products;

        return response()->json($data, 200);
    }

    public function defaultShowingProduct()
    {
        $products     = Product::where('status', 1)->select('product.id', 'product.name', 'description', 'thumnail_img', 'slug')->limit(8)->get();
        $result = [];
        foreach ($products as $key => $v) {
            $categoryName = ProductCategory::where('product_id', $v->id)->select('categorys.name as category_name')->join('categorys', 'categorys.id', '=', 'produc_categories.category_id')->first();
            $result[] = [
                'id'           => $v->id,
                'product_name' => substr($v->name, 0, 12) . '...',
                'thumnail_img' => url($v->thumnail_img),
                'pro_slug'     => $v->slug,
                'category_name' => !empty($categoryName->category_name) ? $categoryName->category_name : "",
            ];
        }
        //dd($data);
        return response()->json($result, 200);
    }

    public function defaultShowingMovies()
    {
        $categoryId = 18; //4k Movies
        $products = ProductCategory::where('category_id', $categoryId)
            ->select('product.id', 'categorys.name', 'product.slug', 'product.name as product_name', 'product.thumnail_img')
            ->join('categorys', 'categorys.id', '=', 'produc_categories.category_id')
            ->join('product', 'product.id', '=', 'produc_categories.product_id')
            ->paginate(12);
        //dd($products);

        $result = [];
        foreach ($products as $key => $v) {
            $result[] = [
                'id'           => $v->id,
                'product_name' => substr($v->product_name, 0, 12) . '...',
                'thumnail_img' => url($v->thumnail_img),
                'pro_slug'     => $v->slug,

            ];
        }
        //dd($data);
        return response()->json($result, 200);
    }

    public function showingMoviesCatWise(Request $request)
    {

        $categoryId = 18; //4k Movies
        $products = ProductCategory::where('category_id', $categoryId)
            ->select('product.id', 'categorys.name', 'product.slug', 'product.name as product_name', 'product.thumnail_img')
            ->join('categorys', 'categorys.id', '=', 'produc_categories.category_id')
            ->join('product', 'product.id', '=', 'produc_categories.product_id')
            ->paginate(12);
        //dd($products);

        $result = [];
        foreach ($products as $key => $v) {
            $result[] = [
                'id'           => $v->id,
                'product_name' => substr($v->product_name, 0, 12) . '...',
                'thumnail_img' => url($v->thumnail_img),
                'pro_slug'     => $v->slug,

            ];
        }
        //dd($data);
        return response()->json($result, 200);
    }

    public function videoPagination(Request $request)
    {
        $perPage = 12; // Change this to the number of items per page
        $categoryId = 18; //4k Movies
        $page = $request->input('page', 1);

        $products = ProductCategory::where('category_id', $categoryId)
            ->select('product.id', 'categorys.name', 'product.slug', 'product.name as product_name', 'product.thumnail_img')
            ->join('categorys', 'categorys.id', '=', 'produc_categories.category_id')
            ->join('product', 'product.id', '=', 'produc_categories.product_id')
            ->paginate($perPage, ['*'], 'page', $page);

        $result = [];
        foreach ($products as $key => $v) {
            $result[] = [
                'id'           => $v->id,
                'product_name' => substr($v->product_name, 0, 12) . '...',
                'thumnail_img' => url($v->thumnail_img),
                'pro_slug'     => $v->slug,
            ];
        }
        return response()->json(['data' => $result, 'meta' => $products]);
    }

    public function loadMorePagination(Request $request)
    {
        //dd($request->all());
        $chkCategory = Categorys::where('slug', $request->slug)->select('id', 'parent_id', 'name', 'slug')->first();
        //dd($chkCategory->id);
        $perPage = 5; // Change this to the number of items per page
        $page = $request->input('page', 1);
        $products = ProductCategory::where('category_id', $chkCategory->id)
            ->select('product.id', 'categorys.name', 'product.slug', 'product.name as product_name', 'product.thumnail_img', 'product.download_link')
            ->join('categorys', 'categorys.id', '=', 'produc_categories.category_id')
            ->join('product', 'product.id', '=', 'produc_categories.product_id')
            ->paginate($perPage, ['*'], 'page', $page);

        $result = [];
        foreach ($products as $key => $v) {
            $result[] = [
                'id'           => $v->id,
                'product_name' => substr($v->product_name, 0, 12) . '...',
                'p_name'       => $v->product_name,
                'download_link'       => $v->download_link,
                'thumnail_img' => url($v->thumnail_img),
                'pro_slug'     => $v->slug,
            ];
        }

        // dd($result);
        return response()->json(['data' => $result, 'meta' => $products]);
    }

    public function autocomplete(Request $request)
    {
        $query = $request->input('q');
        $results = Product::where('name', 'like', "%$query%")->select('name', 'id', 'slug')->limit(10)->get();
        $data = [];
        foreach ($results as $key => $v) {
            $productid = (int)$v->id;
            $chkcat = ProductCategory::where('product_id', $productid)->select('category_id')->first();
            //echo $chkcat->category_id."===<br>"; 
            $parent = Categorys::where('id', $chkcat->category_id)->select('parent_id')->first();

            $data[] = [
                'value' => $productid,
                'label' => $v->name,
                'slug'  => $v->slug,
                'parent_id' => !empty($parent->parent_id) ? $parent->parent_id : '',

            ];
        }
        //dd($results);
        return response()->json($data);
    }
    public function getCategoryViewStore(Request $request)
    {

        // view store 
        $my_store_id = $request->my_store_id;
        $chkStore    = Mystore::where('id', $my_store_id)->first();
        $category_id = $chkStore->category_id;

        $mainCategories = Categorys::where('status', 1)
            ->where('id', $category_id)
            ->get();

        $categoryTree = [];

        foreach ($mainCategories as $mainCategory) {
            $subCategories = Categorys::where('status', 1)
                ->where('parent_id', $mainCategory->id)
                ->get();

            $subCategoryArray = [];
            foreach ($subCategories as $subCategory) {
                $subCategoryArray[] = [
                    'id'            => $subCategory->id,
                    'name'          => $subCategory->name,
                    'slug'          => $subCategory->slug,
                    'bg_images'     => !empty($subCategory->bg_images) ? url($subCategory->bg_images) : "",
                    'logo'          => !empty($subCategory->file) ? url($subCategory->file) : "",
                    // Add more fields if needed
                ];
            }

            $categoryTree[] = [
                'id'           => $mainCategory->id,
                'name'         => $mainCategory->name,
                'slug'         => $mainCategory->slug,
                'subcategories' => $subCategoryArray,
            ];
        }

        return response()->json($categoryTree, 200);
    }
    public function getSliders()
    {

        $slider = sliders::where('status', 1)
            ->get();

            $sliderArry = [];
            foreach ($slider as $sliders) {
                $sliderArry[] = [
                    'id'            => $sliders->id,
                    'name'          => $sliders->redirect_url,
                    'images'     => !empty($sliders->images) ? url($sliders->images) : "",     
                    'status'            => $sliders->status,               
                ];
            }

            return response()->json($sliderArry, 200);


    }
}
