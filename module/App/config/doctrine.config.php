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
 ];