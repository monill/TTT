<?php

$url = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]";

// Website URL
define('URL', $url);
// Site name
define('SNAME', 'Mobile');