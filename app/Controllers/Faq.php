<?php

namespace App\Controllers;

use App\Libs\Redirect;
use App\Models\Faq as Faqs;
use App\Models\FaqCategory;

class Faq extends Controller
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
        $this->view('faq/index', [
            'categs' => FaqCategory::all(),
            'answers' => Faqs::all()
        ]);
    }
}
