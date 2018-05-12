<?php

namespace App\Controllers;

use App\Libs\Helper;
use App\Libs\Redirect;
use App\Libs\Session;
use App\Libs\Views;

class Controller {

    private $loginFingerPrint = LOGIN_FINGERPRINT;

    public function __construct()
    {
        $this->loggedIn();
    }

    public function view($viewName, $data)
    {
        $view = new Views($viewName, $data);
        echo $view;
    }

    public function loggedIn()
    {
        if ((Session::get("user_id") || Session::get("loggedin")) == null) {
            return false;
        }

        if ($this->loginFingerPrint == true) {
            $loginString = $this->loginString();
            $stringNow = Session::get("login_fingerprint");

            if ($stringNow != null && $stringNow == $loginString) {
                return true;
            } else {
                //destroy session, it is probably stolen by someone
                $this->logout();
                return false;
            }
        }
        //if you got to this point, user is logged in
        return true;
    }

    private function loginString()
    {
        $ip = Helper::getIP();
        $browser = Helper::browser();
        return hash("sha512", $ip, $browser);
    }

    private function logout()
    {
        Session::destroySession();
        Redirect::to("/login");
    }
}
