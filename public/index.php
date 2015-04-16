<?php

/**
 * uporabimo, če hočemo videti napake v produkciji
 * v razvoju nastavimo rajši v /etc/php5/apache2/php.ini, da velja za vse projekte
 */
//if ($_SERVER['APP_ENV'] == 'development') {
//     error_reporting(E_ALL);
//     ini_set("display_errors", 1);
// }


/**
 * This makes our life easier when dealing with paths. Everything is relative
 * to the application root now.
 */
chdir(dirname(__DIR__));
define('REQUEST_MICROTIME', microtime(true));
ini_set('xdebug.max_nesting_level', '200');

// Setup autoloading
include 'init_autoloader.php';

// Run the application!
$app = Zend\Mvc\Application::init(include 'config/application.config.php');
$app->run();
