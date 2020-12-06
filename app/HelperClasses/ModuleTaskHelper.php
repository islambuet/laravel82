<?php
    namespace App\HelperClasses;
    use App\Models\UserGroup;
    use App\Models\SystemTask;
    use Illuminate\Support\Facades\Auth;
    class ModuleTaskHelper
    {
        public static $MAX_MODULE_ACTIONS=9;
        public static function get_permissions($controller_name)//for web
        {
            $user_group_id=3;
            if(Auth::user())
            {
                $user_group_id=Auth::user()->user_group_id;
            }
            $permissions=array();
            $query=UserGroup::where('id', $user_group_id);  
            for($i=0;$i<self::$MAX_MODULE_ACTIONS;$i++) 
            {
                $permissions['action_'.$i]=0;
                $query->addselect('action_'.$i);
            }
            $userGroup=$query->first();
            $task=SystemTask::where('controller', $controller_name)->select('id')->first();
            if($task && $userGroup)
            {
                for($i=0;$i<self::$MAX_MODULE_ACTIONS;$i++) 
                {
                    if(strpos($userGroup->{'action_'.$i}, ','.$task->id.',')!==false)
                    {
                        $permissions['action_'.$i]=1;
                    }
                }
            }
            return $permissions;            
        }
        public static function getUserGroupRole($user_group_id)
        {
            $role=array();
            $query=UserGroup::where('id', $user_group_id);  
            for($i=0;$i<self::$MAX_MODULE_ACTIONS;$i++) 
            {
                $permissions['action_'.$i]=0;
                $query->addselect('action_'.$i);
                $role['action_'.$i]=',';
            }
            $userGroup=$query->first();
            if($userGroup)
            {
                $ug=$userGroup->toArray();
                for($i=0;$i<self::$MAX_MODULE_ACTIONS;$i++) 
                {
                    $role['action_'.$i]=$ug['action_'.$i];
                }
            }
            return $role;
        }
        public static function getVisitorRole()
        {
            return self::getUserGroupRole(3);
        }
        public static function getUserTasks($userGroupRole,$language='en')
        {
            $role=array();
            if(strlen($userGroupRole['action_0'])>1)
            {
                $role=explode(',',trim($userGroupRole['action_0'],','));
            }  
            $tasks=SystemTask::select('*')
                ->addSelect('name_'.$language.' as name')   
                ->orderBy('ordering', 'ASC')     
                ->get()->toArray();
            $children=array();
            foreach($tasks as $task)
            {
                if($task['type']=='TASK')
                {
                    if(in_array($task['id'],$role))
                    {
                        $children[$task['parent']][$task['id']]=$task;
                    }
                }
                else
                {
                    $children[$task['parent']][$task['id']]=$task;
                }
            }
            $tree=array();
            if(isset($children[0]))
            {
                $tree = self::getUserSubTasks($children, $children[0]);
            }
            return $tree;                 
        }
        public static function getUserSubTasks(&$list, $parent)
        {
            $tree = array();
            foreach ($parent as $key=>$element)
            {
                //$tree[] = $element;
                if(isset($list[$element['id']]))
                {
                    $children=self::getUserSubTasks($list, $list[$element['id']]);
                    if($children)
                    {
                        $element['children'] = $children;
                        $tree[] = $element;
                    }
                }
                else
                {
                    if($element['type']=='TASK')
                    {
                        $tree[] = $element;
                    }
                }
            }
            return $tree;

        }
    }
    