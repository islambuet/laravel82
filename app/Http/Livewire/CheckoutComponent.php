<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\HelperClasses\ModuleTaskHelper;
use App\Models\Product;
use Illuminate\Http\Request;

class CheckoutComponent extends Component
{
    public $checkoutState=1;//1=selected 2=payment 3=success 4=failed 
    public $products=array();  
    public $permissions=array();
    public function mount()
    {
        $this->permissions=ModuleTaskHelper::get_permissions('checkout');        
    }    
    public function goState1()
    {   
        $this->checkoutState=1;
    }
    public function goState2($data)
    {   
        $this->products=array();
        if(session()->has('cart') )
        {
            foreach(session('cart') as $item)
            {
                $item['quantity']=$data['quantity_'.$item['id']];
                $this->products[]=$item;
            }   
        }
        $this->checkoutState=2;
    }
    public function goState3($data)
    {  
        dd($data);
    }
    public function removeCartItem($id)
    {
        $cart=session('cart');
        if(isset($cart[$id]))
        {
            unset($cart[$id]);
            session()->put('cart', $cart); 
            $this->emit("cartChanged"); 
        }
    }
    
    public function render()
    {
        
            
        if($this->permissions['action_0']==1)
        {
            return view('livewire.checkout.index')->layout('theme.component');
        }
        else
        {
            return view('theme.access-denied')->layout('theme.component');
        }
    }
}
