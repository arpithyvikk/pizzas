@extends('layout.main') @section('content')
@if(session()->has('message'))
    <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4>Import Orders</h4>
                    </div>
                    <div class="card-body">
                        <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                        {!! Form::open(['route' => 'order.import', 'method' => 'post', 'files' => true, 'id' => 'order-form']) !!}
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            @php
                                                date_default_timezone_set('Australia/Melbourne');
                                                $date = date('m/d/Y h:i:s a', time());
                                                $old_date_timestamp = strtotime($date);
                                                $new_date = date('Y-m-d', $old_date_timestamp);   
                                            @endphp
                                            <label><strong> Date</strong> </label>
                                            <input type="date" class="form-control" name="order_date" value="{{$new_date}}" required />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>{{trans('file.Warehouse')}} *</label>
                                            <select required name="warehouse_id" class="selectpicker form-control" data-live-search="true" data-live-search-style="begins" title="Select shop...">
                                                @foreach($lims_warehouse_list as $warehouse)
                                                <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>{{trans('file.Upload CSV File')}} *</label>
                                            <input type="file" name="file" class="form-control" required />
                                            <p>{{trans('file.The correct column order is')}} () {{trans('file.and you must follow this')}}. {{trans('file.All columns are required')}}</p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label></label><br>
                                            <a href="../sample_file/sample_order.csv" class="btn btn-primary btn-block btn-lg"><i class="dripicons-download"></i> {{trans('file.Download Sample File')}}</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary" id="submit-button">
                                </div>
                            </div>
                        </div>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection
@push('scripts')
<script type="text/javascript">

    $("ul#order").siblings('a').attr('aria-expanded','true');
    $("ul#order").addClass("show");
    $("ul#order #order-import-menu").addClass("active");

    $('.selectpicker').selectpicker({
        style: 'btn-link',
    });

    $('[data-toggle="tooltip"]').tooltip();

</script>
@endpush
