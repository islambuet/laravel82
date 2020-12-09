<?php

namespace App\Http\Controllers;
use App\HelperClasses\ModuleTaskHelper;

use Illuminate\Http\Request;

class ModuleTaskController extends RootController
{
    public $permissions;
    function __construct(Request $request)
    {
        parent::__construct($request); 
        //$this->permissions=ModuleTaskHelper::getUserTasks(ModuleTaskHelper::getVisitorRole(),$this->language);
        
        $this->middleware('check.api.login');
        $this->permissions=ModuleTaskHelper::getPermissions('Sys_module_task',$this->userGroupRole);
        
    } 
    public function initialize()
    {
        //permissions
        //types
        //item
        $response=array();
        if($this->permissions['action_0']==0)
        {
            $response['errorStr'] = '';        
            $response['permissions'] = $this->permissions;        
            $response['types'] = ['MODULE','TASK'];        
            return response()->json($response, 200); 
        }
        else
        {
            return response()->json(['errorStr'=>'UNAUTHORIZED'], 401);            
        }
        
    } 
}
