<?php

namespace App\Http\Controllers;

use App\Account;
use App\Payment;
use App\PaymentWithCheque;
use App\PaymentWithCreditCard;
use App\Pizza;
use App\Order;
use App\PosSetting;
use App\Product;
use App\ProductBatch;
use App\ProductPurchase;
use App\ProductVariant;
use App\Product_Warehouse;
use App\ProductPizza;
use App\Purchase;
use App\Supplier;
use App\Tax;
use App\Unit;
use App\User;
use App\Warehouse;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Role;
use Stripe\Stripe;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        $role = Role::find(Auth::user()->role_id);
        if ($role->hasPermissionTo('orders-index')) {
            if ($request->input('warehouse_id')) {
                $warehouse_id = $request->input('warehouse_id');
            } else {
                $warehouse_id = 0;
            }

            if ($request->input('starting_date')) {
                $starting_date = $request->input('starting_date');
                $ending_date = $request->input('ending_date');
            } else {
                $starting_date = date("Y-m-d", strtotime(date('Y-m-d', strtotime('-1 year', strtotime(date('Y-m-d'))))));
                $ending_date = date("Y-m-d");
            }
            $permissions = Role::findByName($role->name)->permissions;
            foreach ($permissions as $permission) {
                $all_permission[] = $permission->name;
            }

            if (empty($all_permission)) {
                $all_permission[] = 'dummy text';
            }

            $lims_pos_setting_data = PosSetting::latest()->first();
            $lims_warehouse_list = Warehouse::where('is_active', true)->get();
            $lims_account_list = Account::where('is_active', true)->get();
            return view('pizza.index', compact('lims_account_list', 'lims_warehouse_list', 'all_permission', 'lims_pos_setting_data', 'warehouse_id', 'starting_date', 'ending_date'));
        } else {
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
        }

    }

    public function create()
    {
        $role = Role::find(Auth::user()->role_id);
        if ($role->hasPermissionTo('orders-add')) {
            $lims_product_list = Product::orderBy('name')->get();
            $lims_product_pizza_list = ProductPizza::all();
            $lims_pizza_list = Pizza::orderBy('name')->get();
            $lims_purchase_list = Purchase::all();

            return view('order.create', compact('lims_product_list', 'lims_product_pizza_list', 'lims_pizza_list', 'lims_purchase_list'));
        } else {
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
        }
    }

    public function productOrderData($id)
    {
        $lims_product_pizza_data = ProductPizza::where('pizza_id', $id)->get();

        foreach ($lims_product_pizza_data as $key => $product_pizza_data) {
            
            $product = Product::find($product_pizza_data->product_id);

            $unit = Unit::find($product->sale_unit_id);

            $product_pizza[0][$key] = $product->name;
            $product_pizza[1][$key] = $product_pizza_data->qty;
            $product_pizza[2][$key] = $unit->unit_name;
        }
        return $product_pizza;
    }

    public function store(Request $request)
    {
        $validator = $request->validate([
            'order_date' => 'required',
            'pizza_id' => 'required',
            'quantity' => 'required',
        ]);
        
        $pizza_count = count($request->pizza_id);
        for ($i=0; $i < $pizza_count; $i++) 
        { 
            if($request->quantity[$i] > 0)
            {
                // $order = new Order;
                // $order->order_date = $request->order_date;
                // $order->pizza_id = $request->pizza_id[$i];
                // $order->pizza_qty = $request->quantity[$i];
                // $order->user_id = Auth::id();
                // $order->save();
                echo '<b>Pizza No. '.$request->pizza_id[$i].'</b><br>';
                $product_pizzas = ProductPizza::where('pizza_id', '=', $request->pizza_id[$i])->get();
                foreach($product_pizzas as $product_pizza)
                {
                    // echo $product_pizza->product_id.' - '.$product_pizza->qty.'<br>';

                    $products = Product::where('id',$product_pizza->product_id)->get();
                    foreach($products as $product)
                    {
                        // echo 'Unit id: '.$product->unit_id . '<br>';
                        // echo 'Sale unit id: '.$product->sale_unit_id . '<br>';
                        // echo 'Purchase unit id: '.$product->purchase_unit_id . '<br>';

                        $product_units = Unit::where('id', $product->sale_unit_id)->first();
                        $purchase_units = Unit::where('id', $product->purchase_unit_id)->first();

                        if($product->sale_unit_id == $product->purchase_unit_id){
                            $total = $product->qty - $product_pizza->qty;
                            echo $product->name.' : ';
                            echo $product->qty.' '.$purchase_units->unit_code;
                            echo ' - ';
                            echo $product_pizza->qty.' '.$product_units->unit_code;
                            echo ' = '.$total.'<br>';
                        }
                        else
                        {
                            echo $product->name.' : ';
                            echo $product->qty.' '.$purchase_units->unit_code;
                            echo ' - ';
                            echo $product_pizza->qty.' '.$product_units->unit_code;
                            echo ' = <br>';
                        }
                    }

                }
                echo ' <br>';
            }
            
        }

        // return redirect('pizzas')->with('message', 'pizza created successfully');
    }
}
