<?php

namespace App\Http\Controllers;
use  App\Http\Controllers\RootController;
use Illuminate\Support\Str;

use Illuminate\Support\Facades\Auth; 
use Illuminate\Http\Request;

class UserController extends RootController
{
    function __construct()
    {
        parent::__construct(); 
        $this->middleware('auth:api')->only(
            ['getUser']
        );
        
    }   
    public function initialize(Request $request)
    {
        return response()->json([
            'initalize' => "user"],201);
    }
    public function login(Request $request)
    {
        if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){ 
            $user = Auth::user(); 
            $token = Str::random(60);
            $user->forceFill([
                'api_token' => hash('sha256', $token),
            ])->save();

            return response()->json(['token' => $token,'user'=>$user->toArray()], 200); 
        } 
        else{ 
            return response()->json(['errorStr'=>'Unauthorised'], 401); 
        } 
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
