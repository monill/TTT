<?php

namespace App\Controllers;

use App\Libs\Email;
use App\Libs\Helper;
use App\Libs\Input;
use App\Libs\Redirect;
use App\Libs\Token;
use App\Libs\Validation;
use App\Models\Country;
use App\Models\Log;
use App\Models\User;
use App\Models\UserActivation;

class Signup extends Controller
{
    private $mailer;
    private $valid;

    public function __construct()
    {
        parent::__construct();
        if ($this->loggedIn()) {
            Redirect::to('/home');
        }
        $this->mailer = new Email();
        $this->valid = new Validation();
    }

    public function index()
    {
        if (Input::exist()) {
            if (!Token::check(Input::get('token')))
            {
                $user = Input::get('username');
                $pass = Input::get('password');
                $pass2 = Input::get('password2');
                $mail = Input::get('email');
                $dob = Input::get('dob');
                $country = Input::get('country');
                $gender = Input::get('gender');

                if ($dob == null) {
                    $today = date('m-d-Y');
                    $data = \DateTime::createFromFormat('m-d-Y', $today);
                    $dob = $data->format('Y-m-d');
                } else {
                    $data = \DateTime::createFromFormat('m-d-Y', $dob);
                    $dob = $data->format('Y-m-d');
                }

                if ($country == null) {
                    $country = 235;
                }

                //start the validation
                $errors = $this->validSign($user, $mail, $pass, $pass2);

                //if Zero errors, begin signup register
                if (count($errors) == 0) {
                    $key = Helper::md5Gen();
                    $date = Helper::dateTime();

                    $newuser = new User();
                    $newuser->email = $mail;
                    $newuser->passwd = Helper::hashPass($pass);
                    $newuser->username = $user;
                    $newuser->passkey = $key;
                    $newuser->dob = $dob;
                    $newuser->country_id = $country;
                    $newuser->sex = $gender;
                    $newuser->created_at = $date;
                    $newuser->save();

                    $uid = $newuser->id;

                    $newactv = new UserActivation();
                    $newactv->user_id = $uid;
                    $newactv->hash = $key;
                    $newactv->created_at = $date;
                    $newactv->save();

                    Log::novo($uid, "A new member registered an new account: {$user}");

                    $this->mailer->confirmEmail($mail, $uid, $key);

                    $msg = "Account created successfully check your email to activate your account, Inbox or SPAM.";

                    echo json_encode(['status' => 'success', 'msg' => $msg]);

                } else {
                    echo json_encode(['status' => 'error', 'errors' => $errors]);
                }
            } else {
                echo 'Invalid Token.';
            }
        } else {
            //Redirect::to('/signup');
            $this->view('auth/signup', [
                'countries' => Country::all()
            ]);
        }
    }

    private function validSign($user, $mail, $pass, $pass2)
    {
        $errors = array();

        if ($this->valid->isEmpty($user)) {
            $errors[] = "Please enter the account.";
        }
        if ($this->valid->isEmpty($mail)) {
            $errors[] = "Please enter an email.";
        }
        if ($this->valid->isEmpty($pass)) {
            $errors[] = "Please enter a password.";
        }
        if ($this->valid->isEmpty($pass2)) {
            $errors[] = "Please enter the second password.";
        }
        if ($pass != $pass2) {
            $errors[] = "The passwords do not match.";
        }
        if (strlen($pass) < 6 || strlen($pass2) > 16) {
            $errors[] = "Password must be between 6 and 16 characters long.";
        }
        if (!$this->valid->validEmail($mail)) {
            $errors[] = "Please enter a valid email address.";
        }
        if ($this->valid->emailExist($mail)) {
            $errors[] = "The email provided is already in use.";
        }
        if ($this->valid->userExist($user)) {
            $errors[] = "The chosen username is already in use.";
        }
        if (strlen($user) < 3 && strlen($user) > 25) {
            $errors[] = "User can have between 3 and 25 characters.";
        }
        if (!ctype_alnum($user)) {
            $errors[] = "The username can only contain letters and numbers with no space.";
        }
        return $errors;
    }

    public function activeac($user_id, $hash)
    {
        if ($user_id !== '' && $hash !== '')
        {
            if (strlen($hash) != 32) {
                Redirect::to('/signup');
            } else {
                $userAc = UserActivation::where('user_id', '=', $user_id)
                    ->where('hash', '=', $hash)
                    ->first();

                if ($userAc) {

                    $user = User::find($user_id);
                    $user->status = 'confirmed';
                    $user->updated_at = Helper::dateTime();
                    $user->save();

                    $userAc->hash = '';
                    $userAc->active = 1;
                    $userAc->actived_at = Helper::dateTime();
                    $userAc->save();

                    Log::novo($user_id, "A new member just active account: {$user->username}");

                    $this->mailer->thanks($user->email);

                    $msg = "Account activated successfully, now you can login.";
                    echo json_encode(['status' => 'success', 'msg' => $msg]);

                } else {
                    echo "<h5 class='text-error'> Activation key does not exist or account already activated. </h5>";
                    Redirect::to('/signup');
                }
            }
        } else {
            echo 'Empty fields not valid.';
        }
    }
}
