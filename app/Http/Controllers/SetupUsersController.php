<?php

namespace App\Http\Controllers;
use App\HelperClasses\ModuleTaskHelper;
use App\Models\User;
use App\Models\UserGroup;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

use Laravel\Fortify\Rules\Password;


class SetupUsersController extends RootController
{
    public $permissions;
    function __construct(Request $request)
    {
        parent::__construct($request); 
        //$this->permissions=ModuleTaskHelper::getUserTasks(ModuleTaskHelper::getVisitorRole(),$this->language);
        
        $this->middleware('check.api.login');
        $this->permissions=ModuleTaskHelper::getPermissions('Setup_users',$this->userGroupRole);
        
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
    public function getItems()
    {
        $response=array();
        if($this->permissions['action_0']==1)
        {
            $response['errorStr'] = '';
            $paginator=User::select('*')                
                ->orderBy('id', 'DESC')     
                ->where('status','!=','Deleted')     
                ->paginate(3);
            
            
            //$response['items']=$paginator->data;  
            $response['total']=$paginator->total();  
            $response['last_page']=$paginator->lastPage();  
            $response['items']=$paginator->items();  
            return response()->json($response, 200); 
        }
        else
        {
            return response()->json(['errorStr'=>'UNAUTHORIZED'], 401);            
        }
    }
    public function getItem($id)
    {
        $response=array();
        if($this->permissions['action_0']==1)
        {
            $item=User::select('id','name_en','name_bn','status')                 
                ->where('id','=', $id)     
                ->first(); 
            if($item)
            {
                $response['errorStr'] = '';
                $response['item']=$item->toArray();  
                return response()->json($response, 200); 
            }
            else
            {
                $response['errorStr'] = 'ITEM_NOT_FOUND';                
                $response['message'] = 'Requested Item Not Found';                
                return response()->json($response, 404);                 
            }
            
        }
        else
        {
            return response()->json(['errorStr'=>'UNAUTHORIZED'], 401);            
        }
    }
    public function saveItem()
    {
        if($this->request->id>0)
        {
            if($this->permissions['action_2']!=1)
            {
                return response()->json(['errorStr'=>'UNAUTHORIZED','message'=>"No Edit permission"], 401);                
            }            
        }
        else
        {
            if($this->permissions['action_1']!=1)
            {
                return response()->json(['errorStr'=>'UNAUTHORIZED','message'=>"No Add permission"], 401);                
            }                        
        }
        try {
            $validation_rule=array();
            $validation_rule['name_en']=['required', 'string', 'max:255'];
            $validation_rule['name_bn']=['required', 'string', 'max:255'];
            $validation_rule['status']=['required'];
            $validation_rule['user_group_id']=['required'];
            if($this->request->id>0)
            {
                $item = User::find($this->request->id);
                if($item->mobile_no !=$this->request->mobile_no)
                {
                    $validation_rule['mobile_no']= ['required', 'string', 'size:11', 'unique:users'];                    
                }
                if($item->email !=$this->request->email)
                {
                    $validation_rule['email']=['required', 'string', 'email', 'max:255', 'unique:users'];                    
                }
                if($this->request->password)
                {
                    $validation_rule['password']=['required', 'string', new Password];
                }
            }
            else
            {
                $validation_rule['mobile_no']= ['required', 'string', 'size:11', 'unique:users'];
                $validation_rule['email']=['required', 'string', 'email', 'max:255', 'unique:users'];
                $validation_rule['password']=['required', 'string', new Password];
            }            
            $validator = Validator::make($this->request->all(), $validation_rule);
            if ($validator->fails()) {         
                return response()->json(['errorStr' => 'VALIDATION_FAILED','errors' => $validator->errors()], 423);                 
            }
        
            $data=array();
            $data['name_en']=$this->request->name_en;
            $data['name_bn']=$this->request->name_bn;
            $data['mobile_no']=$this->request->mobile_no;
            $data['email']=$this->request->email;
            $data['user_group_id']=$this->request->user_group_id;
            $data['status']=$this->request->status=='Active'?'Active':'In-Active';
            if($this->request->password)
            {
                $data['password']=Hash::make($this->request->password);
            }

            if($this->request->id>0)
            {   
                foreach($data as $key=>$value)
                {
                    $item->$key=$value;
                }                
                $item->save();
                return response()->json(['errorStr'=>'','message'=>"Updated Successfully"], 200);
            }
            else
            {
                
                User::create($data);                
                return response()->json(['errorStr'=>'','message'=>"Created Successfully"], 200);
            }
            
            //$test->update($request->all());
        }
        
        catch (\Exception $e) { 
            return response()->json(['errorStr'=>'SAVE_FAILED','message'=>$e->getMessage ()], 400);
        }
        
        
    }
}
