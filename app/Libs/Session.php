<?php

namespace App\Libs;

class Session
{
    /**
     * Start session.
     */
    public static function startSession()
    {
        ob_start();
        ini_set("session.use_only_cookies", SESSION_USE_ONLY_COOKIES);

        $cookieParams = session_get_cookie_params();
        session_set_cookie_params(
            $cookieParams["lifetime"],
            $cookieParams["path"],
            $cookieParams["domain"],
            SESSION_SECURE,
            SESSION_HTTP_ONLY
        );

        ini_set('session.cookie_domain', $cookieParams["domain"]);
        //session_name(SNAME); //if uncommnet dont start session, nothing works
        session_start();

        session_regenerate_id(SESSION_REGENERATE_ID);
    }

    /**
     * Destroy session.
     */
    public static function destroySession()
    {
        $_SESSION = array();

        $params = session_get_cookie_params();

        setcookie(
            session_name(),
            '',
            time() - 420000,
            $params["path"],
            $params["domain"],
            $params["secure"],
            $params["httponly"]
        );
        session_destroy();
    }

    /**
     * Set session data.
     * @param mixed $key Key that will be used to store value.
     * @param mixed $value Value that will be stored.
     */
    public static function set($key, $value)
    {
        if (isset($_SESSION)) {
            return $_SESSION[$key] = $value;
        }
    }

    /**
     * Get data from $_SESSION variable.
     * @param mixed $key Key used to get data from session.
     * @param mixed $default This will be returned if there is no record inside
     * session for given key.
     * @return mixed Session value for given key.
     */
    public static function get($key)
    {
        if (isset($_SESSION[$key])) {
            return $_SESSION[$key];
        } else {
            return false;
        }
    }

    /**
    * Unset session data with provided key.
    * @param $key
    */
    public static function destroy($key)
    {
        if (isset($_SESSION[$key])) {
            self::set($key, ' ');
            unset($_SESSION[$key]);
        }
    }

    public static function flash(string $name, string $message)
    {
        if (self::get($name)) {
            $session = self::get($name);
            self::destroy($name);
        } else {
            self::set($name, $message);
        }
        return $session;
    }

}
