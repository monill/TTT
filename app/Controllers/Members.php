<?php

namespace App\Controllers;

use App\Libs\Input;
use App\Libs\Token;
use App\Libs\Redirect;
use App\Models\User;

class Members extends Controller
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
        $this->view('members/index', [
            'members' => User::members(),
        ]);
    }

    public function letter($letter)
    {
        if (isset($letter)) {

            $search = User::where('username', 'LIKE', "$letter%")
                ->where('status', '=', 'confirmed')
                ->where('class', '!=', 'boss')
                ->get();

            $this->view('members/index', [
                'members' => $search
            ]);

        } else {
            Redirect::to('/members');
        }
    }

    public function search()
    {
        if (Input::exist())
        {
            if (!Token::check(Input::get('token')))
            {
                $user = Input::get('user');
                $class = Input::get('class');

                if (!$class) {
                    unset($class);
                }
                if (!$user) {
                    $user = null;
                }

                $search = User::where('username', 'LIKE', "%$user%")
                    ->where('class', '=', $class)
                    ->where('status', '=', 'confirmed')
                    ->where('class', '!=', 'boss')
                    ->get();

                $this->view('members/index', [
                    'members' => $search
                ]);

            } else {
                Redirect::to('/members');
            }

        } else {
            Redirect::to('/members');
        }
    }
}
