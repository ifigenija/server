<?php

/**
 * Local Configuration Override
 *
 * This configuration override file is for overriding environment-specific and
 * security-sensitive configuration information. Copy this file without the
 * .dist extension at the end and populate values as needed.
 *
 */



 $getDbConfig = function()
{

    $xx = getenv('TESTDB') ? : (isset($_SERVER['TESTDB']) ? $_SERVER['TESTDB'] : 'XXX');

    switch ($xx) {
        case 'stage':
            return [
                'host' => '127.0.0.1', // pusti host in port prazno za unix socket connect
                'port' => '5432',
                'user' => 'posl',
                'password' => 'posl1234',
                'dbname' => 'TipStage',
            ];
            
        case 'acc':
            return [
                'host' => '127.0.0.1', // pusti host in port prazno za unix socket connect
                'port' => '5432',
                'user' => 'posl',
                'password' => 'posl1234',
                'dbname' => 'TipAcceptance'
            ];
           
        default:
            
            return [
                'host' => '127.0.0.1', // pusti host in port prazno za unix socket connect
                'port' => '5432',
                'user' => 'posl',
                'password' => 'posl1234',
                'dbname' => 'TipFunctional',
            ];
    }
};

//#var_dump(getenv('TESTDB'));
//var_dump($_SERVER);
//var_dump($getDbConfig());
ini_set('html_errors', 0);
return [
    'tip' => [
        'useOptimizedJs' => false,
        'firma' => '0001',
        'revision_listener' => 0
    ],
    'doctrine' => [
        'connection' => [
            'orm_default' => [
                'driverClass' => 'Doctrine\DBAL\Driver\PDOPgSql\Driver',
                'params' => $getDbConfig()
            ]
        ],
        'configuration' => [
            'orm_default' => [
                'metadata_cache' => 'apc',
                'query_cache' => 'apc',
                'result_cache' => 'apc',
                'driver' => 'orm_default',
                'generate_proxies' => false,
            ]
        ],
    ],
    'zenddevelopertools' => [
        'profiler' => [
            'enabled' => false,
        ],
        'toolbar' => [
            'enabled' => false,
        ]
    ]
];

