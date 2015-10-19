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
            'Relation\dogodek'    => 'Max\Factory\ToManyControllerFactory',
            'Rest\predstava'      => 'Max\Factory\RestControllerFactory',
            'Relation\predstava'  => 'Max\Factory\ToManyControllerFactory',
            'Rest\gostovanje'     => 'Max\Factory\RestControllerFactory',
            'Relation\gostovanje' => 'Max\Factory\ToManyControllerFactory',
            'Rest\gostujoca'      => 'Max\Factory\RestControllerFactory',
            'Rest\dogodekSplosni' => 'Max\Factory\RestControllerFactory',
            'Rest\sezona'         => 'Max\Factory\RestControllerFactory',
            'Relation\sezona'     => 'Max\Factory\ToManyControllerFactory',
            'Rest\vaja'           => 'Max\Factory\RestControllerFactory',
            'Rest\zasedenost'     => 'Max\Factory\RestControllerFactory',
            'Rest\tipVaje'        => 'Max\Factory\RestControllerFactory',
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
    ],
    'zfc_rbac'        => [
        'assertion_manager' => [
            "invokables" => [
                "chck-dogodek" => "Koledar\Assertion\AssertDogodek",
            ],
        ],
        "assertion_map"     => [
            "Dogodek-read" => "chck-dogodek"
        ],
    ],
];
