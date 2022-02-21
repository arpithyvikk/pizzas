@extends('layout.main')
@section('content')
<!-- this portion is for demo only -->
<!-- <style type="text/css">

  nav.navbar a.menu-btn {
    padding: 12 !important;
  }
  .color-switcher {
      background-color: #fff;
      border: 1px solid #e5e5e5;
      border-radius: 2px;
      padding: 10px;
      position: fixed;
      top: 150px;
      transition: all 0.4s ease 0s;
      width: 150px;
      z-index: 99999;
  }
  .hide-color-switcher {
      right: -150px;
  }
  .show-color-switcher {
      right: -1px;
  }
  .color-switcher a.switcher-button {
      background: #fff;
      border-top: #e5e5e5;
      border-right: #e5e5e5;
      border-bottom: #e5e5e5;
      border-left: #e5e5e5;
      border-style: solid solid solid solid;
      border-width: 1px 1px 1px 1px;
      border-radius: 2px;
      color: #161616;
      cursor: pointer;
      font-size: 22px;
      width: 45px;
      height: 45px;
      line-height: 43px;
      position: absolute;
      top: 24px;
      left: -44px;
      text-align: center;
  }
  .color-switcher a.switcher-button i {
    line-height: 40px
  }
  .color-switcher .color-switcher-title {
      color: #666;
      padding: 0px 0 8px;
  }
  .color-switcher .color-switcher-title:after {
      content: "";
      display: block;
      height: 1px;
      margin: 14px 0 0;
      position: relative;
      width: 20px;
  }
  .color-switcher .color-list a.color {
      cursor: pointer;
      display: inline-block;
      height: 30px;
      margin: 10px 0 0 1px;
      width: 28px;
  }
  .purple-theme {
      background-color: #7c5cc4;
  }
  .green-theme {
      background-color: #1abc9c;
  }
  .blue-theme {
      background-color: #3498db;
  }
  .dark-theme {
      background-color: #34495e;
  }
</style>
<div class="color-switcher hide-color-switcher">
    <a class="switcher-button"><i class="fa fa-cog fa-spin"></i></a>
    <h5>{{trans('file.Theme')}}</h5>
    <div class="color-list">
        <a class="color purple-theme" title="purple" data-color="default.css"></a>
        <a class="color green-theme" title="green" data-color="green.css"></a>
        <a class="color blue-theme" title="blue" data-color="blue.css"></a>
        <a class="color dark-theme" title="dark" data-color="dark.css"></a>
    </div>
