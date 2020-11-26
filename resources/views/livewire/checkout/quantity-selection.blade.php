<div class="card m-2">
    <div class="card-header">
        Your Cart
    </div>
    <div class="card-body">
        @if(session()->has('cart') && count(session('cart'))>0)       
            <form method="post" action="{{url('checkout/payment')}}">
                @csrf
                <table class="table table-bordered" id="checkoutItems">
                    <thead>
                        <tr>
                            <th>Item Name</th>
                            <th>Unit Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach (session('cart') as $product)
                            <tr>
                                <td>{{$product['name']}}</td>
                                <td id="unitPrice_{{$product['id']}}">{{$product['price']}}</td>
                                <td><input type="number" data-id="{{$product['id']}}" class="form-control integer_positive quantity" value="1" name="quantity[{{$product['id']}}]"></td>
                                <td id="price_{{$product['id']}}"></td>
                                <td><button class="btn btn-danger" type="button" wire:click="removeCartItem({{$product['id']}})">{{__('Remove')}}</button> </td>                            
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr>
                            
                            <td colspan="3" class="text-right">Total</td>
                            <td id="total"></td>
                        </tr>
                    </tfoot>
                </table>
                <button class="btn btn-primary" type="submit">Go To Payment</button>
            </form>
        @else
        Your Cart Is empty. <a class="btn btn-primary" href="{{url('shop')}}">Go to Shop</a>
        @endif
        <script>            
            $(document).ready(function()
            {
                calculateTotal();
                
            });
        </script>

    </div>
</div>