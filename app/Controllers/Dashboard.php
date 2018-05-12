<?php

namespace App\Controllers;

use App\Libs\Input;
use App\Libs\Redirect;
use App\Libs\Token;
use App\Models\User;

class Dashboard extends Controller
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
        $this->view('dashboard/index', []);
    }

    public function avatars()
    {
        $this->view('dashboard/avatars', [
            'users' => User::where('status', '=', 'confirmed')->paginate(2)
        ]);
    }

    public function backups()
    {
        $this->view('dashboard/backups', []);
    }

    public function bannedtorrents()
    {
        $this->view('dashboard/bannedtorrents', []);
    }

    public function categories()
    {
        $this->view('dashboard/categories', []);
    }

    public function censors()
    {
        if (Input::exist())
        {
            if (!Token::check(Input::get('token')))
            {
                $badword = Input::get('badwords');

                $file = fopen('censor.txt', 'w+');
                fwrite($file, $badword);
                fclose($file);

                Redirect::to('/dashboard/censors');

            } else {
                echo 'Invalid Token';
            }
        } else {

            $f = fopen('censor.txt', 'r');
            $badwords = fread($f, filesize('censor.txt'));
            fclose($f);

        }
        $this->view('dashboard/censors', [
            'badwords' => $badwords
        ]);
    }

    public function cheaters()
    {
        $this->view('dashboard/cheaters', []);
    }

    public function emailbans()
    {
        $this->view('dashboard/emailbans', []);
    }

    public function faqcategories()
    {
        $this->view('dashboard/faqcategories', []);
    }

    public function faqs()
    {
        $this->view('dashboard/faqs', []);
    }

    public function forums()
    {
        $this->view('dashboard/forums', []);
    }

    public function freetorrents()
    {
        $this->view('dashboard/freetorrents', []);
    }

    public function invites()
    {
        $this->view('dashboard/invites', []);
    }

    public function ipbans()
    {
        $this->view('dashboard/ipbans', []);
    }

    public function lastcomments()
    {
        $this->view('dashboard/lastcomments', []);
    }

    public function logs()
    {
        $this->view('dashboard/logs', []);
    }

    public function masspm()
    {
        $this->view('dashboard/masspm', []);
    }

    public function news()
    {
        $this->view('dashboard/news', []);
    }

    public function peers()
    {
        $this->view('dashboard/peers', []);
    }

    public function pendinginvites()
    {
        $this->view('dashboard/pendinginvites', []);
    }

    public function polls()
    {
        $this->view('dashboard/polls', []);
    }

    public function privacylevels()
    {
        if (Input::exist())
        {
            if (!Token::check(Input::get('token')))
            {
                $privacy = Input::get('privacy');

                $users = User::where('status', '=', 'confirmed')
                    ->where('profile', '=', $privacy)
                    ->get();

            } else {
                echo 'Invalid Token';
            }
        } else {

            $users = User::where('status', '=', 'confirmed')->get();
        }
        $this->view('dashboard/privacylevels', [
            'users' => $users
        ]);
    }

    public function reports()
    {
        $this->view('dashboard/reports', []);
    }

    public function rules()
    {
        $this->view('dashboard/rules', []);
    }

    public function settings()
    {
        $this->view('dashboard/settings', []);
    }

    public function sqlerrors()
    {
        $this->view('dashboard/sqlerrors', []);
    }

    public function torrents()
    {
        $this->view('dashboard/torrents', []);
    }

    public function users()
    {
        $this->view('dashboard/users', []);
    }

    public function usersearches()
    {
        $this->view('dashboard/usersearches', []);
    }

    public function warneds()
    {
        $this->view('dashboard/warneds', []);
    }
}
