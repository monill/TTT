<?php

namespace App\Libs;

use App\Models\User;

class Views
{
    protected $file;
    protected $data;
    protected $twig;

    public function __construct($file, $data = null)
    {
        $this->file = $file;
        $this->data = $data;

        $start_time = microtime(TRUE);
        $end_time = microtime(TRUE);
        $time_taken = ($end_time - $start_time) * 1000;
        $totaltime = round($time_taken, 5);

        $twigLoader = new \Twig_Loader_Filesystem(VIEWS);
        $this->twig = new \Twig_Environment($twigLoader, [
            'cache' => false, //CACHE,
            'auto_reload' => true // disable cache
        ]);

        $this->twig->addGlobal('token', Token::generate());
        $this->twig->addGlobal('url', URL);
        $this->twig->addGlobal('totaltime', $totaltime);

        $this->twig->addGlobal('user', User::where('id', '=', Session::get('user_id'))->first());

        $this->twig->addGlobal('phpv', phpversion());
    }

    public function __toString()
    {
        return $this->parseView();
    }

    public function parseView()
    {
        $file = $this->file . '.twig';

        if (is_null($this->data)) {
            return $this->twig->render($file);
        }

        return $this->twig->render($file, $this->data);
    }


}
