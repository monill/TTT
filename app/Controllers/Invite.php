<?php

namespace App\Controllers;

use App\Libs\Email;
use App\Libs\Helper;
use App\Libs\Input;
use App\Libs\Redirect;
use App\Libs\Session;
use App\Libs\Token;
use App\Libs\Validation;
use App\Models\Log;
use App\Models\User;
use \App\Models\Invite as Inv;

class Invite extends Controller
{
    private $valid;
    private $mailer;

    public function __construct()
    {
        parent::__construct();
        if (!$this->loggedIn()) {
            Redirect::to('/login');
        }
        $this->valid = new Validation();
        $this->mailer = new Email();
    }

    public function index()
    {
        if (Input::exist())
        {
            if (!Token::check(Input::get('token')))
            {
                $email = Input::get('email');

                // check for errors
                $errors = $this->valid->validEmail($email);

                // if no errors prossed
                if ($errors == true)
                {
                    $key = Helper::md5Gen();
                    $uid = Session::get('user_id');

                    $inv = new Inv();
                    $inv->email = $email;
                    $inv->hash = $key;
                    $inv->expires_on = Helper::plus7Days();
                    $inv->invited_by = $uid;
                    $inv->created_at = Helper::dateTime();
                    $inv->save();

                    $user = User::where('id', '=', $uid)->first();
                    $user->increment('points', 200);
                    $user->invites -= 1;
                    $user->save();

                    Log::novo($uid, "A member send a invite to email: {$email}.");

                    $this->mailer->invite($email, $key);

                    $msg = "An email successfully was send to {$email} to activate the account.";

                    echo json_encode(["status" => "success", "msg" => $msg]);
                } else {

                    echo json_encode(["status" => "error", "errors" => $errors]);
                }
            } else {
                echo "Invalid token";
                Redirect::to('/invite');
            }
        } else {

            $this->view('invite/index', []);
        }
    }

    public function validMail($email)
    {
        $errors = array();

        if ($this->valid->isEmpty($email)) {
            $errors[] = "Please enter an email.";
        }
        if ($this->valid->validEmail($email)) {
            $errors[] = "Please enter a valid email address.";
        }
        if ($this->valid->emailExist($email)) {
            $errors[] = "The email provided is already in use.";
        }
        return $errors;
    }
}
