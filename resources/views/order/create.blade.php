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
                        <h4>Add Orders</h4>
                    </div>
                    <div class="card-body">
                        <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                        {!! Form::open(['route' => 'orders.store', 'method' => 'post', 'files' => true, 'id' => 'pizza-form']) !!}
                       <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3 offset-md-4">
                                        <div class="form-group row">
                                            <input type="date" name="date" class="form-control" >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Order Items</label>
                                            @foreach ($lims_pizza_list as $pizza)
                                                <input type="text" value="{{$pizza->name}}" name="name" class="form-control" disabled>
                                                <br>
                                            @endforeach
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Pizza Size</label>
                                            @foreach ($lims_pizza_list as $pizza)

                                            @if($pizza->size == 's')
                                                $pizza->size = 'Small'
                                            @elseif($pizza->size == 'm')

                                            @elseif($pizza->size == 'l')

                                            @else

                                            @endif
                                                <input type="text" value="{{$pizza->size}}" name="size" class="form-control" disabled>
                                                <br>
                                            @endforeach
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Price</label>
                                            <input type="text" name="name" class="form-control" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Quantity</label>
                                            <input type="number" name="name" class="form-control" >
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary" id="submit-btn">{{trans('file.submit')}}</button>
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

</script>
<script type="text/javascript" src="https://js.stripe.com/v3/"></script>
@endpush
