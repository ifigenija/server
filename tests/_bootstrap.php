<?php

ini_set('xdebug.max_nesting_level', '200');
// Here you can initialize variables that will be available to your tests

require_once __DIR__ . '/_support/AbstractTest.php';


require_once __DIR__ . '/api/FormMetaTester.php';

\Codeception\Util\Autoload::registerSuffix('Page', __DIR__ . DIRECTORY_SEPARATOR . '_pages');
