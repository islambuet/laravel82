<?php

namespace App\Http\Controllers;
use  App\Http\Controllers\RootController;


use Illuminate\Support\Facades\Auth; 
use Illuminate\Http\Request;
use App\HelperClasses\ModuleTaskHelper;
use App\HelperClasses\EncryptDecryptHelper;

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
            $this->userGroupRole=ModuleTaskHelper::getuserGroupRole($this->user);

            return response()->json(['errorStr' => '','user'=>$this->getUserInfoForApi($user->toArray())], 200); 
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
    public function getUser(Request $request)
    {
        
        $user = Auth::user(); 
        if($user)
        {
            return response()->json(['user'=>$user->toArray()], 200); 
        }
        else
        {
            return response()->json(['errorStr'=>'Unauthorised','message'=>"user empty"], 401); 
        }
        
    }
}
