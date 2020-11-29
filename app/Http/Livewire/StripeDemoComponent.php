<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Illuminate\Http\Request;
use Stripe\Stripe;
use Stripe\Customer;
use Stripe\Charge;
class StripeDemoComponent extends Component
{
    public $checkoutState='quantitSelection';//quantitSelection,payment,paymentSuccess,paymentFailed
    public $paymentResultMessage="";
    public function mount(Request $request)
    {
        //dd($request->path());
        if($request->path()=='stripedemo')
        {
            $this->checkoutState="quantitSelection";
        }
        else if($request->path()=='stripedemo/payment-charge')
        { 
            //dd($request);
            $this->chargePayment($request->all());
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
            $this->stripePaymentAmount=5000;
            
        
            $charge = Charge::create(array(
                'customer' => $customer->id,
                'amount' => $this->stripePaymentAmount,
                'currency' => 'usd'
            ));
            //remove session
            $this->checkoutState='paymentSuccess';
            $this->paymentResultMessage='Payemnt Success';
            
        } 
        //only Exception produce laravel error so should be \Exception
        catch (\Exception $ex){
            $this->checkoutState='paymentFailed';
            $this->paymentResultMessage=$ex->getMessage();
        }
        
    }
    
    
    public function render()
    {
        
            
        if($this->checkoutState=='quantitSelection')
        {
            return view('livewire.stripedemo.quantity-selection')->layout('theme.component');
        }
        else
        {
            return view('livewire.stripedemo.payment-status')->layout('theme.component');
        }
    }
}
