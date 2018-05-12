<?php

namespace App\Controllers;

use App\Libs\Redirect;
use App\Models\Rule;

class Rules extends Controller
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
        $this->view('rules/index', [
            'rules' => Rule::all()
        ]);
    }
}
