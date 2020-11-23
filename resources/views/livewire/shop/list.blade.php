<div> 
    <div class="row m-0"> 
        @foreach ($products as $product)
        <div class="col-4 col-sm-3">
            {{$product->name}}
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
