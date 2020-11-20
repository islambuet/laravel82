<?php

namespace App\Http\Livewire\Theme;

use Livewire\Component;
use Auth;
use App\Models\UserGroup;
use App\Models\SystemTask;
class SidebarLeft extends Component
{
    public $menu="";
    public function render()
    {
        $this->menu=$this->get_html_menu();
        return view('theme.sidebar-left');
    }
    public function get_html_menu()
    {
        $user=Auth::user();
        $user_group_id=3;//visitor menus
        if($user)
        {
            $user_group_id=$user->user_group_id;
        }
        $userGroup=UserGroup::where('id', $user_group_id)->first();
        $tasks=SystemTask::select('*')
        ->addSelect('name_'.config('app.locale').' as name')   
        ->orderBy('ordering', 'ASC')     
        ->get();

        $role_data=array();
        if(strlen($userGroup['action_0'])>1)
        {
            $role_data=explode(',',trim($userGroup['action_0'],','));
        }
        $menu_data=array();
        foreach($tasks as $task)
        {
            if($task['type']=='TASK')
            {
                if(in_array($task['id'],$role_data))
                {
                    $menu_data['items'][$task['id']]=$task;
                    $menu_data['children'][$task['parent']][]=$task['id'];
                }
            }
            else
            {
                $menu_data['items'][$task['id']]=$task;
                $menu_data['children'][$task['parent']][]=$task['id'];
            }
        }
        $html='';
        if(isset($menu_data['children'][0]))
        {
            foreach($menu_data['children'][0] as $child)
            {
                $html.=$this->get_html_submenu($child,$menu_data,1);
            }
        }
        return $html;

        //return '<li><a href="'.url('/teset').'">'.__('Home').'</a></li>';
    }
    public function get_html_submenu($parent,$menu_data,$level)
    {
        if(isset($menu_data['children'][$parent]))
        {
            $sub_html='';
            foreach($menu_data['children'][$parent] as $child)
            {
                $sub_html.=$this->get_html_submenu($child,$menu_data,$level+1);

            }
            $html='';
            if($sub_html)
            {


                $html.='<li>';
                $html.='<a href="#sub_'.$menu_data['items'][$parent]['id'].'" data-toggle="collapse" aria-expanded="false">'.$menu_data['items'][$parent]['name'].'<span class="fe-menu-arrow"></span></a>';
                //$html.='<a href="#" class="dropdown-toggle" data-toggle="dropdown">'.$menu_data['items'][$parent]['name'].'</a>';


                $html.='<ul class="collapse list-unstyled" id="sub_'.$menu_data['items'][$parent]['id'].'">';
                $html.=$sub_html;
                $html.='</ul></li>';
            }

            return $html;

        }
        else
        {
            if($menu_data['items'][$parent]['type']=='TASK')
            {
                return '<li><a class="system_ajax" href="'.url(strtolower($menu_data['items'][$parent]['controller'])).'">'.$menu_data['items'][$parent]['name'].'</a></li>';
            }
            else
            {
                return '';
            }

        }
    }
}