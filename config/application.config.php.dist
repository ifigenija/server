<?php

$env = getenv('APP_ENV') ? : (isset($_SERVER['APP_ENV']) ? $_SERVER['APP_ENV'] : 'XXX');
return [
    'modules'                 => [
        'DoctrineModule',
        'DoctrineORMModule',
        'ZfcRbac',
        'Max',
        'App',
        'Aaa',
        'Jobs',
        'Stevilcenje',
        'Produkcija',
        'Koledar',
        'Prisotnost',
        'Abonmaji',
        'Prodaja',
        'ProgramDela',
	'Zapisi'
    ],
    'module_listener_options' => [
        'config_glob_paths'    => [
            sprintf('config/autoload/{global,local,local.%s}.php', $env),
        ],
        'module_paths'         => [
            './module',
            './vendor',
        ],
        'config_cache_enabled' => TRUE,   // v razvoju to popravimo na FALSE, v produkciji pustimo na TRUE
        'config_cache_key'     => $env . 'config_cache' ,
        'cache_dir'            => 'data',
    ]
];
