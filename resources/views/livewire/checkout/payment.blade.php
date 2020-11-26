<div class="card m-2">
    <div class="card-header">
        Your Cart
    </div>
    <div class="card-body">
            <form method="post" action="{{url('checkout/payment-charge')}}">
                @csrf
                <table class="table table-bordered" id="checkoutItems">
                    <thead>
                        <tr>
                            <th>Item Name</th>
                            <th>Unit Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($products as $product)
                            <tr>
                                <td>{{$product['name']}}</td>
                                <td>{{$product['price']}}</td>
                                <td>{{$product['quantity']}}</td>
                                <td>{{$product['price']*$product['quantity']}}</td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3" class="text-right">Total</td>
                        <td id="total">{{$stripePaymentAmount/100}}</td>
                        </tr>
                    </tfoot>
                </table>
                <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                data-key="{{env('STRIPE_PUBLISHABLE_KEY',false)}}"
                data-description="Purchase Product"
                data-amount="{{$stripePaymentAmount}}"
                data-locale="auto"></script>
            </form> 
            <div>
                
                Example card: 4242424242424242
                <br>
                Date: Any future date
                <br>
                CVC: Any 3 digits
                <br>
                For More testing go here <a href="https://stripe.com/docs/testing">https://stripe.com/docs/testing</a>                
            </div>
            

            
            <a class="btn btn-primary" href="{{url('checkout')}}">Go Back</a>
    </div>
</div>