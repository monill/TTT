<?php

namespace App\Controllers;

use App\Libs\Redirect;

class User extends Controller
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->loggedIn()) {
            Redirect::to('/login');
        }
    }

    public function index()
    {
        //
    }

    public function id($id)
    {
        echo $id;
    }
}
