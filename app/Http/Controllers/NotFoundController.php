<?php

namespace App\Http\Controllers;
use  App\Http\Controllers\RootController;

use Illuminate\Http\Request;

class NotFoundController extends RootController
{
    function __construct(Request $request)
    {
        parent::__construct($request);      
        
    }   
    public function index(Request $request)
    {
        return response()->json([
            'errorStr' => 'NOT_FOUND',
            'message'=>'Requested page not found'],404);
           
        
    }
}
