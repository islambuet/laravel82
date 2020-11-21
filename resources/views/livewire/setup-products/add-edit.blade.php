<div wire:ignore.self class="modal fade" id="modalAddEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Add/Edit Product</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">            
            <form wire:submit.prevent="saveItem()">
              <input type="hidden" wire:model="item.id">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" wire:model="item.name">
                    @error('item.name') <span class="text-danger">{{ $message }}</span> @enderror                    
                </div>

                <div class="form-group">
                  <label for="price">Price</label>
                  <input type="text" class="form-control" wire:model="item.price">
                  @error('item.price') <span class="text-danger">{{ $message }}</span> @enderror
              </div>
              <div class="form-group">
                <label for="type">Status</label>
                <select id="status" class="form-control" wire:model="item.status">>                    
                  <option value="Active">Active</option>
                  <option value="In-Active">In-Active</option>
                </select>
                @error('item.status') <span class="text-danger">{{ $message }}</span> @enderror
              </div>
              <button type="submit" class="btn btn-primary">Save</button>
            </form>         
        </div>        
      </div>
    </div>
  </div>