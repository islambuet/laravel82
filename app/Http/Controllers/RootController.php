<?php

namespace App\Http\Controllers;
use App\HelperClasses\ConfigurationHelper;
use App\HelperClasses\ModuleTaskHelper;

use Illuminate\Http\Request;

class RootController extends Controller
{
    public Request $request;
    public $language;
    public $userGroupRole=array();
    
    function __construct(Request $request)
    {
        $this->request=$request;
        $this->language=in_array( $this->request->language,['en','bn'])?$this->request->language:'en';
        $this->userGroupRole=ModuleTaskHelper::getuserGroupRole();
        ConfigurationHelper::load_config();        
        $this->checkApioffline();
    }   
    public function checkApioffline()
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
