<?php

namespace App\Controllers;

use App\Libs\Input;
use App\Libs\Redirect;
use App\Libs\Session;
use App\Libs\Token;
use App\Libs\Validation;
use App\Models\Log;
use App\Models\User;

class Account extends Controller
{
    private $valid;

    public function __construct()
    {
        parent::__construct();
        if (!$this->loggedIn()) {
            Redirect::to('/login');
        }
        $this->valid = new Validation();
    }

    public function index()
    {
        $this->view('account/index', []);
    }

    public function updateaccount()
    {
        if (Input::exist())
        {
            if (!Token::check(Input::get("token")))
            {
                $user = $this->db->select1("SELECT `username`, `passkey` FROM `users` WHERE `id` = :uid", ["uid" => 7]);

                $info = Input::get("info");
                $acceptpms = Input::get("acceptpms");
                $privacy = Input::get("privacy");
                $resetkey = Input::get("resetkey");
                $avatar = Input::get("avatar");
                $title = Input::get("title");
                $signature = Input::get("signature");
                $estate_id = Input::get("estate_id");
                $gender = Input::get("gender");

                $errors = array();

                if (strlen($info) > 1000) {
                    $errors[] = "Info max 1k characters.";
                }

                if (strlen($title) > 240) {
                    $errors[] = "Info max 240 characters.";
                }

                if (strlen($signature) > 240) {
                    $errors[] = "Info max 240 characters.";
                }

                if ($resetkey == "yes") {
                    $key = Helper::md5Gen();
                } else {
                    $key = $user->passkey;
                }

                if (count($errors) == 0)
                {
                    $this->db->update("users", [
                        'info' => $info,
                        'acceptpms' => $acceptpms,
                        'privacy' => $privacy,
                        'passkey' => $key,
                        'avatar' => $avatar,
                        'title' => Helper::escape($title),
                        'signature' => Helper::escape($signature),
                        'estate_id' => $estate_id,
                        'sex' => $gender,
                        'updated_at' => Helper::dateTime()
                    ], "`id` = :uid", ['uid' => 7]);

                    $result = [
                        'status' => 'sucess',
                        'msg' => 'Profile updated successfully'
                    ];

                    Log::create("User: {$user->username} update profile.");

                    echo json_encode($result);

                    Redirect::to('/account');

                } else {
                    echo json_encode($errors);
                }
            } else {
                echo 'Invalid Token';
            }
        } else {
            Redirect::to('/account');
        }
    }

    public function updatepass()
    {
        $errors = array();

        $passwd = Input::get("passwd");
        $repasswd = Input::get("passwd2");

        if ($this->valid->isEmpty($passwd)) {
            $errors[] = "New password is empty";
        }
        if ($this->valid->isEmpty($repasswd)) {
            $errors[] = "Repeat passowrd is empty";
        }
        if (strlen($passwd) < 6 || strlen($passwd) > 16) {
            $errors[] = "Password min 6 and max 16 characeres";
        }
        if ($passwd !== $repasswd) {
            $errors[] = "The passwords do not match.";
        }

        if (count($errors) == 0)
        {
            $uid = Session::get('user_id');
            $user = User::find($uid);
            $user->passwd = $passwd;
            $user->update();

            Log::novo($uid, "User change the password.");

            echo json_encode(['status' => 'success', 'msg' => 'Password successfully changed']);

            Redirect::to('/account');

        } else {
            echo json_encode($errors);
        }
    }

    public function updatesocial()
    {

    }
}
