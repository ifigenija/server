<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

return [
    'doctrine' => [
        'driver' => [
            'App' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'apc',
                'paths' => [
                    __DIR__ . '/../src/App/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'App\Entity' => 'App'
                ]
            ]
        ],
    ],
    'entity_config' => [
        'App\Entity\Drzava' => ['key' => 'a002'],
        'App\Entity\Option' => ['key' => 'a003'],
        'App\Entity\Oseba' => ['key' => 'a004'],
        'App\Entity\Popa' => ['key' => 'a005'],
        'App\Entity\Postninaslov' => ['key' => 'a006'],
        'App\Entity\Telefonska' => ['key' => 'a007'],
    ],
];