</div> -->
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
      <div class="row">
        <div class="container-fluid">
          <div class="col-md-12">
            <div class="brand-text float-left mt-4">
                <h3>{{trans('file.welcome')}} <span>{{Auth::user()->name}}</span> </h3>
            </div>
            {{-- <div class="filter-toggle btn-group">
              <button class="btn btn-secondary date-btn" data-start_date="{{date('Y-m-d')}}" data-end_date="{{date('Y-m-d')}}">{{trans('file.Today')}}</button>
              <button class="btn btn-secondary date-btn" data-start_date="{{date('Y-m-d', strtotime(' -7 day'))}}" data-end_date="{{date('Y-m-d')}}">{{trans('file.Last 7 Days')}}</button>
              <button class="btn btn-secondary date-btn active" data-start_date="{{date('Y').'-'.date('m').'-'.'01'}}" data-end_date="{{date('Y-m-d')}}">{{trans('file.This Month')}}</button>
              <button class="btn btn-secondary date-btn" data-start_date="{{date('Y').'-01'.'-01'}}" data-end_date="{{date('Y').'-12'.'-31'}}">{{trans('file.This Year')}}</button>
            </div> --}}
          </div>
        </div>
      </div>
      <!-- Counts Section -->
      <section class="dashboard-counts">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12 form-group">
              <div class="row">
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title text-center">
                    <div class="icon"><i class="dripicons-store" style="color: #733686"></i></div>
                    <div class="name"><strong style="color: #733686">Branch</strong></div>
                    <div class="count-number">
                      {{$count_branch }}
                    </div>
                  </div>
                </div>
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title text-center">
                    <div class="icon"><i class="dripicons-cart" style="color: #ff8952"></i></div>
                    <div class="name"><strong style="color: #ff8952">Category</strong></div>
                    <div class="count-number">
                      {{$count_category}}
                    </div>
                  </div>
                </div>
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title text-center">
                    <div class="icon"><i class="dripicons-basket" style="color: #297ff9"></i></div>
                    <div class="name"><strong style="color: #297ff9">Product</strong></div>
                    <div class="count-number">
                      {{$count_product}}
                    </div>
                  </div>
                </div>
                <!-- Count item widget-->
                <div class="col-sm-3">
                  <div class="wrapper count-title text-center">
                    <div class="icon"><i class=" dripicons-graph-pie" style="color: #00c689"></i></div>
                    <div class="name"><strong style="color: #00c689">Menu Item</strong></div>
                    <div class="count-number profit-data">
                      {{$count_pizza}}
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            
          </div>
        </div>

        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                  <h4>{{'Top Selling '.date('Y') . ' (Pizza/Item)'}}</h4>
                  <div class="right-column">
                    <div class="badge badge-primary">{{trans('file.top')}} 5</div>
                  </div>
                </div>
                <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>SL No</th>
                          <th>Name</th>
                          <th>No. of Ingredients</th>
                          <th>Quantity</th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach($top_selling as $key => $pizza)
                        @if($key < 5)
                        <tr>
                          <td>{{$key + 1}}</td>
                          <td>{{$top_selling[$key]['name']}}</td>
                          <td>{{$top_selling[$key]['item']}}</td>
                          <td>{{$top_selling[$key]['qty']}}</td>
                          <td><button type="button" class="btn btn-default btn-sm pizza_view" id="order_detail" data-pizza_id="{{$top_selling[$key]['pizza_id']}}" data-pizza_name="{{$top_selling[$key]['name']}}"><i class="fa fa-eye"></i> View</button></td>
                        </tr>
                        @endif
                        @endforeach
                      </tbody>
                    </table>
                  </div>
              </div>
            </div>
          </div>
        </div>
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

    

    // Show and hide color-switcher
    $(".color-switcher .switcher-button").on('click', function() {
        $(".color-switcher").toggleClass("show-color-switcher", "hide-color-switcher", 300);
    });

    // Color Skins
    $('a.color').on('click', function() {
        /*var title = $(this).attr('title');
        $('#style-colors').attr('href', 'css/skin-' + title + '.css');
        return false;*/
        $.get('setting/general_setting/change-theme/' + $(this).data('color'), function(data) {
        });
        var style_link= $('#custom-style').attr('href').replace(/([^-]*)$/, $(this).data('color') );
        $('#custom-style').attr('href', style_link);
    });

    $(".date-btn").on("click", function() {
        $(".date-btn").removeClass("active");
        $(this).addClass("active");
        var start_date = $(this).data('start_date');
        var end_date = $(this).data('end_date');
        $.get('dashboard-filter/' + start_date + '/' + end_date, function(data) {
            dashboardFilter(data);
        });
    });

    function dashboardFilter(data){
        $('.revenue-data').hide();
        $('.revenue-data').html(parseFloat(data[0]).toFixed(2));
        $('.revenue-data').show(500);

        $('.return-data').hide();
        $('.return-data').html(parseFloat(data[1]).toFixed(2));
        $('.return-data').show(500);

        $('.profit-data').hide();
        $('.profit-data').html(parseFloat(data[2]).toFixed(2));
        $('.profit-data').show(500);

        $('.purchase_return-data').hide();
        $('.purchase_return-data').html(parseFloat(data[3]).toFixed(2));
        $('.purchase_return-data').show(500);
    }

    $(document).on("click","#order_detail",function(e){

var pizza_id = $(this).data('pizza_id');
var pizza_name = $(this).data('pizza_name');

var htmltext = '<strong>'+pizza_name+' </strong>';
var baseurl = '<?php echo url("home/pizza_data/") ?>';
$.get(baseurl+'/'+pizza_id, function(data){
  
  $(".product-order-list tbody").remove();

  var name = data[0];
  var qty = data[1];
  var unit_name = data[2];
  var newBody = $("<tbody>");

  $.each(name, function(index) {
    var newRow = $("<tr>");
    var cols = '';
    cols += '<td><strong>' + (index+1) + '</strong></td>';
    cols += '<td>' + name[index] + '</td>';
    cols += '<td>' + qty[index] + ' ' + unit_name[index] + '</td>';
    newRow.append(cols);
    newBody.append(newRow);
  });

  $("table.product-order-list").append(newBody);
});

var htmlfooter = '';

$('#order-content').html(htmltext);
$('#order-footer').html(htmlfooter);
$('#order-details').modal('show');
});

</script>
@endpush
