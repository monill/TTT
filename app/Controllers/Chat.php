<?php

namespace App\Controllers;

use App\Libs\Redirect;

class Chat extends Controller
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
        $this->view('chat/index', []);
    }
}
