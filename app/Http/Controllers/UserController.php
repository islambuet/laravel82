<?php

namespace App\Http\Controllers;
use  App\Http\Controllers\RootController;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;


use App\HelperClasses\ModuleTaskHelper;
use App\HelperClasses\EncryptDecryptHelper;

use App\Models\User;
use Laravel\Fortify\Rules\Password;

class UserController extends RootController
{
    function __construct(Request $request)
    {
        parent::__construct($request); 
        $this->middleware('auth:api')->only(
            ['getUser']
        );
        
    }   
    public function initialize()
    {
        $response=array();
        $response['errorStr'] = '';
        if($this->user)
        {
            $response['user']=$this->getUserInfoForApi($this->user->toArray());           
        }
        $response['visitor']['tasks']=ModuleTaskHelper::getUserTasks(ModuleTaskHelper::getVisitorRole(),$this->language);
        return response()->json($response, 200); 
    }
    public function login()
    {
        if(Auth::attempt(['email' => $this->request->email, 'password' => $this->request->password,'status'=>'Active']))
        //if(Auth::check(['email' => $this->request->email,'status'=>'Active']))
        //if(Auth::check(['email' => request('email'), 'password' => request('password')])) 
        { 
        //if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){ 
            $user = Auth::user();             
            $user->forceFill([
                'api_token' => EncryptDecryptHelper::getUserApiToken($user->id)
            ])->save();
            $this->user=$user;
            $this->userGroupRole=ModuleTaskHelper::getuserGroupRole($this->user->user_group_id);

            return response()->json(['errorStr' => '','user'=>$this->getUserInfoForApi($this->user->toArray())], 200); 
        } 
        else{ 
            return response()->json(['errorStr'=>'LOGIN_FAILED'], 401); 
        } 
    }
    private function getUserInfoForApi($user)
    {
        $info=array();
        $info['api_token']=$user['api_token'];
        $info['id']=$user['id'];
        $info['name']=$user['name_'.$this->language];
        $info['profile_picture']=$user['profile_photo_url'];
        $info['info']['mobile_no']=$user['mobile_no'];
        $info['info']['email']=$user['email'];
        $info['tasks']=ModuleTaskHelper::getUserTasks($this->userGroupRole,$this->language);
        return $info;
    }
    public function logout()
    {   
        if ($this->user) {
            $this->user->api_token = null;
            $this->user->save();
        }
        return response()->json(['errorStr' => '','message' => 'User logged out.'], 200);
    }
    
    public function register()
    {
        $validator = Validator::make($this->request->all(), [
            'name_en' => ['required', 'string', 'max:255'],
            'name_bn' => ['required', 'string', 'max:255'],
            'mobile_no' => ['required', 'string', 'size:11', 'unique:users'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],            
            'password' => ['required', 'string', new Password]
        ]);
        if ($validator->fails()) {         
            return response()->json(['errorStr' => 'VALIDATION_FAILED','errors' => $validator->errors()], 423);                 
        }
        User::create([
            'name_en' => $this->request->name_en,
            'name_bn' => $this->request->name_bn,
            'mobile_no' => $this->request->mobile_no,
            'email' => $this->request->email,
            'password' => Hash::make($this->request->password),
        ]);
        return $this->login();
        
    }
    public function getUser()
    {
        
        $user = Auth::user(); 
        if($user)
        {
            return response()->json(['errorStr'=>'','user'=>$user->toArray()], 200); 
        }
        else
        {
            return response()->json(['errorStr'=>'Unauthorised','message'=>"user empty"], 401); 
        }
        
    }
}
