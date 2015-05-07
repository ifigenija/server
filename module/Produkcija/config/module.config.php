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
    'controllers'     => [
        'invokables' => [
        ],
        'factories'  => [
            'Rest\pogodba'          => 'Max\Factory\RestControllerFactory',
            'Rest\alternacija'      => 'Max\Factory\RestControllerFactory',
            'Rest\funkcija'         => 'Max\Factory\RestControllerFactory',
            'Rest\rekvizit'         => 'Max\Factory\RestControllerFactory',
            'Rest\rekviziterstvo'   => 'Max\Factory\RestControllerFactory',
            'Rest\zvrstSurs'        => 'Max\Factory\RestControllerFactory',
            'Rest\zvrstUprizoritve' => 'Max\Factory\RestControllerFactory',
            'Rest\besedilo'         => 'Max\Factory\RestControllerFactory',
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
