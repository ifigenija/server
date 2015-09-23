<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

return [
    'doctrine' => [
        'driver' => [
            'ProgramDela' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'meta',
                'paths' => [
                    __DIR__ . '/../src/ProgramDela/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'ProgramDela\Entity' => 'ProgramDela'
                ]
            ]
        ],
    ],
 ];