<?php

/*
 * Licenca GPL V3 or later
 *  
 */

$getDbConfig = function()
{

    $xx = getenv('DESTDB') ? : (isset($_SERVER['DESTDB']) ? $_SERVER['TESTDB'] : 'XXX');

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


return [
    'doctrine' => [
        'connection' => array(
            'orm_test' => array(
                'driverClass' => 'Doctrine\DBAL\Driver\PDOPgSql\Driver',
                'params' => $getDbConfig()
            ),
        ),
    ]
];
