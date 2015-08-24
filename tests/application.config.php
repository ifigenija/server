<?php

$loadConfigOnly = 'App';


return array(
    'modules'                 => array(
        //'ZendDeveloperTools',
        'DoctrineModule',
        'DoctrineORMModule',
        'ZfcRbac',
        'Max',
        'Aaa',
        'App',
        'Produkcija',
        'Abonmaji',
        'Koledar',
        'Prisotnost',
        'Prodaja',
        'Stevilcenje',
        'ProgramDela',
        'TestAssets',
    ),
    'module_listener_options' => array(
        'config_glob_paths' => array(
            'config/autoload/{global,local,local.test}.php',
        ),
        'module_paths'      => array(
            'module',
            'vendor',
            'tests',
        ),
    )
);
