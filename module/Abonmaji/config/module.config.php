<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [

    'service_manager' => [
        'factories' => [
        ]
    ],
    'entity_map'      => [
        'Abonmaji\Entity\Abonma' => 'a001',
    ],
    'controllers'     => [
        'invokables' => [
        ],
        'factories'  => [
            'Rest\abonma'     => 'Max\Factory\RestControllerFactory',
            'Relation\abonma' => 'Max\Factory\ToManyControllerFactory',
        ],
    ],
    'router'          => [
        'routes' => [
        ],
    ],
    'console'         => [
        'router' => [
            'routes' => [
            ]
        ]
    ],
    'form_elements'   => [
        'invokables' => [
        ]
    ]
];
