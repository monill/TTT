<?php

namespace App\Controllers;

use App\Libs\Redirect;

class Forum extends Controller
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
        $this->view('forum/index', []);
    }

    public function topic($slug)
    {
        $this->view('forum/topic', []);
    }
}
