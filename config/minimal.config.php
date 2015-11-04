<?php

$env = getenv('APP_ENV') ? : (isset($_SERVER['APP_ENV']) ? $_SERVER['APP_ENV'] : 'XXX');
$crp = getenv('DEST_DB') ? : (isset($_SERVER['SRC_DB']) ? $_SERVER['DEST_DB'] : 'XXX');

return [
    'modules'                 => [
        'DoctrineModule',
        'DoctrineORMModule',
        'Max',
        'Stevilcenje',
        'Crpalka',
        'Util',
    ],
    'module_listener_options' => [
        'config_glob_paths'    => [
            sprintf('config/autoload/{global,local,local.%s,crpalka.%s}.php', $env, $crp),
            'module/*/config/doctrine.config.php',
        ],
        'module_paths'         => [
            './module',
            './vendor',
        ],
        'config_cache_enabled' => FALSE,
        'config_cache_key'     => 'minimal-config' . $env,
        'cache_dir'            => 'data',
    ]
];
