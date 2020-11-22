<div>   
    @include('livewire.setup-products.add-edit')
    @include('livewire.setup-products.confirm-delete')
    @include('livewire.setup-products.pictures')
    @include('livewire.setup-products.confirm-delete-picture')
    <style>
        svg{
            max-height: 20px;
        }
    </style>      
    <div class="card m-2">
        <div class="card-header">
            <h3>{{__('Product List')}}</h3> 
        </div>        
        <div class="card-body">
            @if (session()->has('alert_message'))
                <div class="alert alert-{{ session()->has('alert_type')?session('alert_type'):'success'}} alert-dismissible fade show d-print-none" role="alert">
                    {{ session('alert_message') }}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>                
            @endif
            <div class="card d-print-none">
                <div class="card-body">                    
                    @if ($permissions['action_1']==1)
                    <button class="btn btn-primary" wire:click="getItem(0,1)">{{__('New')}}</button>                        
                    @endif
                    @if ($permissions['action_4']==1)
                    <button class="btn btn-primary"  onclick="window.print();">{{__('Print')}}</button>                        
                    @endif
                    @if ($permissions['action_5']==1)
                    <button class="btn btn-primary"  wire:click="downloadCsv()">{{__('CSV')}}</button>                        
                    @endif
                </div>
            </div>
            <div style="overflow-x:auto ">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name
                            <input type="text" class="form-control d-print-none" wire:model="search.name" placeholder="Search Name">
                        </th>     
                        <th>Price</th>                                                            
                        <th>Picture Count</th>                                                            
                        <th>Type
                            <select class="form-control d-print-none" wire:model="search.status">>
                                <option value="">Search Status</option>
                                <option value="Active">Active</option>
                                <option value="In-Active">In-Active</option>
                              </select>
                        </th> 
                        <th>Actions</th>                       
                        
                    </tr>
                </thead>
                <tbody>
                    @foreach ($items as $itemList)
                    <tr>
                        <td>{{$itemList->id}}</td>
                        <td>{{$itemList->name}}</td>                        
                        <td>{{$itemList->price}}</td>                        
                        <td>{{$itemList->num_picture}}</td>                        
                        <td>{{$itemList->status}}</td>                       
                         
                        
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action</button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    @if (($permissions['action_2']==1))
                                        <button class="dropdown-item" wire:click="getItem({{$itemList->id}},2)">{{__('Edit')}}</button>                                        
                                    @endif
                                    <button class="dropdown-item" wire:click="setPictures({{$itemList->id}},0)">{{__('Picture')}}</button>
                                    @if (($permissions['action_3']==1))
                                    <button class="dropdown-item" wire:click="getItem({{$itemList->id}},3)">{{__('Delete')}}</button>                                        
                                    @endif
                                </div>
                              </div>
                        </td>                                                                            
                    </tr>
                        
                    @endforeach
                </tbody>
            </table>            
            {{$items->links()}}
            </div>
        </div>
    </div>
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
