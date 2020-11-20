<div class="card m-2">
    @guest
    <div class="card-body">
        <a href="{{ route('login') }}" class="btn btn-primary">
            <span> {{ __('Login') }}</span>
        </a>
        <a href="{{ route('register') }}" class="btn btn-primary">
            <span> {{ __('Registraion') }}</span>
        </a>
    </div>
    @endguest
    
</div>

