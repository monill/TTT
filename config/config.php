<?php

// Set timezone
date_default_timezone_set('America/Sao_Paulo');

//ROOT
define('ROOT', dirname(__DIR__) . DIRECTORY_SEPARATOR);
//Controllers
define('CTRL', ROOT . 'app' . DIRECTORY_SEPARATOR . 'Controllers' . DIRECTORY_SEPARATOR);
//Data
define('DATA', ROOT . 'data' . DIRECTORY_SEPARATOR);
//Views
define('VIEWS', ROOT . 'views' . DIRECTORY_SEPARATOR);
//Cache
define('CACHE', ROOT . 'cache' . DIRECTORY_SEPARATOR);
//Logs
define('LOG', ROOT . 'logs' . DIRECTORY_SEPARATOR);

//For debug errors
error_reporting(E_ALL); //^ E_NOTICE
ini_set("display_errors", true); // Error display
ini_set("log_errors", true); // Error logging
ini_set("error_log", LOG . "php-error.txt"); // Logging file
ini_set('log_errors_max_len', 1024); // Logging file size
