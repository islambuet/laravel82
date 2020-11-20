@extends('theme.controller')
@section('content')
<div class="row justify-content-center">
    <div class="col-sm-6">
        <div class="text-center pt-2">
            <h1 class="text-error mt-4">404</h1>
            <h3 class="text-uppercase text-danger mt-3">Page Not Found</h3>
            <p class="text-muted mt-3">Sorry, we can’t find the page you were looking for.</p>

            <a class="btn btn-md btn-primary waves-effect waves-light mt-2" href="{{ url('/')}}"> Go To Home</a>
        </div>

    </div><!-- end col -->
</div>
@endsection
