<div wire:ignore.self class="modal fade" id="modalPictures" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title">Picture list of {{$item['name']}}</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">   
          @if (session()->has('alert_message_picture'))
                <div class="alert alert-{{ session()->has('alert_type')?session('alert_type'):'success'}} alert-dismissible fade show d-print-none" role="alert">
                    {{ session('alert_message_picture') }}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>                
            @endif         
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>picture</th>
                        @if (($permissions['action_3']==1))
                        <th>Actions</th>                                                    
                        @endif                       
                        
                    </tr>
                </thead>
                <tbody>
                    @foreach ($pictures as $itemList)
                    <tr>
                        <td>{{$itemList['id']}}</td>
                        <td><img src="{{ asset('storage/'.$itemList['picture']) }}" style="width:200px;" alt="{{$item['name']}} class="img-thumbnail"></td>
                        @if (($permissions['action_3']==1))
                        <td>
                          <button class="btn btn-danger" wire:click="setPictureItem({{$itemList['id']}},3)">{{__('Delete')}}</button>                          
                        </td>                                                    
                        @endif                       
                    </tr>
                        
                    @endforeach
                </tbody>
            </table>  
            @if (($permissions['action_1']==1))
            
            <form id="formAddPicture" enctype="multipart/form-data" wire:submit.prevent="savePicture">
              
              <div class="row">
                <div class="form-group col-8">                  
                  <input type="file" class="form-control" name="picture" wire:model="picture">
                  @error('picture') <span class="text-danger">{{ $message }}</span> @enderror
                </div> 
                <div class="col-4">
                  <button type="submit" class="btn btn-primary">Add Picture</button>
                </div>
              </div>
              @if ($picture)
              <div class="row">
                <div class="col-12">
                  <img src="{{ $picture->temporaryUrl() }}" style="width:200px;">
                </div>
              </div>
              @endif
            </form>
          
            @endif
            
        </div>   
        
        <div class="modal-footer">            
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>       
      </div>
    </div>
  </div>