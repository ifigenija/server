<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

return [
    'doctrine' => [
        'driver' => [
            'TestAssets' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'apc',
                'paths' => [
                    __DIR__ . '/../src/TestAssets/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'TestAssets\Entity' => 'TestAssets'
                ]
            ]
        ],
    ]

];
