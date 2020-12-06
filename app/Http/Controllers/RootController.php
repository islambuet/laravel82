<?php

namespace App\Http\Controllers;
use App\HelperClasses\ConfigurationHelper;
use App\HelperClasses\ModuleTaskHelper;
use Illuminate\Support\Facades\Auth; 

use Illuminate\Http\Request;

class RootController extends Controller
{
    public Request $request;
    public $language;
    public $user;
    public $userGroupRole=array();
    
    function __construct(Request $request)
    {
        $this->request=$request;
        ConfigurationHelper::load_config();        
        $this->checkApioffline();

        $this->language=in_array( $this->request->language,['en','bn'])?$this->request->language:'en';
        $this->user=Auth::guard('api')->user();
        if($this->user)
        {
            $this->userGroupRole=ModuleTaskHelper::getuserGroupRole($this->user->user_group_id);
        }
        else
        {
            $this->userGroupRole=ModuleTaskHelper::getVisitorRole();
        }
        
        
    }   
    private function checkApioffline()
    {
        if(ConfigurationHelper::isApiOffline())
        {
            
            $path=$this->request->path();            
            if(!(
                ($path=='api/user/login')||
                ($path=='api/user/initialize')

            ))
            {
                response()->json([
                    'errorStr'=>'API_OFFLINE',
                    'message' => "Api is currently Offline."],503)->send();
                exit; 
            }
        }
    } 
}
