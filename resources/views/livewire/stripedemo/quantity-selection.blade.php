<div class="card m-2">
    <div class="card-header">
        Your Cart
    </div>
    <div class="card-body">
            <form method="post" action="{{url('stripedemo/payment-charge')}}">
                @csrf
                This is Stripe test. Please Look Chekcout Task for full process. <br>
                Here only 50$ will be used for test.
                <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                data-key="{{env('STRIPE_PUBLISHABLE_KEY',false)}}"
                data-description="Purchase Product"
                data-amount="5000"
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
            
    </div>
</div>