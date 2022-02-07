<?php

namespace App\Http\Controllers;

use App\Account;
use App\Payment;
use App\PaymentWithCheque;
use App\PaymentWithCreditCard;
use App\Pizza;
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

class PizzaController extends Controller
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

    public function pizzaData(Request $request)
    {
        $columns = array(
            1 => 'created_at',
            2 => 'image',
            3 => 'name',
            4 => 'size',
            5 => 'crust_type',
            6 => 'price',
            7 => 'total_item',
        );

        $totalData = Pizza::whereDate('created_at', '>=', $request->input('starting_date'))->whereDate('created_at', '<=', $request->input('ending_date'))->count();

        $totalFiltered = $totalData;

        if ($request->input('length') != -1) {
            $limit = $request->input('length');
        } else {
            $limit = $totalData;
        }

        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        
        if (empty($request->input('search.value'))) {
            
        $pizzas = Pizza::offset($start)
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
                $pizzas = Pizza::select('pizzas.*')
                    ->whereDate('pizzas.created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                    ->where('pizzas.user_id', Auth::id())
                    ->orwhere([
                        ['pizzas.name', 'LIKE', "%{$search}%"],
                        ['pizzas.user_id', Auth::id()]
                    ])
                    ->orwhere([
                        ['pizzas.created_at', 'LIKE', "%{$search}%"],
                        ['pizzas.user_id', Auth::id()]
                    ])
                    ->orwhere([
                        ['pizzas.price', 'LIKE', "%{$search}%"],
                        ['pizzas.user_id', Auth::id()]
                    ])
                    ->orwhere([
                        ['pizzas.note', 'LIKE', "%{$search}%"],
                        ['pizzas.user_id', Auth::id()]
                    ])
                   ->offset($start)
                    ->limit($limit)
                    ->orderBy($order, $dir)->get();

                $totalFiltered = Pizza::select('pizzas.*')
                    ->whereDate('pizzas.created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                    ->orwhere([
                        ['pizzas.name', 'LIKE', "%{$search}%"],
                        ['pizzas.user_id', Auth::id()]
                    ])
                    ->orwhere([
                        ['pizzas.created_at', 'LIKE', "%{$search}%"],
                        ['pizzas.user_id', Auth::id()]
                    ])
                    ->orwhere([
                        ['pizzas.price', 'LIKE', "%{$search}%"],
                        ['pizzas.user_id', Auth::id()]
                    ])
                    ->orwhere([
                        ['pizzas.note', 'LIKE', "%{$search}%"],
                        ['pizzas.user_id', Auth::id()]
                    ])
                    ->where('pizzas.user_id', Auth::id())
                    ->count();
            } else {
                $pizzas = Pizza::select('pizzas.*')
                    ->whereDate('pizzas.created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                    ->orwhere('pizzas.name', 'LIKE', "%{$search}%")->orwhere('pizzas.created_at', 'LIKE', "%{$search}%")
                    ->orwhere('pizzas.price', 'LIKE', "%{$search}%")->orwhere('pizzas.note', 'LIKE', "%{$search}%")
                    ->offset($start)
                    ->limit($limit)
                    ->orderBy($order, $dir)
                    ->get();

                $totalFiltered = Pizza::select('pizzas.*')
                    ->whereDate('pizzas.created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                    ->orwhere('pizzas.name', 'LIKE', "%{$search}%")->orwhere('pizzas.created_at', 'LIKE', "%{$search}%")
                    ->orwhere('pizzas.price', 'LIKE', "%{$search}%")->orwhere('pizzas.note', 'LIKE', "%{$search}%")
                    ->count();
            }
        }
        $data = array();
        if (!empty($pizzas)) {
            foreach ($pizzas as $key => $pizza) {
                $nestedData['id'] = $pizza->id;
                $nestedData['key'] = $key;
                $nestedData['date'] = date(config('date_format'), strtotime($pizza->created_at->toDateString()));
                $nestedData['name'] = $pizza->name;
                $nestedData['price'] = '₹'.$pizza->price;
                $nestedData['image'] = $pizza->image;
                $nestedData['total_item'] = $pizza->total_item;
                $nestedData['note'] = $pizza->note;
              
                if($pizza->size == 's')
                {
                    $pizza->size = 'Small';
                }
                elseif($pizza->size == 'm')
                {
                    $pizza->size = 'Medium';
                }
                elseif($pizza->size == 'l')
                {
                    $pizza->size = 'Large';
                }
                else
                {
                    $pizza->size = 'size not define';
                }

                $nestedData['size'] = $pizza->size;

                switch ($pizza->crust_type) {
                    case 'c1':
                        $pizza->crust_type = 'New Hand Tossed';
                        break;
                        case 'c1':
                            $pizza->crust_type = 'New Hand Tossed';
                            break;
                        case 'c2':
                            $pizza->crust_type = '100% Wheat Thin Crust';
                            break;
                        case 'c3':
                            $pizza->crust_type = 'Cheese Burst';
                            break;
                        case 'c4':
                            $pizza->crust_type = 'Fresh Pan Pizza';
                            break;
                        case 'c5':
                            $pizza->crust_type = 'Classic Hand Tossed';
                            break;
                    default:
                        $pizza->crust_type = 'Crust type not define';
                        break;
                }

                $nestedData['crust_type'] = $pizza->crust_type;

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
                if (in_array("pizzas-edit", $request['all_permission'])) {
                    $nestedData['options'] .= '<li>
                        <a href="' . route('pizzas.edit', $pizza->id) . '" class="btn btn-link"><i class="dripicons-document-edit"></i> ' . trans('file.edit') . '</a>
                        </li>';
                }

                if (in_array("pizzas-delete", $request['all_permission'])) {
                    $nestedData['options'] .= \Form::open(["route" => ["pizzas.destroy", $pizza->id], "method" => "DELETE"]) . '
                            <li>
                              <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> ' . trans("file.delete") . '</button>
                            </li>' . \Form::close() . '
                        </ul>
                    </div>';
                }
                // data for purchase details by one click
                $user = User::find($pizza->user_id);
                // $nestedData['pizza'] = array('[ "'.date(config('date_format'), strtotime($pizza->created_at->toDateString())).'"', ' "'.$purchase->reference_no.'"', ' "'.$purchase_status.'"',  ' "'.$purchase->id.'"', ' "'.$purchase->warehouse->name.'"', ' "'.$purchase->warehouse->phone.'"', ' "'.$purchase->warehouse->address.'"', ' "'.preg_replace('/\s+/S', " ", $purchase->note).'"', ' "'.$user->name.'"', ' "'.$user->email.'"]');
                $nestedData['pizza'] = array('["'.date(config('date_format'), strtotime($pizza->created_at->toDateString())).'"', ' "'.$pizza->id.'"', ' "'.$pizza->note.'"', ' "'.$user->name.'"',' "'.$user->email.'"',' "'.$pizza->name.'"',' "'.$pizza->size.'"',' "'.$pizza->crust_type.'"',' " ₹'.$pizza->price.'"]');
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

    public function create()
    {
        $role = Role::find(Auth::user()->role_id);
        if ($role->hasPermissionTo('pizzas-add')) {
            $lims_supplier_list = Supplier::all();
            $lims_warehouse_list = Warehouse::all();
            $lims_tax_list = Tax::all();
            $lims_product_list_without_variant = $this->productWithoutVariant();
            $lims_product_list_with_variant = $this->productWithVariant();

            return view('pizza.create', compact('lims_supplier_list', 'lims_warehouse_list', 'lims_tax_list', 'lims_product_list_without_variant', 'lims_product_list_with_variant'));
        } else {
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
        }
    }

    public function productWithoutVariant()
    {
        return Product::ActiveStandard()->select('id', 'name', 'code')
            ->whereNull('is_variant')->get();
    }

    public function productWithVariant()
    {
        return Product::join('product_variants', 'products.id', 'product_variants.product_id')
            ->ActiveStandard()
            ->whereNotNull('is_variant')
            ->select('products.id', 'products.name', 'product_variants.item_code')
            ->orderBy('position')->get();
    }

    public function limsProductSearch(Request $request)
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
            if ($lims_product_data->purchase_unit_id == $unit->id) {
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

    public function store(Request $request)
    {
        $validator = $request->validate([
            'name' => 'required',
            'size' => 'required',
            'price' => 'required',
            'crust_type' => 'required',
        ]);
        // dd($request)->toArray();
        if (!empty($request->file('img'))) {
            $image = $request->file('img');
            $imageName = time() . '.' . $image->extension();
            $image->move(public_path('images/pizza'), $imageName);
        } else {
            $imageName = 'pizza_image1.png';
        }

        // $id = $request->id;
        $item_count = count($request->product_id);
        
    
        $pizza = new Pizza;
        $pizza->name = $request->name;
        $pizza->size = $request->size;
        $pizza->price = $request->price;
        $pizza->crust_type = $request->crust_type;
        $pizza->image = $imageName;
        $pizza->total_item = $item_count;
        $pizza->user_id = Auth::id();
        $pizza->note = $request->note;
        $pizza->save();

        $pizzas = Pizza::latest()->first();
        $pizza_id = $pizzas->id;

        for ($i=0; $i < $item_count; $i++) { 
            
            $product_pizza = new ProductPizza;
            $product_pizza->pizza_id = $pizza_id;
            $product_pizza->product_id = $request->product_id[$i];
            $product_pizza->qty = $request->qty[$i];
            $product_pizza->save();
        }
        return redirect('pizzas')->with('message', 'pizza created successfully');
    }

    public function productPizzaData($id)
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

    public function purchaseByCsv()
    {
        $role = Role::find(Auth::user()->role_id);
        if ($role->hasPermissionTo('purchases-add')) {
            $lims_supplier_list = Supplier::where('is_active', true)->get();
            $lims_warehouse_list = Warehouse::where('is_active', true)->get();
            $lims_tax_list = Tax::where('is_active', true)->get();

            return view('purchase.import', compact('lims_supplier_list', 'lims_warehouse_list', 'lims_tax_list'));
        } else {
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
        }

    }

    public function importPurchase(Request $request)
    {
        //get the file
        $upload = $request->file('file');
        $ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);
        //checking if this is a CSV file
        if ($ext != 'csv') {
            return redirect()->back()->with('message', 'Please upload a CSV file');
        }

        $filePath = $upload->getRealPath();
        $file_handle = fopen($filePath, 'r');
        $i = 0;
        //validate the file
        while (!feof($file_handle)) {
            $current_line = fgetcsv($file_handle);
            if ($current_line && $i > 0) {
                $product_data[] = Product::where('code', $current_line[0])->first();
                if (!$product_data[$i - 1]) {
                    return redirect()->back()->with('message', 'Product with this code ' . $current_line[0] . ' does not exist!');
                }

                $unit[] = Unit::where('unit_code', $current_line[2])->first();
                if (!$unit[$i - 1]) {
                    return redirect()->back()->with('message', 'Purchase unit does not exist!');
                }

                if (strtolower($current_line[5]) != "no tax") {
                    $tax[] = Tax::where('name', $current_line[5])->first();
                    if (!$tax[$i - 1]) {
                        return redirect()->back()->with('message', 'Tax name does not exist!');
                    }

                } else {
                    $tax[$i - 1]['rate'] = 0;
                }

                $qty[] = $current_line[1];
                $cost[] = $current_line[3];
                $discount[] = $current_line[4];
            }
            $i++;
        }

        $data = $request->except('file');
        $data['reference_no'] = 'pr-' . date("Ymd") . '-' . date("his");
        $document = $request->document;
        if ($document) {
            $v = Validator::make(
                [
                    'extension' => strtolower($request->document->getClientOriginalExtension()),
                ],
                [
                    'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
                ]
            );
            if ($v->fails()) {
                return redirect()->back()->withErrors($v->errors());
            }

            $ext = pathinfo($document->getClientOriginalName(), PATHINFO_EXTENSION);
            $documentName = $data['reference_no'] . '.' . $ext;
            $document->move('public/documents/purchase', $documentName);
            $data['document'] = $documentName;
        }
        $item = 0;
        $grand_total = $data['shipping_cost'];
        $data['user_id'] = Auth::id();
        Purchase::create($data);
        $lims_purchase_data = Purchase::latest()->first();

        foreach ($product_data as $key => $product) {
            if ($product['tax_method'] == 1) {
                $net_unit_cost = $cost[$key] - $discount[$key];
                $product_tax = $net_unit_cost * ($tax[$key]['rate'] / 100) * $qty[$key];
                $total = ($net_unit_cost * $qty[$key]) + $product_tax;
            } elseif ($product['tax_method'] == 2) {
                $net_unit_cost = (100 / (100 + $tax[$key]['rate'])) * ($cost[$key] - $discount[$key]);
                $product_tax = ($cost[$key] - $discount[$key] - $net_unit_cost) * $qty[$key];
                $total = ($cost[$key] - $discount[$key]) * $qty[$key];
            }
            if ($data['status'] == 1) {
                if ($unit[$key]['operator'] == '*') {
                    $quantity = $qty[$key] * $unit[$key]['operation_value'];
                } elseif ($unit[$key]['operator'] == '/') {
                    $quantity = $qty[$key] / $unit[$key]['operation_value'];
                }

                $product['qty'] += $quantity;
                $product_warehouse = Product_Warehouse::where([
                    ['product_id', $product['id']],
                    ['warehouse_id', $data['warehouse_id']],
                ])->first();
                if ($product_warehouse) {
                    $product_warehouse->qty += $quantity;
                    $product_warehouse->save();
                } else {
                    $lims_product_warehouse_data = new Product_Warehouse();
                    $lims_product_warehouse_data->product_id = $product['id'];
                    $lims_product_warehouse_data->warehouse_id = $data['warehouse_id'];
                    $lims_product_warehouse_data->qty = $quantity;
                    $lims_product_warehouse_data->save();
                }
                $product->save();
            }

            $product_purchase = new ProductPurchase();
            $product_purchase->purchase_id = $lims_purchase_data->id;
            $product_purchase->product_id = $product['id'];
            $product_purchase->qty = $qty[$key];
            if ($data['status'] == 1) {
                $product_purchase->recieved = $qty[$key];
            } else {
                $product_purchase->recieved = 0;
            }

            $product_purchase->purchase_unit_id = $unit[$key]['id'];
            $product_purchase->net_unit_cost = number_format((float) $net_unit_cost, 2, '.', '');
            $product_purchase->discount = $discount[$key] * $qty[$key];
            $product_purchase->tax_rate = $tax[$key]['rate'];
            $product_purchase->tax = number_format((float) $product_tax, 2, '.', '');
            $product_purchase->total = number_format((float) $total, 2, '.', '');
            $product_purchase->save();
            $lims_purchase_data->total_qty += $qty[$key];
            $lims_purchase_data->total_discount += $discount[$key] * $qty[$key];
            $lims_purchase_data->total_tax += number_format((float) $product_tax, 2, '.', '');
            $lims_purchase_data->total_cost += number_format((float) $total, 2, '.', '');
        }
        $lims_purchase_data->item = $key + 1;
        $lims_purchase_data->order_tax = ($lims_purchase_data->total_cost - $lims_purchase_data->order_discount) * ($data['order_tax_rate'] / 100);
        $lims_purchase_data->grand_total = ($lims_purchase_data->total_cost + $lims_purchase_data->order_tax + $lims_purchase_data->shipping_cost) - $lims_purchase_data->order_discount;
        $lims_purchase_data->save();
        return redirect('purchases');
    }

    public function edit($id)
    {
        $role = Role::find(Auth::user()->role_id);
        if ($role->hasPermissionTo('pizzas-edit')) {
            $lims_supplier_list = Supplier::where('is_active', true)->get();
            $lims_warehouse_list = Warehouse::where('is_active', true)->get();
            $lims_tax_list = Tax::where('is_active', true)->get();
            $lims_product_list_without_variant = $this->productWithoutVariant();
            $lims_product_list_with_variant = $this->productWithVariant();
            $lims_pizza_data = Pizza::find($id);
            $lims_product_pizza_data = ProductPizza::where('pizza_id', $id)->get();

            return view('pizza.edit', compact('lims_warehouse_list', 'lims_supplier_list', 'lims_product_list_without_variant', 'lims_product_list_with_variant', 'lims_tax_list', 'lims_pizza_data', 'lims_product_pizza_data'));
        } else {
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
        }

    }

    public function update(Request $request, $id)
    {
        $validator = $request->validate([
            'name' => 'required',
            'size' => 'required',
            'price' => 'required',
            'crust_type' => 'required',
        ]);
        // dd($request)->toArray();
        if (!empty($request->file('img'))) {
            $image = $request->file('img');
            $imageName = time() . '.' . $image->extension();
            $image->move(public_path('images/pizza'), $imageName);
        } else {
            $imageName = 'pizza_image1.png';
        }

        // $id = $request->id;
        $item_count = count($request->product_id);
        
    
        $pizza = Pizza::find($id);
        $pizza->name = $request->name;
        $pizza->size = $request->size;
        $pizza->price = $request->price;
        $pizza->crust_type = $request->crust_type;
        $pizza->image = $imageName;
        $pizza->total_item = $item_count;
        $pizza->user_id = Auth::id();
        $pizza->note = $request->note;
        $pizza->save();
        
        $lims_product_pizza_data = ProductPizza::where('pizza_id', $id)->get();

        if(!is_null($lims_product_pizza_data)){
            $lims_product_pizza_data->each->delete();
        }
        
        for ($i=0; $i < $item_count; $i++) {
            $product_pizza = new ProductPizza;
            $product_pizza->pizza_id = $id;
            $product_pizza->product_id = $request->product_id[$i];
            $product_pizza->qty = $request->qty[$i];
            $product_pizza->save();
        }
        return redirect('pizzas')->with('message', 'pizza updated successfully');
    }

    public function addPayment(Request $request)
    {
        $data = $request->all();
        $lims_purchase_data = Purchase::find($data['purchase_id']);
        $lims_purchase_data->paid_amount += $data['amount'];
        $balance = $lims_purchase_data->grand_total - $lims_purchase_data->paid_amount;
        if ($balance > 0 || $balance < 0) {
            $lims_purchase_data->payment_status = 1;
        } elseif ($balance == 0) {
            $lims_purchase_data->payment_status = 2;
        }

        $lims_purchase_data->save();

        if ($data['paid_by_id'] == 1) {
            $paying_method = 'Cash';
        } elseif ($data['paid_by_id'] == 2) {
            $paying_method = 'Gift Card';
        } elseif ($data['paid_by_id'] == 3) {
            $paying_method = 'Credit Card';
        } else {
            $paying_method = 'Cheque';
        }

        $lims_payment_data = new Payment();
        $lims_payment_data->user_id = Auth::id();
        $lims_payment_data->purchase_id = $lims_purchase_data->id;
        $lims_payment_data->account_id = $data['account_id'];
        $lims_payment_data->payment_reference = 'ppr-' . date("Ymd") . '-' . date("his");
        $lims_payment_data->amount = $data['amount'];
        $lims_payment_data->change = $data['paying_amount'] - $data['amount'];
        $lims_payment_data->paying_method = $paying_method;
        $lims_payment_data->payment_note = $data['payment_note'];
        $lims_payment_data->save();

        $lims_payment_data = Payment::latest()->first();
        $data['payment_id'] = $lims_payment_data->id;

        if ($paying_method == 'Credit Card') {
            $lims_pos_setting_data = PosSetting::latest()->first();
            Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            $token = $data['stripeToken'];
            $amount = $data['amount'];

            // Charge the Customer
            $charge = \Stripe\Charge::create([
                'amount' => $amount * 100,
                'currency' => 'usd',
                'source' => $token,
            ]);

            $data['charge_id'] = $charge->id;
            PaymentWithCreditCard::create($data);
        } elseif ($paying_method == 'Cheque') {
            PaymentWithCheque::create($data);
        }
        return redirect('purchases')->with('message', 'Payment created successfully');
    }

    public function getPayment($id)
    {
        $lims_payment_list = Payment::where('purchase_id', $id)->get();
        $date = [];
        $payment_reference = [];
        $paid_amount = [];
        $paying_method = [];
        $payment_id = [];
        $payment_note = [];
        $cheque_no = [];
        $change = [];
        $paying_amount = [];
        $account_name = [];
        $account_id = [];
        foreach ($lims_payment_list as $payment) {
            $date[] = date(config('date_format'), strtotime($payment->created_at->toDateString())) . ' ' . $payment->created_at->toTimeString();
            $payment_reference[] = $payment->payment_reference;
            $paid_amount[] = $payment->amount;
            $change[] = $payment->change;
            $paying_method[] = $payment->paying_method;
            $paying_amount[] = $payment->amount + $payment->change;
            if ($payment->paying_method == 'Cheque') {
                $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $payment->id)->first();
                $cheque_no[] = $lims_payment_cheque_data->cheque_no;
            } else {
                $cheque_no[] = null;
            }
            $payment_id[] = $payment->id;
            $payment_note[] = $payment->payment_note;
            $lims_account_data = Account::find($payment->account_id);
            $account_name[] = $lims_account_data->name;
            $account_id[] = $lims_account_data->id;
        }
        $payments[] = $date;
        $payments[] = $payment_reference;
        $payments[] = $paid_amount;
        $payments[] = $paying_method;
        $payments[] = $payment_id;
        $payments[] = $payment_note;
        $payments[] = $cheque_no;
        $payments[] = $change;
        $payments[] = $paying_amount;
        $payments[] = $account_name;
        $payments[] = $account_id;

        return $payments;
    }

    public function updatePayment(Request $request)
    {
        $data = $request->all();
        $lims_payment_data = Payment::find($data['payment_id']);
        $lims_purchase_data = Purchase::find($lims_payment_data->purchase_id);
        //updating purchase table
        $amount_dif = $lims_payment_data->amount - $data['edit_amount'];
        $lims_purchase_data->paid_amount = $lims_purchase_data->paid_amount - $amount_dif;
        $balance = $lims_purchase_data->grand_total - $lims_purchase_data->paid_amount;
        if ($balance > 0 || $balance < 0) {
            $lims_purchase_data->payment_status = 1;
        } elseif ($balance == 0) {
            $lims_purchase_data->payment_status = 2;
        }

        $lims_purchase_data->save();

        //updating payment data
        $lims_payment_data->account_id = $data['account_id'];
        $lims_payment_data->amount = $data['edit_amount'];
        $lims_payment_data->change = $data['edit_paying_amount'] - $data['edit_amount'];
        $lims_payment_data->payment_note = $data['edit_payment_note'];
        if ($data['edit_paid_by_id'] == 1) {
            $lims_payment_data->paying_method = 'Cash';
        } elseif ($data['edit_paid_by_id'] == 2) {
            $lims_payment_data->paying_method = 'Gift Card';
        } elseif ($data['edit_paid_by_id'] == 3) {
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            $token = $data['stripeToken'];
            $amount = $data['edit_amount'];
            if ($lims_payment_data->paying_method == 'Credit Card') {
                $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $lims_payment_data->id)->first();

                \Stripe\Refund::create(array(
                    "charge" => $lims_payment_with_credit_card_data->charge_id,
                ));

                $charge = \Stripe\Charge::create([
                    'amount' => $amount * 100,
                    'currency' => 'usd',
                    'source' => $token,
                ]);

                $lims_payment_with_credit_card_data->charge_id = $charge->id;
                $lims_payment_with_credit_card_data->save();
            } else {
                // Charge the Customer
                $charge = \Stripe\Charge::create([
                    'amount' => $amount * 100,
                    'currency' => 'usd',
                    'source' => $token,
                ]);

                $data['charge_id'] = $charge->id;
                PaymentWithCreditCard::create($data);
            }
            $lims_payment_data->paying_method = 'Credit Card';
        } else {
            if ($lims_payment_data->paying_method == 'Cheque') {
                $lims_payment_data->paying_method = 'Cheque';
                $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $data['payment_id'])->first();
                $lims_payment_cheque_data->cheque_no = $data['edit_cheque_no'];
                $lims_payment_cheque_data->save();
            } else {
                $lims_payment_data->paying_method = 'Cheque';
                $data['cheque_no'] = $data['edit_cheque_no'];
                PaymentWithCheque::create($data);
            }
        }
        $lims_payment_data->save();
        return redirect('purchases')->with('message', 'Payment updated successfully');
    }

    public function deletePayment(Request $request)
    {
        $lims_payment_data = Payment::find($request['id']);
        $lims_purchase_data = Purchase::where('id', $lims_payment_data->purchase_id)->first();
        $lims_purchase_data->paid_amount -= $lims_payment_data->amount;
        $balance = $lims_purchase_data->grand_total - $lims_purchase_data->paid_amount;
        if ($balance > 0 || $balance < 0) {
            $lims_purchase_data->payment_status = 1;
        } elseif ($balance == 0) {
            $lims_purchase_data->payment_status = 2;
        }

        $lims_purchase_data->save();

        if ($lims_payment_data->paying_method == 'Credit Card') {
            $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $request['id'])->first();
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            \Stripe\Refund::create(array(
                "charge" => $lims_payment_with_credit_card_data->charge_id,
            ));

            $lims_payment_with_credit_card_data->delete();
        } elseif ($lims_payment_data->paying_method == 'Cheque') {
            $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $request['id'])->first();
            $lims_payment_cheque_data->delete();
        }
        $lims_payment_data->delete();
        return redirect('purchases')->with('not_permitted', 'Payment deleted successfully');
    }

    public function deleteBySelection(Request $request)
    {
        $pizza_id = $request['pizzaIdArray'];
        if(!is_null($pizza_id)){
            foreach ($pizza_id as $id) {
                $lims_pizza_data = Pizza::find($id);
                $lims_product_pizza_data = ProductPizza::where('pizza_id', $id)->get();
                
                $lims_pizza_data->delete();
                $lims_product_pizza_data->each->delete();
            }
            return "Deleted Successully";
        }
        else{
            return "somthing is wrong plaese try again";

        }
    }

    public function destroy($id)
    {
        $role = Role::find(Auth::user()->role_id);
        if ($role->hasPermissionTo('pizzas-delete')) {
            $lims_pizza_data = Pizza::find($id);
            $lims_product_pizza_data = ProductPizza::where('pizza_id', $id)->get();

            if(!is_null($lims_pizza_data)){
                $lims_pizza_data->delete();
                $lims_product_pizza_data->each->delete();
                return redirect('pizzas')->with('not_permitted', 'pizza deleted successfully');
            }
            else{
                return redirect('pizzas')->with('not_permitted', 'something is wrong plaese try again');
            }

        }

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
