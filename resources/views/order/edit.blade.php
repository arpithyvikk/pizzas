@extends('layout.main') @section('content')
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4>Edit Pizza</h4>
                    </div>
                    <div class="card-body">
                        <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                        {!! Form::open(['route' => ['pizzas.update', $lims_pizza_data->id], 'method' => 'put', 'files' => true, 'id' => 'pizza-form']) !!}
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Pizza Name</label>
                                            <input type="text" name="name" class="form-control" value="{{$lims_pizza_data->name}}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Pizza Size *</label>
                                            <select required name="size" class="selectpicker form-control" data-live-search="true" data-live-search-style="begins" title="Select pizza size...">
                                                <option value="s" {{$lims_pizza_data->size == 's' ? 'selected' : ''}}>Regular</option>
                                                <option value="m" {{$lims_pizza_data->size == 'm' ? 'selected' : ''}}>Medium</option>
                                                <option value="l" {{$lims_pizza_data->size == 'l' ? 'selected' : ''}}>Large</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Pizza Crust *</label>
                                            <select required name="crust_type" class="selectpicker form-control" data-live-search="true" data-live-search-style="begins" title="Select crust...">
                                                <option value="c1" {{$lims_pizza_data->crust_type == 'c1' ? 'selected' : ''}}>New Hand Tossed</option>
                                                <option value="c2" {{$lims_pizza_data->crust_type == 'c2' ? 'selected' : ''}}>100% Wheat Thin Crust</option>
                                                <option value="c3" {{$lims_pizza_data->crust_type == 'c3' ? 'selected' : ''}}>Cheese Burst</option>
                                                <option value="c4" {{$lims_pizza_data->crust_type == 'c4' ? 'selected' : ''}}>Fresh Pan Pizza</option>
                                                <option value="c5" {{$lims_pizza_data->crust_type == 'c5' ? 'selected' : ''}}>Classic Hand Tossed</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Pizza Image</label> <i class="dripicons-question" data-toggle="tooltip" title="Only jpg, jpeg, png, gif, pdf, csv, docx, xlsx and txt file is supported"></i>
                                            <input type="file" name="img" class="form-control" >
                                            @if($errors->has('extension'))
                                                <span>
                                                   <strong>{{ $errors->first('extension') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-md-12 mt-3">
                                        <label>Select Pizza Ingredients</label>
                                        <div class="search-box input-group">
                                            <button class="btn btn-secondary"><i class="fa fa-circle"></i></button>
                                            <input type="text" name="product_code_name" id="lims_productcodeSearch" placeholder="Please type product code and select..." class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-5">
                                    <div class="col-md-12">
                                        <h5>{{trans('file.Order Table')}} *</h5>
                                        <div class="table-responsive mt-3">
                                            <table id="myTable" class="table table-hover order-list">
                                                <thead>
                                                    <tr>
                                                        <th>{{trans('file.name')}}</th>
                                                        <th>{{trans('file.Quantity')}}</th>
                                                        <th>Unit Type</th>
                                                        <th><i class="dripicons-trash"></i></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php
                                                        $temp_unit_id = [];
                                                        $temp_unit_name = [];
                                                    ?>
                                                    @foreach($lims_product_pizza_data as $product_pizza)
                                                    <tr>
                                                    <?php
                                                        $product_data = DB::table('products')->find($product_pizza->product_id);
                                                        if($product_pizza->variant_id) {
                                                            $product_variant_data = \App\ProductVariant::FindExactProduct($product_data->id, $product_pizza->variant_id)->select('item_code')->first();
                                                            $product_data->code = $product_variant_data->item_code;
                                                        }

                                                        $units = DB::table('units')->where('base_unit', $product_data->unit_id)->orWhere('id', $product_data->unit_id)->get();

                                                        $unit_name = array();
                                                        $unit_id = array();

                                                        foreach($units as $unit) {
                                                            if($product_pizza->sale_unit_id == $unit->id) {
                                                                array_unshift($unit_name, $unit->unit_name);
                                                                array_unshift($unit_id, $unit->id);
                                                            }
                                                            else {
                                                                $unit_name[]  = $unit->unit_name;
                                                                $unit_id[]  = $unit->id;

                                                            }
                                                        }
                                                       $p_units = DB::table('units')->find($product_data->sale_unit_id); 

                                                        $temp_unit_name = $unit_name = implode(",",$unit_name) . ',';
                                                        $temp_unit_id = $unit_id = implode(",",$unit_id) . ',';


                                                        $product_batch_data = \App\ProductBatch::select('batch_no', 'expired_date')->find($product_pizza->product_batch_id);
                                                    ?>
                                                        <td>{{$product_data->name}} <button type="button" class="edit-product btn btn-link" data-toggle="modal" data-target="#editModal"> <i class="dripicons-document-edit"></i></button> </td>
                                                        <td><input type="number" class="form-control qty" name="qty[]" value="{{$product_pizza->qty}}" step="any" required /></td>
                                                        <td>{{$p_units->unit_name}}</td>
                                                       
                                                        <td><button type="button" class="ibtnDel btn btn-md btn-danger">{{trans("file.delete")}}</button></td>
                                                        <input type="hidden" class="product-id" name="product_id[]" value="{{$product_data->id}}"/>
                                                        <input type="hidden" class="product-code" name="product_code[]" value="{{$product_data->code}}"/>
                                                        <input type="hidden" class="pizza-unit" name="pizza_unit[]" value="{{$unit_name}}"/>
                                                        <input type="hidden" class="net_unit_cost" name="net_unit_cost[]" value="{{$product_pizza->net_unit_cost}}" />
                                                    </tr>
                                                    @endforeach
                                                </tbody>
                                                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row mt-5">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>{{trans('file.Note')}}</label>
                                            <textarea rows="3" class="form-control" name="note">{{$lims_pizza_data->note}}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>
                                                <strong>Pizza Price</strong>
                                            </label>
                                            <input type="number" name="price" class="form-control" step="any" value="{{$lims_pizza_data->price}}"/>
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <input type="submit" value="Update" class="btn btn-primary" id="submit-button">
                                </div>
                            </div>
                        </div>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="modal_header" class="modal-title"></h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row modal-element">
                            <div class="col-md-4 form-group">
                                <label>{{trans('file.Quantity')}}</label>
                                <input type="number" name="edit_qty" class="form-control" step="any">
                            </div>
                            <div class="col-md-4 form-group">
                                <label>{{trans('file.Unit Discount')}}</label>
                                <input type="number" name="edit_discount" class="form-control" step="any">
                            </div>
                            <div class="col-md-4 form-group">
                                <label>{{trans('file.Unit Cost')}}</label>
                                <input type="number" name="edit_unit_cost" class="form-control" step="any">
                            </div>
                            <?php
                                $tax_name_all[] = 'No Tax';
                                $tax_rate_all[] = 0;
                                foreach($lims_tax_list as $tax) {
                                    $tax_name_all[] = $tax->name;
                                    $tax_rate_all[] = $tax->rate;
                                }
                            ?>
                            <div class="col-md-4 form-group">
                                <label>{{trans('file.Tax Rate')}}</label>
                                <select name="edit_tax_rate" class="form-control selectpicker">
                                    @foreach($tax_name_all as $key => $name)
                                    <option value="{{$key}}">{{$name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-4 form-group">
                                <label>{{trans('file.Product Unit')}}</label>
                                <select name="edit_unit" class="form-control selectpicker">
                                </select>
                            </div>
                        </div>
                        <button type="button" name="update_btn" class="btn btn-primary">{{trans('file.update')}}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>


@endsection

@push('scripts')
<script type="text/javascript">

    $("ul#pizza").siblings('a').addClass("active");
    $("ul#pizza").addClass("show");

// array data depend on warehouse
var lims_product_array = [];
var product_code = [];
var product_name = [];
var product_qty = [];

// array data with selection
var product_cost = [];
var product_discount = [];
var tax_rate = [];
var tax_name = [];
var tax_method = [];
var unit_name = [];
var unit_operator = [];
var unit_operation_value = [];
var is_imei = [];

// temporary array
var temp_unit_name = [];
var temp_unit_operator = [];
var temp_unit_operation_value = [];

var rowindex;
var customer_group_rate;
var row_product_cost;

var rownumber = $('table.order-list tbody tr:last').index();

for(rowindex  =0; rowindex <= rownumber; rowindex++){

    product_cost.push(parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.product-cost').val()));
    var total_discount = parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.discount').text());
    var quantity = parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val());
    product_discount.push((total_discount / quantity).toFixed(2));
    tax_rate.push(parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-rate').val()));
    tax_name.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-name').val());
    tax_method.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-method').val());
    temp_unit_name = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.pizza-unit').val().split(',');
    unit_name.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.pizza-unit').val());
    unit_operator.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.pizza-unit-operator').val());
    unit_operation_value.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.pizza-unit-operation-value').val());
    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.pizza-unit').val(temp_unit_name[0]);
}

$('.selectpicker').selectpicker({
    style: 'btn-link',
});

$('[data-toggle="tooltip"]').tooltip();

//assigning value
$('select[name="supplier_id"]').val($('input[name="supplier_id_hidden"]').val());
$('select[name="warehouse_id"]').val($('input[name="warehouse_id_hidden"]').val());
$('select[name="status"]').val($('input[name="status_hidden"]').val());
$('select[name="order_tax_rate"]').val($('input[name="order_tax_rate_hidden"]').val());
$('select[name="pizza_status"]').val($('input[name="pizza_status_hidden"]').val());
$('.selectpicker').selectpicker('refresh');

$('#item').text($('input[name="item"]').val() + '(' + $('input[name="total_qty"]').val() + ')');
$('#subtotal').text(parseFloat($('input[name="total_cost"]').val()).toFixed(2));
$('#order_tax').text(parseFloat($('input[name="order_tax"]').val()).toFixed(2));
if($('select[name="status"]').val() == 2){
    $(".recieved-product-qty").removeClass("d-none");

}
if(!$('input[name="order_discount"]').val())
    $('input[name="order_discount"]').val('0.00');
$('#order_discount').text(parseFloat($('input[name="order_discount"]').val()).toFixed(2));
if(!$('input[name="shipping_cost"]').val())
    $('input[name="shipping_cost"]').val('0.00');
$('#shipping_cost').text(parseFloat($('input[name="shipping_cost"]').val()).toFixed(2));
$('#grand_total').text(parseFloat($('input[name="grand_total"]').val()).toFixed(2));

$('select[name="status"]').on('change', function() {
    if($('select[name="status"]').val() == 2){
        $(".recieved-product-qty").removeClass("d-none");
        $(".qty").each(function() {
            rowindex = $(this).closest('tr').index();
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.recieved').val($(this).val());
        });

    }
    else if(($('select[name="status"]').val() == 3) || ($('select[name="status"]').val() == 4)){
        $(".recieved-product-qty").addClass("d-none");
        $(".recieved").each(function() {
            $(this).val(0);
        });
    }
    else {
        $(".recieved-product-qty").addClass("d-none");
        $(".qty").each(function() {
            rowindex = $(this).closest('tr').index();
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.recieved').val($(this).val());
        });
    }
});


var lims_product_code = [
    @foreach($lims_product_list_without_variant as $product)
        <?php
            $productArray[] = htmlspecialchars($product->code . ' (' . $product->name . ')');
        ?>
    @endforeach
    @foreach($lims_product_list_with_variant as $product)
        <?php
            $productArray[] = htmlspecialchars($product->item_code . ' (' . $product->name . ')');
        ?>
    @endforeach
        <?php
        echo  '"'.implode('","', $productArray).'"';
        ?>
];

    var lims_productcodeSearch = $('#lims_productcodeSearch');

    lims_productcodeSearch.autocomplete({
    source: function(request, response) {
        var matcher = new RegExp(".?" + $.ui.autocomplete.escapeRegex(request.term), "i");
        response($.grep(lims_product_code, function(item) {
            return matcher.test(item);
        }));
    },
    response: function(event, ui) {
        if (ui.content.length == 1) {
            var data = ui.content[0].value;
            $(this).autocomplete( "close" );
            productSearch(data);
        };
    },
    select: function(event, ui) {
        var data = ui.item.value;
        productSearch(data);
    }
});

$('body').on('focus',".expired-date", function() {
    $(this).datepicker({
        format: "yyyy-mm-dd",
        startDate: "<?php echo date("Y-m-d", strtotime('+ 1 days')) ?>",
        autoclose: true,
        todayHighlight: true
    });
});

//Change quantity
$("#myTable").on('input', '.qty', function() {
    rowindex = $(this).closest('tr').index();
    if($(this).val() < 1 && $(this).val() != '') {
      $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val(1);
      alert("Quantity can't be less than 1");
    }
    checkQuantity($(this).val(), true);
});


//Delete product
$("table.order-list tbody").on("click", ".ibtnDel", function(event) {
    rowindex = $(this).closest('tr').index();
    product_cost.splice(rowindex, 1);
    product_discount.splice(rowindex, 1);
    tax_rate.splice(rowindex, 1);
    tax_name.splice(rowindex, 1);
    tax_method.splice(rowindex, 1);
    unit_name.splice(rowindex, 1);
    unit_operator.splice(rowindex, 1);
    unit_operation_value.splice(rowindex, 1);
    $(this).closest("tr").remove();
    calculateTotal();
});

//Edit product
$("table.order-list").on("click", ".edit-product", function() {
    rowindex = $(this).closest('tr').index();
    $(".imei-section").remove();
    var imeiNumbers = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.imei-number').val();
    if(imeiNumbers || is_imei[rowindex]) {
        htmlText = '<div class="col-md-12 form-group imei-section"><label>IMEI or Serial Numbers</label><input type="text" name="imei_numbers" value="'+imeiNumbers+'" class="form-control imei_number" placeholder="Type imei or serial numbers and separate them by comma. Example:1001,2001" step="any"></div>';
        $("#editModal .modal-element").append(htmlText);
    }
    var row_product_name = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(1)').text();
    var row_product_code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(2)').text();
    $('#modal_header').text(row_product_name + '(' + row_product_code + ')');

    var qty = $(this).closest('tr').find('.qty').val();
    $('input[name="edit_qty"]').val(qty);

    $('input[name="edit_discount"]').val(parseFloat(product_discount[rowindex]).toFixed(2));

    unitConversion();
    $('input[name="edit_unit_cost"]').val(row_product_cost.toFixed(2));

    var tax_name_all = <?php echo json_encode($tax_name_all) ?>;
    var pos = tax_name_all.indexOf(tax_name[rowindex]);
    $('select[name="edit_tax_rate"]').val(pos);

    temp_unit_name = (unit_name[rowindex]).split(',');
    temp_unit_name.pop();
    temp_unit_operator = (unit_operator[rowindex]).split(',');
    temp_unit_operator.pop();
    temp_unit_operation_value = (unit_operation_value[rowindex]).split(',');
    temp_unit_operation_value.pop();
    $('select[name="edit_unit"]').empty();
    $.each(temp_unit_name, function(key, value) {
        $('select[name="edit_unit"]').append('<option value="' + key + '">' + value + '</option>');
    });
    $('.selectpicker').selectpicker('refresh');
});

//Update product
$('button[name="update_btn"]').on("click", function() {
    var imeiNumbers = $("#editModal input[name=imei_numbers]").val();
    if(imeiNumbers || is_imei[rowindex]) {
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.imei-number').val(imeiNumbers);
    }

    var edit_discount = $('input[name="edit_discount"]').val();
    var edit_qty = $('input[name="edit_qty"]').val();
    var edit_unit_cost = $('input[name="edit_unit_cost"]').val();

    if (parseFloat(edit_discount) > parseFloat(edit_unit_cost)) {
        alert('Invalid Discount Input!');
        return;
    }

    if(edit_qty < 1) {
        $('input[name="edit_qty"]').val(1);
        edit_qty = 1;
        alert("Quantity can't be less than 1");
    }

    var row_unit_operator = unit_operator[rowindex].slice(0, unit_operator[rowindex].indexOf(","));
    var row_unit_operation_value = unit_operation_value[rowindex].slice(0, unit_operation_value[rowindex].indexOf(","));
    row_unit_operation_value = parseFloat(row_unit_operation_value);
    var tax_rate_all = <?php echo json_encode($tax_rate_all) ?>;


    tax_rate[rowindex] = parseFloat(tax_rate_all[$('select[name="edit_tax_rate"]').val()]);
    tax_name[rowindex] = $('select[name="edit_tax_rate"] option:selected').text();


    if (row_unit_operator == '*') {
        product_cost[rowindex] = $('input[name="edit_unit_cost"]').val() / row_unit_operation_value;
    } else {
        product_cost[rowindex] = $('input[name="edit_unit_cost"]').val() * row_unit_operation_value;
    }

    product_discount[rowindex] = $('input[name="edit_discount"]').val();
    var position = $('select[name="edit_unit"]').val();
    var temp_operator = temp_unit_operator[position];
    var temp_operation_value = temp_unit_operation_value[position];
    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.pizza-unit').val(temp_unit_name[position]);
    temp_unit_name.splice(position, 1);
    temp_unit_operator.splice(position, 1);
    temp_unit_operation_value.splice(position, 1);

    temp_unit_name.unshift($('select[name="edit_unit"] option:selected').text());
    temp_unit_operator.unshift(temp_operator);
    temp_unit_operation_value.unshift(temp_operation_value);

    unit_name[rowindex] = temp_unit_name.toString() + ',';
    unit_operator[rowindex] = temp_unit_operator.toString() + ',';
    unit_operation_value[rowindex] = temp_unit_operation_value.toString() + ',';
    checkQuantity(edit_qty, false);
});

function productSearch(data) {
    $.ajax({
        type: 'GET',
        url: '../lims_product_search',
        data: {
            data: data
        },
        success: function(data) {
            var flag = 1;
            $(".product-code").each(function(i) {
                if ($(this).val() == data[1]) {
                    rowindex = i;
                    var qty = parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val()) + 1;
                    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val(qty);
                    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .recieved').val(qty);
                    calculateRowProductData(qty);
                    flag = 0;
                }
            });
            $("input[name='product_code_name']").val('');
            if(flag){
                    var newRow = $("<tr>");
                    var cols = '';
                    temp_unit_name = (data[6]).split(',');
                    cols += '<td>' + data[0] + '<button type="button" class="edit-product btn btn-link" data-toggle="modal" data-target="#editModal"> <i class="dripicons-document-edit"></i></button></td>';
                    // cols += '<td>' + data[1] + '</td>';
                    cols += '<td><input type="number" class="form-control qty" name="qty[]" value="1" step="any" required/></td>';
                    cols += '<td>' + temp_unit_name[0] + ' </td>';
                    // if($('select[name="status"]').val() == 1)
                    //     cols += '<input type="number" class="form-control recieved" name="recieved[]" value="1" step="any"/>';
                    // else if($('select[name="status"]').val() == 2)
                    //     cols += '<input type="number" class="form-control recieved" name="recieved[]" value="1" step="any"/></td>';
                    // else
                    //     cols += '<input type="hidden" class="form-control recieved" name="recieved[]" value="0" step="any"/>';
                    // if(data[10]) {
                    //     cols += '<input type="hidden" class="form-control batch-no" name="batch_no[]" required/>';
                    //     cols += '<input type="hidden" class="form-control expired-date" name="expired_date[]" required/>';
                    // }
                    // else {
                    //     cols += '<input type="hiddden" class="form-control batch-no" name="batch_no[]" disabled/>';
                    //     cols += '<input type="hidden" class="form-control expired-date" name="expired_date[]" disabled/>';
                    // }

                    // cols += '<td class="net_unit_cost"></td>';
                    // cols += '<td class="discount">0.00</td>';
                    // cols += '<td class="tax"></td>';
                    // cols += '<td class="sub-total"></td>';
                    // cols += '<input type="hidden" class="sale-unit" name="unit[]" value="' + temp_unit_name[0] + '"/>';
                    cols += '<td><button type="button" class="ibtnDel btn btn-md btn-danger">{{trans("file.delete")}}</button></td>';
                    // cols += '<input type="hidden" class="product-code" name="product_code[]" value="' + data[1] + '"/>';
                    cols += '<input type="hidden" class="product-id" name="product_id[]" value="' + data[9] + '"/>';
                    // cols += '<input type="hidden" class="net_unit_cost" name="net_unit_cost[]" />';
                    // cols += '<input type="hidden" class="discount-value" name="discount[]" />';
                    // cols += '<input type="hidden" class="tax-rate" name="tax_rate[]" value="' + data[3] + '"/>';
                    // cols += '<input type="hidden" class="tax-value" name="tax[]" />';
                    // cols += '<input type="hidden" class="subtotal-value" name="subtotal[]" />';
                    // cols += '<input type="hidden" class="imei-number" name="imei_number[]" />';

                    newRow.append(cols);
                    $("table.order-list tbody").prepend(newRow);

                    rowindex = newRow.index();
                    product_cost.splice(rowindex,0, parseFloat(data[2]));
                    product_discount.splice(rowindex,0, '0.00');
                    tax_rate.splice(rowindex,0, parseFloat(data[3]));
                    tax_name.splice(rowindex,0, data[4]);
                    tax_method.splice(rowindex,0, data[5]);
                    unit_name.splice(rowindex,0, data[6]);
                    unit_operator.splice(rowindex,0, data[7]);
                    unit_operation_value.splice(rowindex,0, data[8]);
                    is_imei.splice(rowindex, 0, data[11]);
                    calculateRowProductData(1);
                    if(data[11]) {
                        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.edit-product').click();
                    }
                }
        }
    });
}
function checkQuantity(pizza_qty, flag) {
    var row_product_code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(2)').text();
    var pos = product_code.indexOf(row_product_code);
    var operator = unit_operator[rowindex].split(',');
    var operation_value = unit_operation_value[rowindex].split(',');
    if(operator[0] == '*')
    	total_qty = pizza_qty * operation_value[0];
    else if(operator[0] == '/')
    	total_qty = pizza_qty / operation_value[0];

    $('#editModal').modal('hide');
    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val(pizza_qty);
    var status = $('select[name="status"]').val();
    if(status == '1' || status == '2' )
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.recieved').val(pizza_qty);

    calculateRowProductData(pizza_qty);
}

function calculateRowProductData(quantity) {
    unitConversion();
    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.discount').text((product_discount[rowindex] * quantity).toFixed(2));
    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.discount-value').val((product_discount[rowindex] * quantity).toFixed(2));
    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-rate').val(tax_rate[rowindex].toFixed(2));

    if (tax_method[rowindex] == 1) {
        var net_unit_cost = row_product_cost - product_discount[rowindex];
        var tax = net_unit_cost * quantity * (tax_rate[rowindex] / 100);
        var sub_total = (net_unit_cost * quantity) + tax;

        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_cost').text(net_unit_cost.toFixed(2));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_cost').val(net_unit_cost.toFixed(2));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax').text(tax.toFixed(2));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-value').val(tax.toFixed(2));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sub-total').text(sub_total.toFixed(2));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.subtotal-value').val(sub_total.toFixed(2));
    } else {
        var sub_total_unit = row_product_cost - product_discount[rowindex];
        var net_unit_cost = (100 / (100 + tax_rate[rowindex])) * sub_total_unit;
        var tax = (sub_total_unit - net_unit_cost) * quantity;
        var sub_total = sub_total_unit * quantity;

        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_cost').text(net_unit_cost.toFixed(2));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_cost').val(net_unit_cost.toFixed(2));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax').text(tax.toFixed(2));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-value').val(tax.toFixed(2));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sub-total').text(sub_total.toFixed(2));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.subtotal-value').val(sub_total.toFixed(2));
    }

    calculateTotal();
}

