<?php

namespace App\Libs;

use App\Models\PasswordReset;
use App\Models\User;

class Validation
{
    public function isEmpty($data)
    {
        if (is_array($data)) {
            return empty($data);
        } elseif ($data == "") {
            return true;
        } else {
            return false;
        }
    }

    public function validEmail($email)
    {
        if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return true;
        }
        return false;
    }

    public function userExist($username)
    {
        $result = User::where('username', '=', $username)->get();
        return count($result) > 0 ? true : false;
    }

    public function emailExist($email)
    {
        $result = User::where('email', '=', $email)->get();
        return count($result) > 0 ? true : false;
    }

    public function banned($email)
    {
        $user = User::where('email', '=', $email)->first();
        if ($user == null) {
            return false;
        }
        return $user->status == 'banned' ? true : false;
    }

    public function pending($email)
    {
        $user = User::where('email', '=', $email)->first();
        if ($user == null) {
            return false;
        }
        return $user->status == 'pending' ? true : false;
    }

    public function resetKey($hash)
    {
        $code = PasswordReset::where('hash', '=', $hash)->first();
        return count($code) > 0 ? true : false;
    }
}
