<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

return [
    'doctrine' => [
        'driver' => [
            'Aaa' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'apc',
                'paths' => [
                    __DIR__ . '/../src/Aaa/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'Aaa\Entity' => 'Aaa'
                ]
            ]
        ],
        'authentication' => [
            'orm_default' => [
                'object_manager' => 'Doctrine\ORM\EntityManager',
                'identity_class' => '\Aaa\Entity\User',
                'identity_property' => 'email',
                'credential_property' => 'password',
                'credential_callable' => '\Aaa\Service\AaaService::checkPassword'
            ]
        ]
    ]
  
];
