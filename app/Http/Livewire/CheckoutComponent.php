<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\HelperClasses\ModuleTaskHelper;
use App\Models\Product;
use Illuminate\Http\Request;
use Stripe\Stripe;
use Stripe\Customer;
use Stripe\Charge;
class CheckoutComponent extends Component
{
    public $checkoutState='quantitSelection';//quantitSelection,payment,paymentSuccess,paymentFailed
    public $products=array();  
    public $stripePaymentAmount=0;
    public $permissions=array();
    public $paymentFailMessage="";
    public function mount(Request $request)
    {
        //dd($request->path());
        if($request->path()=='checkout')
        {
            $this->checkoutState="quantitSelection";
        }
        else if($request->path()=='checkout/payment')
        { 
            $this->checkoutState="payment";
            $this->goPayment($request->input('quantity'));
            //dd($request->input('quantity'));
        }
        else if($request->path()=='checkout/payment-charge')
        { 
            //dd($request);
            $this->chargePayment($request->all());
            
        }
        //dd($request);
        $this->permissions=ModuleTaskHelper::get_permissions('checkout');   
        
    }    
    public function goQuantitSelection()
    {   
        $this->checkoutState='quantitSelection';
    }
    public function goPayment($data)
    {   
        $this->stripePaymentAmount=0;
        $this->products=array();
        if(session()->has('cart') )
        {
            foreach(session('cart') as $item)
            {
                $item['quantity']=$data[$item['id']];
                $this->products[]=$item;
                $this->stripePaymentAmount+=($item['quantity']*$item['price']*100);
            }   
        }        
    }
    public function chargePayment($data)
    { 
        //dd($data);
        try 
        {
            Stripe::setApiKey(env('STRIPE_SECRET_KEY'));
        
            $customer = Customer::create(array(
                'email' => $data['stripeEmail'],
                'source' => $data['stripeToken']
            ));
        
            $charge = Charge::create(array(
                'customer' => $customer->id,
                'amount' => 1999,
                'currency' => 'usd'
            ));
            //remove session
            $this->checkoutState='paymentSuccess';
        
            
        } 
        //only Exception produce laravel error so should be \Exception
        catch (\Exception $ex){
            $this->checkoutState='paymentFailed';
            $this->paymentFailMessage=$ex->getMessage();
        }

        
        
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
