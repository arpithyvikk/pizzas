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
       
        if($request->quantity > 0)
        {
            $form_pizza = json_encode($request->pizza_id);
            $form_qty = json_encode($request->quantity);
            echo $form_pizza .'<br>';
            echo $form_qty;
        }
        
       
        // $order = new Order;
        // $order->order_date = $request->order_date;
        // $order->pizza_id = $request->pizza_id;
        // $order->pizza_qty = ;
        // $order->user_id = Auth::id();
        // $order->save();

        // $pro_data = array();
        // $product_items = Product::all();
        // foreach($product_items as $product_item)
        // {
        //     $pro_data[$product_item->id] = 0;
        // }
        
        // $pizza_count = count($request->pizza_id);

        // for ($i=0; $i < $pizza_count; $i++) 
        // { 
        //     if($request->quantity[$i] > 0)
        //     {
        //         echo '<b>Pizza No. '.$request->pizza_id[$i].' ('.$request->quantity[$i] .')</b><br>';

        //         $product_pizzas = ProductPizza::where('pizza_id', '=', $request->pizza_id[$i])->get();
        //         foreach($product_pizzas as $product_pizza)
        //         {
        //             $products = Product::where('id',$product_pizza->product_id)->get();
        //             foreach($products as $product)
        //             {                   
                        
        //                 $sale_units = Unit::where('id', $product->sale_unit_id)->first();
        //                 $purchase_units = Unit::where('id', $product->purchase_unit_id)->first();
        //                 $product_units = Unit::where('id', $product->unit_id)->first();

        //                 if($sale_units->id == $product_units->id && $sale_units->id == $purchase_units->id)
        //                 {
        //                     $qty = $product_pizza->qty * $request->quantity[$i];
        //                     $total = $product->qty - $qty;
        //                     // echo $product->name.' ('.$product->id.'-'.$qty.' '.$sale_units->unit_code.')'.' : ';
        //                     // echo ' = '.$total.' '.$sale_units->unit_code.' (s=u=p)<br>';
        //                 }

        //                 else if($sale_units->id == $product_units->id && $sale_units->id != $purchase_units->id)
        //                 {
        //                     $qty = $product_pizza->qty * $request->quantity[$i];
        //                     $cal = $product->qty - $qty;
        //                     $total = $cal / $purchase_units->operation_value;
        //                     $a =  strtok($total, '.');
        //                     $b = $a * $purchase_units->operation_value;
        //                     $c = $cal - $b;
        //                     // echo $product->name.' ('.$qty.' '.$sale_units->unit_code.')'.' : ';
        //                     // echo $a. '.' .$c.$purchase_units->unit_code.' (s==u, s!=p)<br>';
        //                 }

        //                 else if($sale_units->id != $product_units->id && $sale_units->id != $purchase_units->id && $product_units->id == $purchase_units->id)
        //                 {
        //                     $cal = $product_pizza->qty * $request->quantity[$i];
        //                     $qty = $cal / $sale_units->operation_value;
        //                     $total = $product->qty - $qty;
        //                     // echo $product->name.' ('.$qty.' '.$product_units->unit_code.')'.' : ';
        //                     // echo $total .' '.$purchase_units->unit_name.'(s!=u, s!=p, u==p)<br>';
        //                 }

        //                 else{
        //                     $s = $product_pizza->qty * $request->quantity[$i];
        //                     $qty = $s * $sale_units->operation_value;
        //                     $p = $product->qty - $qty;
        //                     $q = $p / $purchase_units->operation_value;
        //                     // echo $product->name.' ('.$s.' '.$sale_units->unit_code.')'.' : ';
        //                     // echo $q . ' ' .$purchase_units->unit_code .' (s!=u!=p)<br>';
        //                 }
                        
        //                 $pro_data[$product->id] += $qty;
        //             }
                    
                    

        //         }

        //         echo '<h1>DATA SAVED</h1><br>';
               
               
        //     }
        // }
        // foreach($pro_data as $key => $value)
        // {   
        //     if($value != 0)
        //     {
        //         $id = $key;
        //         $p_data = Product::find($id);
        //         $p_qty = $p_data->qty;
        //         $total_qty = $p_qty - $value;
        //         // $p_data->qty = $total_qty;
        //         // $p_data->save();
        //         echo $total_qty.'<br>';
        //     }
        // }
        // dd($pro_data);
        // return redirect('pizzas')->with('message', 'pizza created successfully');
    }
}