function unitConversion() {
    var row_unit_operator = unit_operator[rowindex].slice(0, unit_operator[rowindex].indexOf(","));
    var row_unit_operation_value = unit_operation_value[rowindex].slice(0, unit_operation_value[rowindex].indexOf(","));
    row_unit_operation_value = parseFloat(row_unit_operation_value);
    if (row_unit_operator == '*') {
        row_product_cost = product_cost[rowindex] * row_unit_operation_value;
    } else {
        row_product_cost = product_cost[rowindex] / row_unit_operation_value;
    }
}

function calculateTotal() {
    //Sum of quantity
    var total_qty = 0;
    $(".qty").each(function() {

        if ($(this).val() == '') {
            total_qty += 0;
        } else {
            total_qty += parseFloat($(this).val());
        }
    });
    $("#total-qty").text(total_qty);
    $('input[name="total_qty"]').val(total_qty);

    //Sum of discount
    var total_discount = 0;
    $(".discount").each(function() {
        total_discount += parseFloat($(this).text());
    });
    $("#total-discount").text(total_discount.toFixed(2));
    $('input[name="total_discount"]').val(total_discount.toFixed(2));

    //Sum of tax
    var total_tax = 0;
    $(".tax").each(function() {
        total_tax += parseFloat($(this).text());
    });
    $("#total-tax").text(total_tax.toFixed(2));
    $('input[name="total_tax"]').val(total_tax.toFixed(2));

    //Sum of subtotal
    var total = 0;
    $(".sub-total").each(function() {
        total += parseFloat($(this).text());
    });
    $("#total").text(total.toFixed(2));
    $('input[name="total_cost"]').val(total.toFixed(2));

    calculateGrandTotal();
}

