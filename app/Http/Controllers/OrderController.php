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
            return view('order.index', compact('lims_account_list', 'lims_warehouse_list', 'all_permission', 'lims_pos_setting_data', 'warehouse_id', 'starting_date', 'ending_date'));
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

    public function orderData(Request $request)
    {
        $columns = array(
            1 => 'created_at',
            2 => 'created_at',

        );

        $totalData = Order::whereDate('created_at', '>=', $request->input('starting_date'))->whereDate('created_at', '<=', $request->input('ending_date'))->count();

        $totalFiltered = $totalData;
        $limit = $totalData;
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        if ($request->input('length') != -1) {
            $limit = $request->input('length');
        } else {
            $limit = $totalData;
        }

        $start = $request->input('start');
        
        if (empty($request->input('search.value'))) {
            
        $orders = Order::offset($start)
            ->whereDate('created_at', '>=', $request->input('starting_date'))
            ->whereDate('created_at', '<=', $request->input('ending_date'))
            ->limit($limit)
            ->orderBy($order, $dir)
            ->get();
        } 
        else 
        {
            $search = $request->input('search.value');
            if (Auth::user()->role_id > 2 && config('staff_access') == 'own') 
            {
                $orders = Order::select('orders.*')
                    ->whereDate('orders.created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                    ->where('orders.user_id', Auth::id())
                    ->orwhere([
                        ['orders.order_date', 'LIKE', "%{$search}%"],
                        ['orders.user_id', Auth::id()]
                    ])
                    ->offset($start)
                    ->limit($limit)
                    ->orderBy($order, $dir)
                    ->get();

                $totalFiltered = Order::select('orders.*')
                    ->whereDate('orders.created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                    ->orwhere([
                        ['orders.order_date', 'LIKE', "%{$search}%"],
                        ['orders.user_id', Auth::id()]
                    ])
                    ->where('orders.user_id', Auth::id())
                    ->count();
            } else {
                $orders = Order::select('orders.*')
                    ->whereDate('orders.created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                    ->orwhere('orders.order_date', 'LIKE', "%{$search}%")
                    ->offset($start)
                    ->limit($limit)
                    ->orderBy($order, $dir)
                    ->get();

                $totalFiltered = Order::select('orders.*')
                    ->whereDate('orders.created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                    ->orwhere('orders.order_date', 'LIKE', "%{$search}%")
                    ->count();
            }
        }
        $data = array();
        if (!empty($orders)) {
            foreach ($orders as $key => $order) {
                $nestedData['id'] = $order->id;
                $nestedData['key'] = $key;
                $nestedData['date'] = date(config('date_format'), strtotime($order->created_at->toDateString()));
                $nestedData['order_date'] = $order->order_date;
                
                $index_data =array();

                $index_data = (array)json_decode($order->pizza_id);

                $form = count($index_data);
                
                $nestedData['no_of_item'] = $form;

                // return dd($form);
              
                // $nestedData['supplier'] = $supplier->name;
                // if ($pizza->status == 1) {
                //     $nestedData['purchase_status'] = '<div class="badge badge-success">' . trans('file.Recieved') . '</div>';
                //     $pizza_status = trans('file.Recieved');
                // } elseif ($pizza->status == 2) {
                //     $nestedData['purchase_status'] = '<div class="badge badge-success">' . trans('file.Partial') . '</div>';
                //     $pizza_status = trans('file.Partial');
                // } elseif ($pizza->status == 3) {
                //     $nestedData['purchase_status'] = '<div class="badge badge-danger">' . trans('file.Pending') . '</div>';
                //     $pizza_status = trans('file.Pending');
                // } else {
                //     $nestedData['purchase_status'] = '<div class="badge badge-danger">' . trans('file.Ordered') . '</div>';
                //     $pizza_status = trans('file.Ordered');
                // }

                // if ($pizza->payment_status == 1) {
                //     $nestedData['payment_status'] = '<div class="badge badge-danger">' . trans('file.Due') . '</div>';
                // } else {
                //     $nestedData['payment_status'] = '<div class="badge badge-success">' . trans('file.Paid') . '</div>';
                // }

                // $nestedData['grand_total'] = number_format($pizza->grand_total, 2);
                // $nestedData['paid_amount'] = number_format($pizza->paid_amount, 2);
                // $nestedData['due'] = number_format($pizza->grand_total - $pizza->paid_amount, 2);
                $nestedData['options'] = '<div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' . trans("file.action") . '
                              <span class="caret"></span>
                              <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" class="btn btn-link view"><i class="fa fa-eye"></i> ' . trans('file.View') . '</button>
                                </li>';
                if (in_array("orders-edit", $request['all_permission'])) {
                    $nestedData['options'] .= '<li>
                        <a href="' . route('orders.edit', $order->id) . '" class="btn btn-link"><i class="dripicons-document-edit"></i> ' . trans('file.edit') . '</a>
                        </li>';
                }

                if (in_array("orders-delete", $request['all_permission'])) {
                    $nestedData['options'] .= \Form::open(["route" => ["orders.destroy", $order->id], "method" => "DELETE"]) . '
                            <li>
                              <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> ' . trans("file.delete") . '</button>
                            </li>' . \Form::close() . '
                        </ul>
                    </div>';
                }
                // data for purchase details by one click
                $user = User::find($order->user_id);
                // $nestedData['order'] = array('[ "'.date(config('date_format'), strtotime($order->created_at->toDateString())).'"', ' "'.$purchase->reference_no.'"', ' "'.$purchase_status.'"',  ' "'.$purchase->id.'"', ' "'.$purchase->warehouse->name.'"', ' "'.$purchase->warehouse->phone.'"', ' "'.$purchase->warehouse->address.'"', ' "'.preg_replace('/\s+/S', " ", $purchase->note).'"', ' "'.$user->name.'"', ' "'.$user->email.'"]');
                $nestedData['order'] = array('["'.date(config('date_format'), strtotime($order->created_at->toDateString())).'"', ' "'.$order->id.'"', ' "'.$order->order_date.'"]');
                $data[] = $nestedData;
            }
        }
        $json_data = array(
            "draw" => intval($request->input('draw')),
            "recordsTotal" => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data" => $data,
        );

        echo json_encode($json_data);
    }

    public function productOrderData($order_date)
    {
        $lims_product_pizza_data = Order::where('order_date', $order_date)->get();

        foreach ($lims_product_pizza_data as $key => $product_pizza_data) {
            
            $pizza_id = $product_pizza_data->pizza_id;
            
            $pizza_data = (array)json_decode($pizza_id);
            
            foreach($pizza_data as $pkey => $pvalue)
            {
                $pizzas = Pizza::where('id',$pkey)->first(); 
                $product_pizza[0][] = $pizzas->name;
                $product_pizza[1][] = $pizza_data[$pkey];
            }
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

        $f_pizza_id = $request->pizza_id;
        $f_pizza_qty = $request->quantity;

        $pizza_ary = array();

        foreach($f_pizza_id as $key => $value)
        {
            $pizza_ary[$value] = $f_pizza_qty[$key];
        }
                
        $form = json_encode($pizza_ary);
                
        // $order = new Order;
        // $order->order_date = $request->order_date;
        // $order->pizza_id = $form;
        // $order->user_id = Auth::id();
        // $order->save();

        $pro_data = array();
        $product_items = Product::all();
        foreach($product_items as $product_item)
        {
            $pro_data[$product_item->id] = 0;
        }
        
        $pizza_count = count($request->pizza_id);

        for ($i=0; $i < $pizza_count; $i++) 
        { 
            if($request->quantity[$i] > 0)
            {
                echo '<b>Pizza No. '.$request->pizza_id[$i].' ('.$request->quantity[$i] .')</b><br>';

                $product_orders = ProductPizza::where('pizza_id', '=', $request->pizza_id[$i])->get();
                foreach($product_orders as $product_pizza)
                {
                    $products = Product::where('id',$product_pizza->product_id)->get();
                    foreach($products as $product)
                    {                   
                        
                        $sale_units = Unit::where('id', $product->sale_unit_id)->first();
                        $purchase_units = Unit::where('id', $product->purchase_unit_id)->first();
                        $product_units = Unit::where('id', $product->unit_id)->first();

                        if($sale_units->id == $product_units->id && $sale_units->id == $purchase_units->id)
                        {
                            $qty = $product_pizza->qty * $request->quantity[$i];
                            $total = $product->qty - $qty;
                            // echo $product->name.' ('.$product->id.'-'.$qty.' '.$sale_units->unit_code.')'.' : ';
                            // echo ' = '.$total.' '.$sale_units->unit_code.' (s=u=p)<br>';
                        }

                        else if($sale_units->id == $product_units->id && $sale_units->id != $purchase_units->id)
                        {
                            $qty = $product_pizza->qty * $request->quantity[$i];
                            $cal = $product->qty - $qty;
                            $total = $cal / $purchase_units->operation_value;
                            $a =  strtok($total, '.');
                            $b = $a * $purchase_units->operation_value;
                            $c = $cal - $b;
                            // echo $product->name.' ('.$qty.' '.$sale_units->unit_code.')'.' : ';
                            // echo $a. '.' .$c.$purchase_units->unit_code.' (s==u, s!=p)<br>';
                        }

                        else if($sale_units->id != $product_units->id && $sale_units->id != $purchase_units->id && $product_units->id == $purchase_units->id)
                        {
                            $cal = $product_pizza->qty * $request->quantity[$i];
                            $qty = $cal / $sale_units->operation_value;
                            $total = $product->qty - $qty;
                            // echo $product->name.' ('.$qty.' '.$product_units->unit_code.')'.' : ';
                            // echo $total .' '.$purchase_units->unit_name.'(s!=u, s!=p, u==p)<br>';
                        }

                        else{
                            $s = $product_pizza->qty * $request->quantity[$i];
                            $qty = $s * $sale_units->operation_value;
                            $p = $product->qty - $qty;
                            $q = $p / $purchase_units->operation_value;
                            // echo $product->name.' ('.$s.' '.$sale_units->unit_code.')'.' : ';
                            // echo $q . ' ' .$purchase_units->unit_code .' (s!=u!=p)<br>';
                        }
                        
                        $pro_data[$product->id] += $qty;
                    }
                }

                echo '<h1>DATA SAVED</h1><br>';
            }
        }
        foreach($pro_data as $key => $value)
        {   
            if($value != 0)
            {
                $id = $key;
                $p_data = Product::find($id);
                $p_qty = $p_data->qty;
                $total_qty = $p_qty - $value;
                // $p_data->qty = $total_qty;
                // $p_data->save();
                echo $total_qty.'<br>';
            }
        }
        dd($pro_data);
        // return redirect('orders')->with('message', 'Order added successfully');
    }

    public function show(Request $request)
    {
        $product_code = explode("(", $request['data']);
        $product_code[0] = rtrim($product_code[0], " ");
        $lims_product_data = Product::where([
            ['code', $product_code[0]],
            ['is_active', true],
        ])->first();
        if (!$lims_product_data) {
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->select('products.*', 'product_variants.item_code')
                ->where([
                    ['product_variants.item_code', $product_code[0]],
                    ['products.is_active', true],
                ])->first();
        }

        $product[] = $lims_product_data->name;
        if ($lims_product_data->is_variant) {
            $product[] = $lims_product_data->item_code;
        } else {
            $product[] = $lims_product_data->code;
        }

        $product[] = $lims_product_data->cost;

        if ($lims_product_data->tax_id) {
            $lims_tax_data = Tax::find($lims_product_data->tax_id);
            $product[] = $lims_tax_data->rate;
            $product[] = $lims_tax_data->name;
        } else {
            $product[] = 0;
            $product[] = 'No Tax';
        }
        $product[] = $lims_product_data->tax_method;

        $units = Unit::where("base_unit", $lims_product_data->unit_id)
            ->orWhere('id', $lims_product_data->unit_id)
            ->get();
        $unit_name = array();
        $unit_operator = array();
        $unit_operation_value = array();
        foreach ($units as $unit) {
            if ($lims_product_data->sale_unit_id == $unit->id) {
                array_unshift($unit_name, $unit->unit_name);
                array_unshift($unit_operator, $unit->operator);
                array_unshift($unit_operation_value, $unit->operation_value);
            } else {
                $unit_name[] = $unit->unit_name;
                $unit_operator[] = $unit->operator;
                $unit_operation_value[] = $unit->operation_value;
            }
        }

        $product[] = implode(",", $unit_name) . ',';
        $product[] = implode(",", $unit_operator) . ',';
        $product[] = implode(",", $unit_operation_value) . ',';
        $product[] = $lims_product_data->id;
        $product[] = $lims_product_data->is_batch;
        $product[] = $lims_product_data->is_imei;
        return $product;
    }
}
