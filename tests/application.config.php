<?php

return array(
    'modules' => array(
        //'ZendDeveloperTools',
        'DoctrineModule',
        'DoctrineORMModule',
        'Max',
        'Util',
        'IfiApp'  
    ),
    'module_listener_options' => array(
        'config_glob_paths' => array(
            'config/autoload/{global,local,local.test}.php',
        ),
        'module_paths' => array(
            'module',
            'vendor'
        ),
    )
);
