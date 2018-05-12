<?php

namespace App\Libs;

use App\Libs\Session;

class Token
{
    public static function generate()
    {
        return Session::set('token', bin2hex(random_bytes(64)));
    }

    public static function check($token)
    {
        $hash = Session::get('token');
        
        if (!is_string($hash)) {
            return false;
        }
        if (hash_equals($hash, $token)) {
            // Proceed to process the form data
            return true;
        } else {
            // Log this as a warning and keep an eye on these attempts
            Session::destroy('token');
            return false;
        }
        
    }

}
