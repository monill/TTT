<?php

namespace App\Controllers;

use App\Libs\Email;
use App\Libs\Helper;
use App\Libs\Input;
use App\Libs\Redirect;
use App\Libs\Token;
use App\Libs\Validation;
use App\Models\Log;
use App\Models\PasswordReset;
use App\Models\User;

class Recover extends Controller
{
    private $valid;
    private $mail;

    public function __construct()
    {
        parent::__construct();
        if ($this->loggedIn()) {
            Redirect::to('/home');
        }
        $this->valid = new Validation();
        $this->mail = new Email();
    }

    public function index()
    {
        Redirect::to('/recover/account');
    }

    public function account()
    {
        if (Input::exist()) {
            if (!Token::check(Input::get('token')))
            {
                $email = Input::get('email');

                $errors = $this->validEmail($email);

                if (count($errors) == 0)
                {
                    $check = array();

                    if ($this->valid->banned($email)) {
                        $check[] = "Account banned.";
                    } else {
                        $hash = Helper::codeActivation();

                        $newrest = new PasswordReset();
                        $newrest->email = $email;
                        $newrest->hash = $hash;
                        $newrest->created_at = Helper::dateTime();
                        $newrest->save();

                        //Log activity
                        Log::novo(1, "User with an email: {$email} requested password reset.");

                        //Send mail
                        $this->mail->resetPass($email, $hash);

                        $msg = "Check your email to reset your password, Inbox or SPAM.";
                        echo json_encode(['status' => 'success', 'msg' => $msg]);
                    }

                    if ($check) {
                        echo json_encode(['status' => 'error', 'errors' => $check]);
                    }

                } else {
                    echo json_encode(['status' => 'error', 'errors' => $errors]);
                }
            } else {
                echo 'Invalid Token';
            }
        } else {
            //Redirect::to('/recover/account');
            $this->view('recover/account', []);
        }
    }

    private function validEmail($email)
    {
        $errors = array();

        if ($this->valid->isEmpty($email)) {
            $errors[] = "Blank email is not worth.";
        }
        if ($this->valid->validEmail($email)) {
            $errors[] = "Invalid email.";
        }
        if (!$this->valid->emailExist($email)) {
            $errors[] = "Informed email not found.";
        }
        return $errors;
    }

    public function code($hash)
    {
        $code = $this->valid->resetKey($hash);

        if ($code)
        {
            $this->view('recover/recover', [
                'coding' => $hash
            ]);
        } else {
            echo "<h4 class='text-danger' style='text-align: center;'> Reset key is invalid or already used. </h4>";
            //Redirect::to('/recover');
        }

    }

    public function on()
    {
        if (Input::exist()) {
            if (!Token::check(Input::get('token')))
            {
                $pwd = Input::get('password');
                $pwd1 = Input::get('password2');
                $hash = Input::get('coding');

                $errors = $this->validPass($pwd, $pwd1);

                $key = $this->valid->resetKey($hash);

                if ($key == true) {
                    if (count($errors) == 0) {
                        $user = PasswordReset::where('hash', '=', $hash)->first();

                        $upd = User::where('email', '=', $user->email)->first();
                        $upd->passwd = $pwd;
                        $upd->save();

                        //After update delete record
                        $user->delete();

                        Log::novo($upd->id, "User: {$upd->username} changed the password successfully.");
                        echo json_encode(['status' => 'success', 'msg' => 'Password changed successfully!']);
                    } else {
                        echo json_encode(['status' => 'error', 'errors' => $errors]);
                    }
                } else {
                    echo 'Reset key is invalid please dont change.';
                }

            } else {
                echo 'Invalid Token';
            }
        } else {
            Redirect::to('/recover/account');
        }
    }

    private function validPass($pwd, $pwd1)
    {
        $errors = array();

        if ($this->valid->isEmpty($pwd)) {
            $errors[] = "Please enter a password.";
        }
        if ($this->valid->isEmpty($pwd1)) {
            $errors[] = "Please enter the second password.";
        }
        if ($pwd != $pwd1) {
            $errors[] = "The passwords do not match.";
        }
        if (strlen($pwd) < 6 || strlen($pwd1) > 16) {
            $errors[] = "Password must be from 6 to 16 characters.";
        }
        return $errors;
    }
}
