<div class="card m-2">  
<div class="card-header">Payment {{($checkoutState=='paymentSuccess')?'Success':'Failed'}}</div>  
    <div class="card-body">
        {{$paymentResultMessage}}
    </div>
</div>