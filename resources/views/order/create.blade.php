@extends('layout.main') @section('content')
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif

<section>
    {!! Form::open(['route' => 'orders.store', 'method' => 'post', 'files' => true, 'id' => 'order-form']) !!}
    <div class="container-fluid">
        <div class="card">
            <div class="card-header mt-2">
                <h3 class="text-center">Order List</h3>
            </div>
            <div class="row mb-3">
                <div class="col-md-4 offset-md-4 mt-3">
                    <div class="form-group">
                        @php
                            date_default_timezone_set('Australia/Melbourne');
                            $date = date('m/d/Y h:i:s a', time());
                            $old_date_timestamp = strtotime($date);
                            $new_date = date('Y-m-d', $old_date_timestamp);   
                        @endphp
                        <input type="date" class="form-control" name="order_date" value="{{$new_date}}" required />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="table-responsive">
        <table id="order-table" class="table order-list" style="width: 100%">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Code</th>
                    <th>No of items</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($lims_pizza_list as $pizza)
                @php
                    $p_old_date_timestamp = strtotime($pizza->created_at);
                    $p_date = date('d-m-Y', $p_old_date_timestamp);
                @endphp
                <tr>
                    <td>{{$pizza->name}}</td>
                    <td>{{$pizza->code}}</td>
                    <td>{{$pizza->total_item}}</td>
                    <td>
                        <input type="hidden" name="pizza_id[]" value="{{$pizza->id}}">
                        <input type="number" name="quantity[]" class="form-control" value="0" style="width:50%"></td>
                    <td><button type="button" class="btn btn-default btn-sm pizza_view" data-id="{{$pizza->id}}" data-date="{{$p_date}}" data-name="{{$pizza->name}}" data-code="{{$pizza->code}}"><i class="fa fa-eye"></i> View</button></td>
                </tr>
                @endforeach
            </tbody>            
        </table>
    </div>
    <div class="container-fluid">
        <div class="card">
            <div class="row mb-3">
                <div class="col-md-6 offset-md-5 mt-3">
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" value="Submit" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    {!! Form::close() !!}
</section>

<div id="order-details" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
      <div class="modal-content">
        <div class="container mt-3 pb-2 border-bottom">
            <div class="row">
                <div class="col-md-6 d-print-none">
                    <button id="print-btn" type="button" class="btn btn-default btn-sm"><i class="dripicons-print"></i> {{trans('file.Print')}}</button>
                </div>
                <div class="col-md-6 d-print-none">
                    <button type="button" id="close-btn" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="col-md-12">
                    <h3 id="exampleModalLabel" class="modal-title text-center container-fluid">{{$general_setting->site_title}}</h3>
                </div>
                <div class="col-md-12 text-center">
                    <i style="font-size: 15px;">Pizza Details</i>
                </div>
            </div>
        </div>
            <div id="order-content" class="modal-body"></div>
            <br>
            <table class="table table-bordered product-order-list">
                <thead>
                    <th>#</th>
                    <th>Name</th>
                    <th>Qty</th>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div id="order-footer" class="modal-body"></div>
      </div>
    </div>
</div>




@endsection

@push('scripts')
<script type="text/javascript">

    
    $('.selectpicker').selectpicker('refresh');

    $("ul#order").siblings('a').attr('aria-expanded','true');
    $("ul#order").addClass("show");
    $("ul#order #order-list-menu").addClass("active");


    var order_id = [];
    var user_verified = <?php echo json_encode(env('USER_VERIFIED')) ?>;

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function confirmDelete() {
        if (confirm("Are you sure want to delete?")) {
            return true;
        }
        return false;
    }

   
    $(document).on("click", "tr.order-link td:not(:first-child, :last-child)", function(){
        var order = $(this).parent().data('order');
        orderDetails(order);
    });

    $(document).on("click", ".view", function(){
        var order = $(this).parent().parent().parent().parent().parent().data('order');
        orderDetails(order);
    });

    $("#print-btn").on("click", function(){
        var divContents = document.getElementById("order-details").innerHTML;
        var a = window.open('');
        a.document.write('<html>');
        a.document.write('<head><style>body{font-family: sans-serif;line-height: 1.15;-webkit-text-size-adjust: 100%;}.d-print-none{display:none}.text-center{text-align:center}.row{width:100%;margin-right: -15px;margin-left: -15px;}.col-md-12{width:100%;display:block;padding: 5px 15px;}.col-md-6{width: 50%;float:left;padding: 5px 15px;}table{width:100%;margin-top:30px;}th{text-aligh:left;}td{padding:10px}table, th, td{border: 1px solid black; border-collapse: collapse;}</style><style>@media print {.modal-dialog { max-width: 1000px;} }</style></head>');
        a.document.write('<body >');
        a.document.write(divContents);
        a.document.write('</body></html>');
        a.document.close();
        setTimeout(function(){a.close();},10);
        a.print();
    });

    $(document).on("click", "table.order-list tbody .add-payment", function(event) {
        $("#cheque").hide();
        $(".card-element").hide();
        $('select[name="paid_by_id"]').val(1);
        rowindex = $(this).closest('tr').index();
        var order_id = $(this).data('id').toString();
        var balance = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(8)').text();
        balance = parseFloat(balance.replace(/,/g, ''));
        $('input[name="amount"]').val(balance);
        $('input[name="balance"]').val(balance);
        $('input[name="paying_amount"]').val(balance);
        $('input[name="order_id"]').val(order_id);
    });



    $(document).on("click", ".pizza_view", function pizzaDetails(){
        
        var id = $(this).data('id');
        var pdate = $(this).data('date');
        var pname = $(this).data('name');
        var pcode = $(this).data('code');

        var htmltext = '<strong>{{trans("file.Date")}}: </strong>'+pdate+'<br><br><strong>Name: </strong>'+pname+'<br><strong>Code: </strong>'+pcode;
        
        $.get('product_order/' + id, function(data){
            $(".product-order-list tbody").remove();
            var product_id = data[0];
            var qty = data[1];
            var unit_name = data[2];
            // var unit_code = data[2];
            // var tax = data[3];
            // var tax_rate = data[4];
            // var discount = data[5];
            // var subtotal = data[6];
            // var batch_no = data[7];
            var newBody = $("<tbody>");
            $.each(product_id, function(index) {
                var newRow = $("<tr>");
                var cols = '';
                cols += '<td><strong>' + (index+1) + '</strong></td>';
                cols += '<td>' + product_id[index] + '</td>';
                cols += '<td>' + qty[index] + ' ' + unit_name[index] + '</td>';
                // cols += '<td>' + qty[index] + ' ' + unit_code[index] + '</td>';
                // cols += '<td>' + (subtotal[index] / qty[index]) + '</td>';
                // cols += '<td>' + tax[index] + '(' + tax_rate[index] + '%)' + '</td>';
                // cols += '<td>' + discount[index] + '</td>';
                // cols += '<td>' + subtotal[index] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);
            });

            
             $("table.product-order-list").append(newBody);
        });

        var htmlfooter = '<p></p>';

        $('#order-content').html(htmltext);
        $('#order-footer').html(htmlfooter);
        $('#order-details').modal('show');
    });



</script>
<script type="text/javascript" src="https://js.stripe.com/v3/"></script>
@endpush
