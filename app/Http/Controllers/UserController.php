<?php

namespace App\Http\Controllers;
use  App\Http\Controllers\RootController;

use Illuminate\Http\Request;

class UserController extends RootController
{
    function __construct()
    {
        parent::__construct();        
        
    }   
    public function initialize(Request $request)
    {
        return response()->json([
            'initalize' => "user"],201);
    }
}
