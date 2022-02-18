@extends('layout.main')
@section('content')
<style>
	.order_detail{
		cursor: pointer;
	}
</style>
<section>
	<div class="container-fluid">
		<div class="card">
			<div class="card-body">
				{{ Form::open(['route' => ['report.dailySaleByWarehouse', $year, $month], 'method' => 'post', 'id' => 'report-form']) }}
				<input type="hidden" name="warehouse_id_hidden" value="{{$warehouse_id}}">
				<h4 class="text-center">{{trans('file.Daily Sale Report')}} &nbsp;&nbsp;
				<select class="selectpicker" id="warehouse_id" name="warehouse_id">
					<option value="0">{{trans('file.All Warehouse')}}</option>
					@foreach($lims_warehouse_list as $warehouse)
					<option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
					@endforeach
				</select>
				</h4>
				{{ Form::close() }}
				<div class="table-responsive mt-4">
					<table class="table table-bordered" style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6;">
						<thead>
							<tr>
								<th><a href="{{url('report/daily_sale/'.$prev_year.'/'.$prev_month)}}"><i class="fa fa-arrow-left"></i> {{trans('file.Previous')}}</a></th>
						    	<th colspan="5" class="text-center">{{date("F", strtotime($year.'-'.$month.'-01')).' ' .$year}}</th>
						    	<th><a href="{{url('report/daily_sale/'.$next_year.'/'.$next_month)}}">{{trans('file.Next')}} <i class="fa fa-arrow-right"></i></a></th>
						    </tr>
						</thead>
					    <tbody>
						    <tr>
							    <td><strong>Sunday</strong></td>
							    <td><strong>Monday</strong></td>
							    <td><strong>Tuesday</strong></td>
							    <td><strong>Wednesday</strong></td>
							    <td><strong>Thrusday</strong></td>
							    <td><strong>Friday</strong></td>
							    <td><strong>Saturday</strong></td>
						    </tr>
						    <?php
						    	$i = 1;
						    	$flag = 0;
						    	while ($i <= $number_of_day) {
						    		echo '<tr>';
						    		for($j=1 ; $j<=7 ; $j++){
						    			if($i > $number_of_day)
						    				break;

						    			if($flag){
						    				if($year.'-'.$month.'-'.$i == date('Y').'-'.date('m').'-'.(int)date('d'))
						    					echo '<td><p style="color:#7c5cc4"><strong>'.$i.'</strong></p>';
						    				else
						    					echo '<td><p><strong>'.$i.'</strong></p>';
												
						    				if($order_date[$i]){
												$orderdate = $year.'-'.$month.'-'.$i;

												if($warehouse_id != 0){
													$shop = DB::table('warehouses')->select('name')->where('id','=',$warehouse_id)->first();
													$shopname = $shop->name;
												}
												else {
													$shopname = 'All Shop';
												}
											?>
												<div class="order_detail" data-date="{{$orderdate}}" data-shopid="{{$warehouse_id}}" data-shopname="{{$shopname}}">
													
												<?php
						    						echo '<strong>Total Orders</strong><br><span>'.$order_date[$i].'</span><br><br>';
												?>
												</div>	
											<?php 
						    				}
						    				
						    				echo '</td>';
						    				$i++;
						    			}
						    			elseif($j == $start_day){
						    				if($year.'-'.$month.'-'.$i == date('Y').'-'.date('m').'-'.(int)date('d'))
						    					echo '<td><p style="color:#7c5cc4"><strong>'.$i.'</strong></p>';
						    				else
						    					echo '<td><p><strong>'.$i.'</strong></p>';

											if($order_date[$i]){
												$orderdate = $year.'-'.$month.'-'.$i;

												if($warehouse_id != 0){
													$shop = DB::table('warehouses')->select('name')->where('id','=',$warehouse_id)->first();
													$shopname = $shop->name;
												}
												else {
													$shopname = 'All Shop';
												}
											?>
												<div class="order_detail">
													<input type="hidden" id="order_date" value="{{$orderdate}}" />
													<input type="hidden" id="order_warehouse_id" value="{{$warehouse_id}}" />
												<?php
						    						echo '<strong>Total Orders</strong><br><span>'.$order_date[$i].'</span><br><br>';
												?>
												</div>	
											<?php 
						    				}	
						    				echo '</td>';
						    				$flag = 1;
						    				$i++;
						    				continue;
						    			}
						    			else {
						    				echo '<td></td>';
						    			}
						    		}
						    	    echo '</tr>';
						    	}
						    ?>
					    </tbody>
					</table>
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
                    <i style="font-size: 15px;">Order Details</i>
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

	$("ul#report").siblings('a').attr('aria-expanded','true');
    $("ul#report").addClass("show");
    $("ul#report #daily-sale-report-menu").addClass("active");

	$('#warehouse_id').val($('input[name="warehouse_id_hidden"]').val());
	$('.selectpicker').selectpicker('refresh');

	$('#warehouse_id').on("change", function(){
		$('#report-form').submit();
	});

	
	$(document).on("click",".order_detail",function(e){

		var orderdate = $(this).data('date');
		var warehouse_id = $(this).data('shopid');
		var warehouse_name = $(this).data('shopname');


		console.log(orderdate);

		var htmltext = '<strong>{{trans("file.Date")}}: </strong>'+orderdate+'<br><strong>Shop: </strong>'+ warehouse_name;
		var baseurl = '<?php echo url("report/daily_sale_order/") ?>';
		$.get(baseurl + '/' + orderdate + '/' + warehouse_id , function(data){
			
			$(".product-order-list tbody").remove();

			var name = data[0];
			var qty = data[1];
			var newBody = $("<tbody>");

			$.each(name, function(index) {
				var newRow = $("<tr>");
				var cols = '';
				cols += '<td><strong>' + (index+1) + '</strong></td>';
				cols += '<td>' + name[index] + '</td>';
				cols += '<td>' + qty[index] + '</td>';
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
