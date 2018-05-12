<?php

ob_start();

header("Content-Type: text/html; charset=UTF-8");
header("X-Frame-Options: DENY");
header("X-Content-Type-Options: nosniff");
header("X-XSS-Protection: 1; mode=block");

if (file_exists('../vendor/autoload.php')) {
    require_once '../vendor/autoload.php';
}

if (file_exists('../autoload/Autoload.php')) {
    require_once '../autoload/Autoload.php';
}

$run = new Autoload();
