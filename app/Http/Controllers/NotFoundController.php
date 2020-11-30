<?php

namespace App\Http\Controllers;
use  App\Http\Controllers\RootController;

use Illuminate\Http\Request;

class NotFoundController extends RootController
{
    function __construct()
    {
        parent::__construct();        
        
    }   
    public function index(Request $request)
    {
        return response()->json([
            'errorStr' => 'NOT_FOUND',
            'message'=>'Requested page not found'],404);
           
        
    }
}
