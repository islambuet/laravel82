<?php

namespace App\Http\Controllers;
use App\HelperClasses\ModuleTaskHelper;

use Illuminate\Http\Request;
use Stripe\Stripe;
use Stripe\Customer;
use Stripe\Charge;


class StripeDemoController extends RootController
{
    public $permissions;
    function __construct(Request $request)
    {
        parent::__construct($request); 
        //$this->permissions=ModuleTaskHelper::getUserTasks(ModuleTaskHelper::getVisitorRole(),$this->language);
        
        //$this->middleware('check.api.login');
        $this->permissions=ModuleTaskHelper::getPermissions('stripe_demo',$this->userGroupRole);
        
    } 
    public function initialize()
    {
        //permissions
        //types
        //item
        $response=array();
        if($this->permissions['action_0']==1)
        {
            $response['errorStr'] = '';        
            $response['permissions'] = $this->permissions;
            $user_groups=UserGroup::select('id','name')                
                ->orderBy('ordering', 'ASC')     
                ->orderBy('id', 'ASC')     
                ->where('status','!=','Deleted');  
                if($this->user->user_group_id!=1)
                {
                    $user_groups->where('id','!=',1);                                    
                }   
            $response['user_groups']=$user_groups->get()->toArray();
            return response()->json($response, 200); 
        }
        else
        {
            return response()->json(['errorStr'=>'UNAUTHORIZED'], 401);            
        }
        
    } 
    public function getIntent()
    {
        Stripe::setApiKey(env('STRIPE_SECRET_KEY'));
        try{
            $intent = \Stripe\PaymentIntent::create([
                'amount' => 1099,
                'currency' => 'usd',
                // Verify your integration in this guide by including this parameter
                'metadata' => ['integration_check' => 'accept_a_payment'],
              ]);     
              return response()->json(['errorStr'=>'','intent'=>$intent], 200);   
        }
        catch (\Exception $ex){
            return response()->json(['errorStr'=>'UNAUTHORIZED','message'=>$ex->getMessage ()], 401);
        }
        
    }
}
