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
            'Rest\dogodek'        => 'Max\Factory\RestControllerFactory',
            'Relation\dogodek' => 'Max\Factory\ToManyControllerFactory',
            'Rest\predstava'      => 'Max\Factory\RestControllerFactory',
            'Rest\gostovanje'     => 'Max\Factory\RestControllerFactory',
            'Relation\gostovanje' => 'Max\Factory\ToManyControllerFactory',
            'Rest\gostujoca'      => 'Max\Factory\RestControllerFactory',
            'Relation\gostujoca' => 'Max\Factory\ToManyControllerFactory',
            'Rest\dogodekIzven'   => 'Max\Factory\RestControllerFactory',
            'Rest\sezona'         => 'Max\Factory\RestControllerFactory',
            'Relation\sezona' => 'Max\Factory\ToManyControllerFactory',
            'Rest\vaja'           => 'Max\Factory\RestControllerFactory',
            'Rest\zasedenost'     => 'Max\Factory\RestControllerFactory',
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
