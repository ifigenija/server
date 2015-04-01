<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

return [
    'doctrine' => [
        'driver' => [
            'aaa' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'apc',
                'paths' => [
                    __DIR__ . '/../src/Aaa/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'Aaa\Entity' => 'aaa'
                ]
            ]
        ],
        'authentication' => [
            'orm_default' => [
                'object_manager' => 'Doctrine\ORM\EntityManager',
                'identity_class' => '\Aaa\Entity\User',
                'identity_property' => 'username',
                'credential_property' => 'password',
                'credential_callable' => '\Aaa\Service\AaaService::checkPassword'
            ]
        ]
    ],
    'entity_config' => [
        'Aaa\Entity\User' => [
            'key' => 'f002'
        ],
        'Aaa\Entity\Role' => [
            'key' => 'f003'
        ],
        'Aaa\Entity\Permission' => [
            'key' => 'f004'
        ],
    ],
];
