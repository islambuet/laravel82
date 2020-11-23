<div> 
    <style>
        .carousel-control-next,
        .carousel-control-prev /*, .carousel-indicators */ {
            filter: invert(100%);
        }
    </style>
    <div class="row m-0 mt-2"> 
        @foreach ($products as $product)
        <div class="col-6 col-sm-4 pb-2">
            @if(isset($pictures[$product->id]))
                @if(count($pictures[$product->id])>1)                            
                    <div id="carousel_{{$product->id}}" class="carousel slide" data-ride="carousel" style="height: 300px!important;">
                        <div class="carousel-inner">
                            @foreach($pictures[$product->id] as $key=>$picture)
                            <div class="carousel-item {{$key==0?'active':''}}">
                                <img class="d-block" style="max-height: 100%; max-width:100%" src="{{ asset('storage/'.$picture['picture']) }}" alt="Product Picture">
                            </div>                                
                            @endforeach
                        </div>
                        <a class="carousel-control-prev" href="#carousel_{{$product->id}}" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carousel_{{$product->id}}" role="button" data-slide="next" >
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                @else
                <div style="height:300px">
                    <img class="d-block" style="max-height: 100%; max-width:100%" src="{{ asset('storage/'.$pictures[$product->id][0]['picture']) }}" alt="comming">
                </div>                
                @endif
            @else 
            <div style="height:300px">
                <img class="d-block" style="max-height: 100%; max-width:100%" src="{{ asset('storage/products/comming.png') }}" alt="comming">
            </div>                
                
            @endif
            
            
            <div>{{$product->name}}</div>
            <div>Price :{{$product->price}}</div>
            <div><input class="btn btn-primary" type="button" wire:click="addToCart({{$product->id}})" value="Add to Cart"></div>

            
        </div>
            
        @endforeach  
    </div>
    {{$products->links('theme.pagination-dropdown')}}
   
       
        
       
       
   
    @section('jsInline')
    <script>
        Livewire.on('hideModalAddEdit', function(){            
            $("#modalAddEdit").modal('hide');                        
        });
        Livewire.on('showModalAddEdit', function(){            
            $("#modalAddEdit").modal('show');                        
        });
        Livewire.on('hideModalDeleteConfirm', function(){            
            $("#modalConfirmDelete").modal('hide');                        
        });
        Livewire.on('showModalDeleteConfirm', function(){            
            $("#modalConfirmDelete").modal('show');                        
        });
        Livewire.on('showModalPictures', function(){            
            $("#modalPictures").modal('show');                        
        });
        Livewire.on('hideModalDeleteConfirmPicture', function(){            
            $("#modalConfirmDeletePicture").modal('hide');                        
        });
        Livewire.on('showModalDeleteConfirmPicture', function(){
            $("#modalConfirmDeletePicture").modal('show');                        
        });
        Livewire.on('resetFile', function(){            
            $("#formAddPicture")[0].reset();                        
        });
        </script>
@endsection

    
    
    
</div>
