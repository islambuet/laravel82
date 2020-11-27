<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\HelperClasses\ModuleTaskHelper;
use App\Models\Product;
use App\Models\ProductPicture;
use Livewire\WithPagination;

class ShopComponent extends Component
{
    use WithPagination;
    public $permissions=array();
    public function mount()
    {
        $this->permissions=ModuleTaskHelper::get_permissions('shop');
    }
    public function addToCart($id,$quantity)
    {
        if($quantity<1)
        {
            $quantity=0;
        }
        $cart=array();
        if(session()->has('cart'))
        {
            $cart=session('cart');   
        }
        $product=Product::where('id', $id)->first();
        if($product)
        {
            $product->quantity= $quantity;             
            $cart[$id]=$product->toArray();
        }
              
        session()->put('cart', $cart);        
        $this->emit("cartChanged");
    }
    public function render()
    {
        $products=Product::where('status','=','Active') 
            ->orderBy('id', 'desc') 
                  
            // ->where('p.name','LIKE','%'.$this->search['name'].'%')
            ->paginate(12);
        $product_ids=array();
        $product_ids[0]=0;
        foreach($products as $product)
        {
            $product_ids[$product->id]=$product->id;
        }
        $results=ProductPicture::where('status','=','Active')
                ->whereIn('product_id', $product_ids)
                ->get()->toArray();                
        $pictures=array();
        foreach($results as $result)
        {
            $pictures[$result['product_id']][]=$result;
        }
            
        if($this->permissions['action_0']==1)
        {
            return view('livewire.shop.list',['products'=>$products,'pictures'=>$pictures])->layout('theme.component');
        }
        else
        {
            return view('theme.access-denied')->layout('theme.component');
        }
    }
}
