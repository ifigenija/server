<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

return [
    'doctrine' => [
        'driver' => [
            'Abonmaji' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'apc',
                'paths' => [
                    __DIR__ . '/../src/Abonmaji/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'Abonmaji\Entity' => 'Abonmaji'
                ]
            ]
        ],
    ],
    'entity_config' => [
        'Abonmaji\Entity\Abonma' => ['key' => '9001'],
    ],
];
