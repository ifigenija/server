<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

return [
    'doctrine' => [
        'driver' => [
            'Prodaja' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'meta',
                'paths' => [
                    __DIR__ . '/../src/Prodaja/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'Prodaja\Entity' => 'Prodaja'
                ]
            ]
        ],
    ],

];
