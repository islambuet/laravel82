<div wire:ignore.self class="modal fade" id="modalConfirmDeletePicture" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Confrim delete</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">            
          Are you sure to delete this picture            
        </div>  
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" wire:click="deletePicture()">Yes</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
        </div>        
      </div>
    </div>
  </div>