function calculateGrandTotal() {

    var item = $('table.order-list tbody tr:last').index();

    var total_qty = parseFloat($('#total-qty').text());
    var subtotal = parseFloat($('#total').text());
    var order_tax = parseFloat($('select[name="order_tax_rate"]').val());
    var order_discount = parseFloat($('input[name="order_discount"]').val());
    var shipping_cost = parseFloat($('input[name="shipping_cost"]').val());

    if (!order_discount)
        order_discount = 0.00;
    if (!shipping_cost)
        shipping_cost = 0.00;

    item = ++item + '(' + total_qty + ')';
    order_tax = (subtotal - order_discount) * (order_tax / 100);
    var grand_total = (subtotal + order_tax + shipping_cost) - order_discount;

    $('#item').text(item);
    $('input[name="item"]').val($('table.order-list tbody tr:last').index() + 1);
    $('#subtotal').text(subtotal.toFixed(2));
    $('#order_tax').text(order_tax.toFixed(2));
    $('input[name="order_tax"]').val(order_tax.toFixed(2));
    $('#order_discount').text(order_discount.toFixed(2));
    $('#shipping_cost').text(shipping_cost.toFixed(2));
    $('#grand_total').text(grand_total.toFixed(2));
    $('input[name="grand_total"]').val(grand_total.toFixed(2));
}

