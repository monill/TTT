<?php

namespace App\Controllers;

use App\Libs\Redirect;
use App\Libs\Session;

class Logout extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        Session::destroySession();
        Redirect::to('/login');
    }
}
