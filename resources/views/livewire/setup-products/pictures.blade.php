<div wire:ignore.self class="modal fade" id="modalPictures" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Picture list</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">            
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
                        <td>{{$itemList['picture']}}</td>
                        @if (($permissions['action_3']==1))
                        <td>
                            <button class="btn btn-primary" data-toggle="modal" data-target="#modalDeletePicture">{{__('Delete')}}</button> 
                        </td>                                                    
                        @endif                       
                    </tr>
                        
                    @endforeach
                </tbody>
            </table>  
        </div>   
        <div class="modal-footer">            
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>       
      </div>
    </div>
  </div>