$('input[name="order_discount"]').on("input", function() {
    calculateGrandTotal();
});

$('input[name="shipping_cost"]').on("input", function() {
    calculateGrandTotal();
});

$('select[name="order_tax_rate"]').on("change", function() {
    calculateGrandTotal();
});

$(window).keydown(function(e){
    if (e.which == 13) {
        var $targ = $(e.target);
        if (!$targ.is("textarea") && !$targ.is(":button,:submit")) {
            var focusNext = false;
            $(this).find(":input:visible:not([disabled],[readonly]), a").each(function(){
                if (this === e.target) {
                    focusNext = true;
                }
                else if (focusNext){
                    $(this).focus();
                    return false;
                }
            });
            return false;
        }
    }
});

$('#pizza-form').on('submit',function(e){
    var rownumber = $('table.order-list tbody tr:last').index();
    if (rownumber < 0) {
        alert("Please insert product to order table!")
        e.preventDefault();
    }

    else if($('select[name="status"]').val() != 1)
    {
        flag = 0;
        $(".qty").each(function() {
            rowindex = $(this).closest('tr').index();
            quantity =  $(this).val();
            recieved = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.recieved').val();

            if(quantity != recieved){
                flag = 1;
                return false;
            }
        });
        if(!flag){
            alert('Quantity and Recieved value is same! Please Change pizza Status or Recieved value');
            e.preventDefault();
        }
        else
            $(".batch-no, .expired-date").prop('disabled', false);
    }
    else
        $(".batch-no, .expired-date").prop('disabled', false);
});
</script>
@endpush
