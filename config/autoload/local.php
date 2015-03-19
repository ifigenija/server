<?php

/**
 * Local Configuration Override
 *
 * This configuration override file is for overriding environment-specific and
 * security-sensitive configuration information. Copy this file without the
 * .dist extension at the end and populate values as needed.
 *
 */
return [
    'tip' => [
        'useOptimizedJs' => false,
        'firma' => '0001'  // sifra poslovnega prartnerja, ki predstavlja 
                            // firmo uporabnika
    ],
    'doctrine' => [
        'connection' => [
            'orm_default' => [
                'driverClass' => 'Doctrine\DBAL\Driver\PDOPgSql\Driver',
                'params' => [
                    'host' => '127.0.0.1', // pusti host in port prazno za unix socket connect
                    'port' => '5432',
                    'user' => 'posl',
                    'password' => 'posl1234',
                    'dbname' => 'posl',
                ]
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
            'enabled' => true,
        ]
    ]
];
