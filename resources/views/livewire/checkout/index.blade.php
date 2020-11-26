<div> 
    @if ($checkoutState=='quantitSelection')
        @include('livewire.checkout.quantity-selection')
    @elseif($checkoutState=='payment')
        @include('livewire.checkout.payment')
    @elseif($checkoutState=='paymentSuccess')
        @include('livewire.checkout.payment-success')
    @elseif($checkoutState=='paymentFailed')
        @include('livewire.checkout.payment-failed')
    @endif
    @section('jsInline')
    <script>
        function calculateTotal()
        {
            var total=0;
            $("#checkoutItems tbody .quantity").each( function( index, element )
            {
                var id=$(this).attr('data-id');
                var unitPrice=parseFloat($("#unitPrice_"+id).html());
                var price=unitPrice*($(this).val());
                total+=price;
                $("#price_"+id).html(price);
            });
            $("#total").html(total);
            
        }
        $(document).ready(function()
        {
            $(document).on("input", ".quantity", function(event)
            {
                calculateTotal();
            });
        });
    </script>
    @endsection
    
</div>
