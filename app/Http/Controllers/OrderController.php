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
        if ($role->hasPermissionTo('pizzas-index')) {
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
}
