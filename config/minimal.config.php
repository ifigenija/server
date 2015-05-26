<?php

$env = getenv('APP_ENV') ? : (isset($_SERVER['APP_ENV']) ? $_SERVER['APP_ENV'] : 'XXX');

return [
    'modules'                 => [
        //    'ZendDeveloperTools',
        'DoctrineModule',
        'DoctrineORMModule',
        'Max',
        'Util',
    ],
    'module_listener_options' => [
        'config_glob_paths'    => [
            sprintf('config/autoload/{global,local,local.%s}.php', $env),
            'module/*/config/doctrine.config.php',
        ],
        'module_paths'         => [
            './module',
            './vendor',
        ],
        'config_cache_enabled' => FALSE,
        'config_cache_key'     => '4q6dayvdr46we87rw9er3224',
        'cache_dir'            => 'data',
    ]
];
