<div wire:ignore.self class="modal fade" id="modalAddEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">{{$item['id']>0?'Edit Product id('.$item['id'].')':'Add Product'}}</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">                        
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
        </div>   
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" wire:click="saveItem()">Save changes</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        </div>     
      </div>
    </div>
  </div>