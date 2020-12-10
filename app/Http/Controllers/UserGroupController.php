<?php

namespace App\Http\Controllers;
use App\HelperClasses\ModuleTaskHelper;
use App\Models\UserGroup;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class UserGroupController extends RootController
{
    public $permissions;
    function __construct(Request $request)
    {
        parent::__construct($request); 
        //$this->permissions=ModuleTaskHelper::getUserTasks(ModuleTaskHelper::getVisitorRole(),$this->language);
        
        $this->middleware('check.api.login');
        $this->permissions=ModuleTaskHelper::getPermissions('Sys_user_group',$this->userGroupRole);
        
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
            $response['modules_tasks']=ModuleTaskHelper::getModulesTasksTableTree();                            
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
            $results=UserGroup::select('*')                
                ->orderBy('ordering', 'ASC')     
                ->orderBy('id', 'ASC')     
                ->where('status','!=','Deleted')     
                ->get()->toArray();
            $user_groups=array();
            foreach($results as $result)
            {
                $result['num_tasks']=substr_count($result['action_0'], ',')-1;
                $user_groups[]=$result;
            }
            $response['items']=$user_groups;  
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
            $item=UserGroup::select('id','name','ordering','status')                 
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
        
        $validator = Validator::make($this->request->all(), [
            'name' => ['required', 'string', 'max:255'],            
            'status' => ['required']
        ]);
        if ($validator->fails()) {         
            return response()->json(['errorStr' => 'VALIDATION_FAILED','errors' => $validator->errors()], 423);                 
        }
        try {
            if($this->request->id>0)
            {
                $item = UserGroup::find($this->request->id);
                $item->name = $this->request->name;               
                $item->ordering = isset($this->request->ordering)?$this->request->ordering:9999;
                $item->status = ($this->request->status=='Active')?'Active':'In-Active';
                $item->save();
                return response()->json(['errorStr'=>'','message'=>"Updated Successfully"], 200);
            }
            else
            {
                UserGroup::create([
                    'name' => $this->request->name,
                    'ordering' => isset($this->request->ordering)?$this->request->ordering:9999,
                    'status' => $this->request->status=='Active'?'Active':'In-Active',
                    
                ]);                
                return response()->json(['errorStr'=>'','message'=>"Created Successfully"], 200);
            }
            
            //$test->update($request->all());
        }
        
        catch (\Exception $e) { 
            return response()->json(['errorStr'=>'SAVE_FAILED','message'=>$e->getMessage ()], 400);
        }
        
        
    }
    public function saveRole($id)
    {
        if($this->permissions['action_2']!=1)
        {
            return response()->json(['errorStr'=>'UNAUTHORIZED','message'=>"No Edit permission"], 401);                
        }  
        $tasks=$this->request->tasks;
        $user_group=UserGroup::find($this->request->id);
        try{
            foreach($tasks as $task)
            {
                if(isset($task['actions']))
                {
                    $task['actions'][0]=1;
                }
                else
                {
                    $task['actions'][0]=0;
                }
                for($i=0;$i<ModuleTaskHelper::$MAX_MODULE_ACTIONS;$i++)
                {
                    $user_group['action_'.$i]=str_replace(','.$task['task_id'].',',',' ,$user_group['action_'.$i]);//remove the task from action
                    if(isset($task['actions'][$i]))
                    {
                        if(($task['actions'][$i])==1)
                        {
                            $user_group['action_'.$i].=$task['task_id'].',';//add the task into action
                        }
                    }

                }
            }
            $user_group->save();
            return response()->json(['errorStr'=>'','message'=>"Saved Successfully"], 200);

        }
        catch (\Exception $e) { 
            return response()->json(['errorStr'=>'SAVE_FAILED','message'=>$e->getMessage ()], 400);
        }
    }
}
