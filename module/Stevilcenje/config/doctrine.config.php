<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

return [
    'doctrine' => [
        'driver' => [
            'Stevilcenje' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'apc',
                'paths' => [
                    __DIR__ . '/../src/Stevilcenje/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'Stevilcenje\Entity' => 'Stevilcenje'
                ]
            ]
        ],
    ],
 ];