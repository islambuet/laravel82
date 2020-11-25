<div class="card m-2">
    <div class="card-header">
        Your Cart
    </div>
    <div class="card-body">
            
            <form wire:submit.prevent="goState3(Object.fromEntries(new FormData($event.target)))">
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
                </table>
            </form>            
            <button class="btn btn-primary" wire:click="goState1" type="button">Go Back</button>

    </div>
</div>