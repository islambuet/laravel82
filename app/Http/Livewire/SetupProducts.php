<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\HelperClasses\ModuleTaskHelper;
use App\Models\Product;
use App\Models\ProductPicture;
use Livewire\WithPagination;
use Illuminate\Support\Facades\DB;
class SetupProducts extends Component
{
    use WithPagination;
    public $permissions=array();
    
    public $item; 
    public $pictures=array();
    public $picture_id=0;
    
    public $csvString="";  
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
    //only for real time validation 
    public function updated($propertyName)
    {
        $this->validateOnly($propertyName);
    }

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
    public function getItem($id,$action)
    {
        if($id==0)
        {
            $this->setItem(array());
        }
        else
        {
            $this->setItem(Product::where('id', $id)->first());
        }
        if($action==1 || $action==2)
        {
            $this->emit("showModalAddEdit");
        }
        else if($action==3)
        {
            $this->emit("showModalDeleteConfirm");
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
        $this->emit("hideModalAddEdit");
        
    }
    public function deleteItem()
    {
        $permissions=ModuleTaskHelper::get_permissions('setup_products');
        if($permissions['action_3']!=1)
        {
            session()->flash('alert_message',"You do not have Delete Access");
            session()->flash('alert_type',"danger");
        }
        else
        {
            $item=Product::find($this->item['id']);
            $item->update(array('status'=>'Deleted'));
            session()->flash('alert_message',"Product Deleted");                
            session()->flash('alert_type',"danger");
        }
        $this->setItem(array());
        $this->emit("hideModalDeleteConfirm");
    }
    public function setSearch($search=array())
    {
        $this->search=array();        
        $this->search['name']=isset($search['name'])?$search['name']:'';        
        $this->search['status']=isset($search['status'])?$search['status']:'Active';
    }
    public function downloadCsv()
    {
        $this->emit("downloadCsv",$this->csvString,'product.csv');
    }
    public function setPictures($id)
    {
        $this->getItem($id,0);        
        $this->pictures = ProductPicture::where('product_id', $id)  
                ->where('status','=','Active')             
               ->get()->toArray();  
        $this->emit("showModalPictures");                            
    }
    public function setPictureItem($id,$action)
    {
        $this->picture_id=$id;
        if($action==3)
        {
            $this->emit("showModalDeleteConfirmPicture");            
        }
    }
    public function deletePicture()
    {
        $permissions=ModuleTaskHelper::get_permissions('setup_products');
        if($permissions['action_3']!=1)
        {
            session()->flash('alert_message_picture',"You do not have Delete Access");
            session()->flash('alert_type',"danger");
        }
        else
        {
            
            $picture=ProductPicture::find($this->picture_id);
            $product_id=$picture->product_id;
            $picture->update(array('status'=>'Deleted'));
            session()->flash('alert_message_picture',"Picture Deleted");                
            session()->flash('alert_type',"danger");
            $this->pictures = ProductPicture::where('product_id', $product_id)  
                ->where('status','=','Active')             
               ->get()->toArray(); 
            
        }
        $this->setPictureItem(0,0);
        $this->emit("hideModalDeleteConfirmPicture");
    }
    public function render()
    {
        DB::enableQueryLog();
        $items=DB::table('products as p')
            // ->leftJoin('product_pictures as pp', 'pp.product_id', '=', 'p.id')
            ->leftJoin('product_pictures as pp', function($join)
            {
                $join->on('p.id', '=', 'pp.product_id');
                $join->on('pp.status', '!=', DB::raw('"Deleted"'));
            })
            ->select('p.*')
            ->addSelect(DB::raw('count(pp.id) num_picture'))
            ->groupBy('p.id')
            ->orderBy('p.id', 'desc')
            ->where('p.status','!=','Deleted') 
            ->where('p.name','LIKE','%'.$this->search['name'].'%')
            ->where('p.status','LIKE','%'.$this->search['status'].'%')           
            ->paginate(5);
        $this->csvString=array();
        $this->csvString[]=array("Name",'Price',"Picture Count","status");        
        foreach($items as $csvItem)
        {
            $this->csvString[]=array($csvItem->name,$csvItem->price,$csvItem->num_picture,$csvItem->status);            
        }
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
