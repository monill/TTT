<?php

namespace App\Controllers;

class Error extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->view('errors/404', []);
    }

}
