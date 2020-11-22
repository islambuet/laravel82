<div>   
    @include('livewire.setup-products.add-edit');
    @include('livewire.setup-products.delete');
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
                    <button class="btn btn-primary" data-toggle="modal" data-target="#modalAddEdit" wire:click="getItem(0)">{{__('New')}}</button>                        
                    @endif
                    @if ($permissions['action_4']==1)
                    <button class="btn btn-primary"  onclick="window.print();">{{__('Print')}}</button>                        
                    @endif
                    @if ($permissions['action_5']==1)
                    <button class="btn btn-primary"  wire:click="downloadCsv()">{{__('CSV')}}</button>                        
                    @endif
                </div>
            </div>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name
                            <input type="text" class="form-control d-print-none" wire:model="search.name" placeholder="Search Name">
                        </th>     
                        <th>Price</th>                                                            
                        <th>Type
                            <select class="form-control d-print-none" wire:model="search.status">>
                                <option value="">Search Status</option>
                                <option value="Active">Active</option>
                                <option value="In-Active">In-Active</option>
                              </select>
                        </th> 
                        @if (($permissions['action_2']==1)||($permissions['action_3']==1))
                        <th>Actions</th>                                                    
                        @endif                       
                        
                    </tr>
                </thead>
                <tbody>
                    @foreach ($items as $itemList)
                    <tr>
                        <td>{{$itemList->id}}</td>
                        <td>{{$itemList->name}}</td>                        
                        <td>{{$itemList->price}}</td>                        
                        <td>{{$itemList->status}}</td>                        
                         
                        @if (($permissions['action_2']==1)||($permissions['action_3']==1))
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action</button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    @if (($permissions['action_2']==1))
                                        <button class="dropdown-item" data-toggle="modal" data-target="#modalAddEdit" wire:click="getItem({{$itemList->id}})">{{__('Edit')}}</button>
                                        <button class="dropdown-item" data-toggle="modal" data-target="#modalPictures" wire:click="getItem({{$itemList->id}})">{{__('Picture')}}</button>
                                    @endif
                                    @if (($permissions['action_3']==1))
                                    <button class="dropdown-item" data-toggle="modal" data-target="#modalDelete" wire:click="getItem({{$itemList->id}})">{{__('Delete')}}</button>                                        
                                    @endif
                                </div>
                              </div>
                        </td>                                                    
                        @endif                       
                    </tr>
                        
                    @endforeach
                </tbody>
            </table>            
            {{$items->links()}}
        </div>
    </div>
    @section('jsInline')
    <script>
        Livewire.on('hideModal', function(){            
            $("#modalAddEdit").modal('hide');            
            $("#modalDelete").modal('hide');            
        })
        </script>
@endsection

    
    
    
</div>
