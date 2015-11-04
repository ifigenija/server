<?php

/**
 * This makes our life easier when dealing with paths. Everything is relative
 * to the application root now.
 */
chdir(dirname(__DIR__));
define('REQUEST_MICROTIME', microtime(true));

// Setup autoloading
include 'init_autoloader.php';

// Run the application!
$app = Zend\Mvc\Application::init(include 'config/minimal.config.php');
$app->run();
