<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\HelperClasses\ModuleTaskHelper;
use App\Models\Product;
use App\Models\Purchase;
use Illuminate\Http\Request;
use Stripe\Stripe;
use Stripe\Customer;
use Stripe\Charge;
use Illuminate\Support\Facades\Auth;
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
            $cart=session('cart');

            foreach($cart as $key=>$item)
            {
                $cart[$key]['quantity']=$data[$item['id']];
                $item['quantity']=$data[$item['id']];
                $this->products[]=$item;
                $this->stripePaymentAmount+=($item['quantity']*$item['price']*100);
            }  
            session()->put('cart', $cart);  
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

            $cart=session('cart');
            $this->stripePaymentAmount=0;
            foreach($cart as $key=>$item)
            {   
                $this->stripePaymentAmount+=($item['quantity']*$item['price']*100);
            }              
            //insert into db too
        
            $charge = Charge::create(array(
                'customer' => $customer->id,
                'amount' => $this->stripePaymentAmount,
                'currency' => 'usd'
            ));
            //remove session
            $this->checkoutState='paymentSuccess';
            $purchase=array();
            $purchase['user_id']=Auth::id();
            $purchase['stripeEmail']=$data['stripeEmail'];
            $purchase['stripeToken']=$data['stripeToken'];
            $purchase['stripeCustomerId']=$customer->id;
            $purchase['products']=json_encode($cart);
            $purchase['amount']=$this->stripePaymentAmount;
            Purchase::create($purchase);
            //dd($charge);
            // id: "ch_1HrwyzC7Qt33rDM6t67WOSTu"
            // object: "charge"
            // amount: 10000
            // amount_captured: 10000
            // amount_refunded: 0
            // application: null
            // application_fee: null
            // application_fee_amount: null
            // balance_transaction: "txn_1Hrwz0C7Qt33rDM6l6Q1Yt1k"
            // billing_details: Stripe\StripeObject {#1381 ▶}
            // calculated_statement_descriptor: "Stripe"
            // captured: true
            // created: 1606445209
            // currency: "usd"
            // customer: "cus_ISskhnkK6TVvth"
            // description: null
            // destination: null
            // dispute: null
            // disputed: false
            // failure_code: null
            // failure_message: null
            // fraud_details: []
            // invoice: null
            // livemode: false
            // metadata: Stripe\StripeObject {#1382 ▶}
            // on_behalf_of: null
            // order: null
            // outcome: Stripe\StripeObject {#1386 ▶}
            // paid: true
            // payment_intent: null
            // payment_method: "card_1HrwyvC7Qt33rDM6z5CXMSnu"
            // payment_method_details: Stripe\StripeObject {#1391 ▶}
            // receipt_email: null
            // receipt_number: null
            // receipt_url: "https://pay.stripe.com/receipts/acct_1HrA8aC7Qt33rDM6/ch_1HrwyzC7Qt33rDM6t67WOSTu/rcpt_ISsk4hN0dyS9CuapPYzwDtSUeFFWJn7"
            // refunded: false
            // refunds: Stripe\Collection {#1394 ▶}
            // review: null
            // shipping: null
            // source: Stripe\Card {#1398 ▶}
            // source_transfer: null
            // statement_descriptor: null
            // statement_descriptor_suffix: null
            // status: "succeeded"
            // transfer_data: null
            // transfer_group: null

            session()->forget('cart');
        
            
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
