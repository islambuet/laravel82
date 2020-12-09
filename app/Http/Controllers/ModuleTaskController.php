<?php

namespace App\Http\Controllers;
use App\HelperClasses\ModuleTaskHelper;
use App\Models\SystemTask;

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
    public function getItems()
    {
        $response=array();
        if($this->permissions['action_0']==0)
        {
            $response['errorStr'] = '';  
            $modulesTasks=ModuleTaskHelper::getModulesTasksTableTree();                
            $response['modulesTasks']=$modulesTasks;  
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
        if($this->permissions['action_0']==0)
        {
            $task=SystemTask::select('id','name_en','name_bn','parent','type','controller','ordering','status')                
                ->where('id','=', $id)     
                ->first(); 
            if($task)
            {
                $response['errorStr'] = '';
                $response['item']=$task->toArray();  
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
}
