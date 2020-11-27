<header id="system_top_bar" class="d-print-none">
    <style>
        .noti-icon-badge {
            display: inline-block;
            position: absolute;
            top: 16px;            
            background-color: #f06292;
            
            }
    </style>
    <!-- LOGO -->
    <div id="logo_container" class="d-none d-lg-block d-xl-block float-left">
        <img style="height: 25px;" src="{{ asset('theme/images/banner.jpg') }}" alt="">
    </div>
    <!-- Left Sidebar handler -->
    <button id="handler_left_sidebar" class="handler-sidebar float-left">
        <i class="fe-menu"></i>
    </button>
    <!-- Right Sidebar handler -->
    <button id="handler_right_sidebar" class="handler-sidebar float-right">
        <i class="fe-bell"></i>
    </button>    
     
    <!-- Users options -->
    <ul class="list-unstyled float-right mb-0">
        <li class="dropdown">
            <a class="nav-link  mr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                <i class="fe-shopping-cart"></i>
                @if (count($cartProducts)>0)
                    <span class="badge badge-pink rounded-circle noti-icon-badge">{{count($cartProducts)}}</span>   
                             
                @endif
            </a>
            <div class="dropdown-menu dropdown-menu-right p-0">  
                <div class="card">
                    <div class="card-header">
                        Your Cart
                    </div>
                    <div class="card-body">
                        @if (count($cartProducts)>0)
                        <table class="table table-bordered">
                            <thead>
                                <th>Item Name</th>
                                <th>Unit Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Action</th>
                            </thead>
                            <tbody>
                                @php
                                    $total=0;
                                @endphp
                                @foreach ($cartProducts as $product)
                                @php
                                    $total+=($product['quantity']*$product['price']);
                                @endphp
                                    <tr>
                                        <td>{{$product['name']}}</td>
                                        <td>{{$product['price']}}</td>
                                        <td>{{$product['quantity']}}</td>
                                        <td>{{$product['quantity']*$product['price']}}</td>
                                        <td><button class="btn btn-danger" wire:click="removeCartItem({{$product['id']}})">{{__('Remove')}}</button> </td>
                                        
                                    </tr>
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="3" class="text-right">Total</td>
                                    <td>{{$total}}</td>
                                </tr>
                            </tfoot>
                        </table> 
                        <a class="btn btn-primary" href="{{ url('/checkout')}}">{{__('Checkout')}}</a>                   
                        @else       
                            Your Cart is Empty
                        @endif 
                    </div>
                  </div>
                             
            </div>
        </li>

        <li class="dropdown">
            <a class="nav-link dropdown-toggle mr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">{{__('Language')}}</a>
            <div class="dropdown-menu dropdown-menu-right">
                <span class="dropdown-item notify-item" style="cursor: pointer" onclick="setCookie('language','en',365); window.location.reload();">English</span>
                <span class="dropdown-item notify-item" style="cursor: pointer" onclick="setCookie('language','bn',365); window.location.reload();">বাংলা</span>
            </div>
        </li>
        <li class="dropdown">
            <a class="nav-link dropdown-toggle mr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                @auth
                    @if (Laravel\Jetstream\Jetstream::managesProfilePhotos())
                    <img src="{{ Auth::user()->profile_photo_url }}"  alt="{{ Auth::user()['name_'.config('app.locale')] }}" class="rounded-circle" style="height: 32px;width: 32px;"/>
                    @else
                            
                    @endif
                    <span class="pro-user-name ml-1 d-none d-sm-inline">{{ Auth::user()['name_'.config('app.locale')] }}</span>
                    
                @else
                <img src="{{ asset('theme/images/avatar-1.jpg') }}"  alt="user-image" class="rounded-circle" style="height: 32px;width: 32px;"/>
                <span class="pro-user-name ml-1 d-none d-sm-inline">{{ __('Guest') }}</span>
                @endauth    
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                @auth
                <!-- Authentication -->
                <a href="{{ url('/user/profile') }}" class="dropdown-item notify-item">
                    <span>Profile Settings</span>
                </a>
                <div class="dropdown-item notify-item">
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf

                        <x-jet-dropdown-link href="{{ route('logout') }}"
                                            onclick="event.preventDefault();
                                                        this.closest('form').submit();">
                            {{ __('Logout') }}
                        </x-jet-dropdown-link>
                    </form>
                </div>
                @else
                <a href="{{ route('login') }}" class="dropdown-item notify-item">
                    <span> {{ __('Login') }}</span>
                </a>
                <a href="{{ route('register') }}" class="dropdown-item notify-item">
                    <span> {{ __('Registraion') }}</span>
                </a>
                @endauth 

            </div>
        </li>
    </ul>
</header>