<?php

namespace App\Http\Controllers;
use App\HelperClasses\ModuleTaskHelper;
use App\Models\SystemTask;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


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
        
        $validator = Validator::make($this->request->all(), [
            'name_en' => ['required', 'string', 'max:255'],
            'name_bn' => ['required', 'string', 'max:255'],
            'type' => ['required']
        ]);
        if ($validator->fails()) {         
            return response()->json(['errorStr' => 'VALIDATION_FAILED','errors' => $validator->errors()], 423);                 
        }
        try {
            if($this->request->id>0)
            {
                $task = SystemTask::find($this->request->id);
                $task->name_en = $this->request->name_en;
                $task->name_bn = $this->request->name_bn;
                $task->type = $this->request->type;
                $task->parent = $this->request->parent?$this->request->parent:0;
                $task->controller = $this->request->controller?$this->request->controller:'';
                $task->ordering = $this->request->ordering?$this->request->ordering:9999;
                $task->status = $this->request->status?$this->request->status:'Active';
                $task->save();
                return response()->json(['errorStr'=>'UPDATE_SUCCESS','message'=>"Updated Successfully"], 200);
            }
            else
            {
                SystemTask::create([
                    'name_en' => $this->request->name_en,
                    'name_bn' => $this->request->name_bn,
                    'type' => $this->request->type,
                    'parent' => $this->request->parent?$this->request->parent:0,
                    'controller' => $this->request->controller?$this->request->controller:'',
                    'ordering' => $this->request->ordering?$this->request->ordering:9999,
                    'status' => $this->request->status?$this->request->status:'Active',
                    
                ]);                
                return response()->json(['errorStr'=>'SAVE_SUCCESS','message'=>"Created Successfully"], 200);
            }
            
            //$test->update($request->all());
        }
        
        catch (\Exception $e) { 
            return response()->json(['errorStr'=>'SAVE_FAILED','message'=>$e->getMessage ()], 400);
        }
        
        
    }
}
