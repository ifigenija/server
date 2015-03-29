<?php
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
$app = Zend\Mvc\Application::init(include 'config/entity_only.config.php');
$app->run();
