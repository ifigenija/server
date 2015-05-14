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
            'Rest\dogodek'      => 'Max\Factory\RestControllerFactory',
            'Rest\predstava'    => 'Max\Factory\RestControllerFactory',
            'Rest\gostovanje'   => 'Max\Factory\RestControllerFactory',
            'Rest\gostujoca'    => 'Max\Factory\RestControllerFactory',
            'Rest\dogodekIzven' => 'Max\Factory\RestControllerFactory',
            'Rest\sezona'       => 'Max\Factory\RestControllerFactory',
            'Rest\vaja'       => 'Max\Factory\RestControllerFactory',
        ]
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
