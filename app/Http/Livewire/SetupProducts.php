<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\HelperClasses\ModuleTaskHelper;
use App\Models\Product;
use Livewire\WithPagination;
class SetupProducts extends Component
{
    use WithPagination;
    public $permissions=array();

    public $item; 
    //public $items;  
    public $search;
    protected $paginationTheme = 'bootstrap';
    protected $rules = [
        'item.name' => 'required|min:3',
        'item.price' => 'required|numeric',
        'item.status' => 'required',
    ];
    protected $validationAttributes = [
        'item.name' => 'Name',
        'item.price' => 'Price',
        'item.status' => 'Status',
    ];

    public function mount()
    {
        $this->permissions=ModuleTaskHelper::get_permissions('setup_products');
        $this->setItem(array());
        $this->setSearch(array());
    }
    public  function setItem($item=array())
    {
        $this->item=array();
        $this->item['id']=isset($item['id'])?$item['id']:0;
        $this->item['name']=isset($item['name'])?$item['name']:'';        
        $this->item['price']=isset($item['price'])?$item['price']:'';        
        $this->item['status']=isset($item['status'])?$item['status']:'Active';
    }
    public function getItem($id)
    {
        if($id==0)
        {
            $this->setItem(array());
        }
        else
        {
            $this->setItem(Product::where('id', $id)->first());
        }
    }
    public function saveItem()
    {
        $permissions=ModuleTaskHelper::get_permissions('setup_products');
        $validatedData =$this->validate();
        if($this->item['id']>0)
        {
            if($permissions['action_2']!=1)
            {
                session()->flash('alert_message',"You do not have Edit Access");
                session()->flash('alert_type',"danger");
            }
            else
            {
                $item=Product::find($this->item['id']);
                $item->update($this->item);
                session()->flash('alert_message',"Product Updated");                
                session()->flash('alert_type',"primary");
            }
        }
        else
        {
            if($permissions['action_1']!=1)
            {
                session()->flash('alert_message',"You do not have Add Access");
                session()->flash('alert_type',"danger");
            }
            else
            {
                Product::create($this->item);
                session()->flash('alert_message',"Product Created");                
                session()->flash('alert_type',"primary");

            }            
        }
        $this->setItem(array());
        $this->emit("hideModal");
        
    }
    public  function setSearch($search=array())
    {
        $this->search=array();        
        $this->search['name']=isset($search['name'])?$search['name']:'';        
        $this->search['status']=isset($search['status'])?$search['status']:'Active';
    }
    public function render()
    {
        $items=Product::orderBy('id', 'DESC')
                ->where('name','LIKE','%'.$this->search['name'].'%')
                ->where('status','LIKE','%'.$this->search['status'].'%')
                ->where('status','!=','Deleted')
                ->paginate(2);
        if($this->permissions['action_0']==1)
        {
            return view('livewire.setup-products.list',['items'=>$items])->layout('theme.component');
        }
        else
        {
            return view('theme.access-denied')->layout('theme.component');
        }
    }
}
