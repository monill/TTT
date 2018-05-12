<?php

namespace App\Controllers;

use App\Libs\BrowserDetection;
use App\Libs\Cookie;
use App\Libs\Helper;
use App\Libs\Input;
use App\Libs\Redirect;
use App\Libs\Session;
use App\Libs\Token;
use App\Libs\Validation;
use App\Models\User;
use App\Models\UserLogin;
use App\Models\UserProfile;

class Login extends Controller
{
    private $valid;

    public function __construct()
    {
        parent::__construct();
        if ($this->loggedIn()) {
            Redirect::to('/home');
        }
        $this->valid = new Validation();
    }

    public function index()
    {
        if (Input::exist())
        {
            if (!Token::check(Input::get('token')))
            {
                $email = Input::get('email');
                $pass = Input::get('password');

                //check for brute force


                $errors = $this->validLogin($email, $pass);

                if (count($errors) == 0)
                {
                    $user = User::where('email', '=', $email)->first();

                    $check = array();

                    if (password_verify($pass, $user->passwd) === false) {
                        $check[] = "Username or password not match.";
                    }

                    //if no errors start login
                    if (count($check) == 0)
                    {
                        //start session
                        Session::set('loggedin', true);
                        Session::set('user_id', $user->id);
                        Session::set('username', $user->username);
                        Session::set('class', $user->class);

                        //update login
                        $this->updateLogin($user->id);

                        Redirect::to('/home');

                    } else {
                        // $this->triesLogin();
                        echo json_encode(['status' => 'error', 'errors' => $check]);
                    }

                } else {
                    // $this->triesLogin();
                    echo json_encode(['status' => 'error', 'errors' => $errors]);
                }

            } else {
                // $this->triesLogin();
                echo json_encode(['status' => 'error', 'errors' => 'Invalid Token.']);
                Redirect::to('/login');
            }

        } else {
            // $this->triesLogin();
            //Redirect::to('/login');
            $this->view('auth/login', []);
        }
    }

    private function validLogin($mail, $pass)
    {
        $errors = array();

        if ($this->valid->isEmpty($mail)) {
            $errors[] = "Please enter the account!";
        }
        if ($this->valid->isEmpty($pass)) {
            $errors[] = "Please enter the password!";
        }
        if (!$this->valid->emailExist($mail)) {
            $errors[] = "E-mail or password not found!";
        }
        if (!$this->valid->validEmail($mail)) {
            $errors[] = "E-mail not valid!";
        }
        if ($this->valid->banned($mail) == true) {
            $errors[] = "Account banned!";
        }
        if ($this->valid->pending($mail) == true) {
            $errors[] = "Account not activated!";
        }
        return $errors;
    }

    private function updateLogin($user_id)
    {
        $browser = new BrowserDetection();

        $newlogin = new UserLogin();
        $newlogin->user_id = $user_id;
        $newlogin->ip = Helper::getIP();
        $newlogin->browser = $browser->getName();
        $newlogin->os_system = $browser->getPlatformVersion();
        $newlogin->created_at = Helper::dateTime();
        $newlogin->save();

        User::where('id', '=', $user_id)->increment('points', LOGIN_POINTS);
    }

    /**
     * Generate a string that will be used as a fingerprint.
     * This is actually a string created from the user's browser name and the user's IP
     * Address, so if someone steals users session, he will not be able to access.
     * @return string generated string.
     */
    private function loginString()
    {
        $ip = Helper::getIP();
        $browser = Helper::browser();
        return hash("sha512", $ip, $browser);
    }

}
