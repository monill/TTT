<?php

namespace App\Controllers;

use App\Libs\Redirect;

class Home extends Controller
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
        $this->view('home/index', []);
    }
}
