<?php

return [
    'doctrine' => [
        'connection' => array(
            'orm_dest' => array(
                'driverClass' => 'Doctrine\DBAL\Driver\PDOPgSql\Driver',
                'params'      => array(
                    'host'     => 'localhost', // pusti host in port prazno za unix socket connect
                    'port'     => '5432',
                    'user'     => 'ifi',
                    'password' => 'ifi1234xx',
                    'dbname'   => 'IfiStage',
                )
            )
        ),
    ],
];

