<?php

namespace App\Http\Controllers;
use App\HelperClasses\ModuleTaskHelper;

use App\Models\Product;
use App\Models\ProductPicture;

use Illuminate\Http\Request;
use Stripe\Stripe;
use Stripe\Customer;
use Stripe\Charge;


class ShopController extends RootController
{
    public $permissions;
    function __construct(Request $request)
    {
        parent::__construct($request); 
        //$this->middleware('check.api.login');
        $this->permissions=ModuleTaskHelper::getPermissions('Shop',$this->userGroupRole);
        
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
            return response()->json($response, 200); 
        }
        else
        {
            return response()->json(['errorStr'=>'UNAUTHORIZED'], 401);            
        }
    } 
    public function getItems()
    {
        //permissions
        //types
        //item
        $response=array();
        if($this->permissions['action_0']==1)
        {
            $response['errorStr'] = '';
            /*$products=Product::where('status','=','Active') 
            ->orderBy('id', 'desc');
            $product_ids=array();
            $product_ids[0]=0;
            foreach($products as &$product)
            {
                $product->pictures=array();
                $product_ids[$product->id]=$product->id;
            }*/
            $results=ProductPicture::where('status','=','Active')->get()->toArray();                
            $pictures=array();
            foreach($results as $result)
            {
                $pictures[$result['product_id']][]=$result;
            } 
            $products=Product::where('status','=','Active')->orderBy('id', 'desc')->get()->toArray();    
            foreach($products as &$product)
            {
                
                if(isset($pictures[$product['id']]))
                {
                    $product['pictures']=$pictures[$product['id']];
                }
                else
                {
                    $product['pictures']=array();
                }
                
            }
            $response['items']=$products;
            return response()->json($response, 200); 
        }
        else
        {
            return response()->json(['errorStr'=>'UNAUTHORIZED'], 401);            
        }
        
    } 
}
