<?php

namespace App\Http\Livewire\Theme;

use Livewire\Component;

class Header extends Component
{
    public $cartProducts=array();
    protected $listeners = ['cartChanged' => 'cartChanged'];
    public function mount()
    {
        $this->cartChanged();
    }
    public function cartChanged()
    {
        
        if(session()->has('cart'))
        {
            $this->cartProducts=session('cart');   
        }
    }
    public function removeCartItem($id)
    {
        $cart=session('cart');
        if(isset($cart[$id]))
        {
            unset($cart[$id]);
            session()->put('cart', $cart);  
            $this->cartChanged();
        }
        
    }
    public function render()
    {
        return view('theme.header');
    }
}
