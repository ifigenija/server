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
            'Rest\terminStoritve' => 'Max\Factory\RestControllerFactory',
            'Rest\dodatek'        => 'Max\Factory\RestControllerFactory',
            'Rest\tipdodatka'     => 'Max\Factory\RestControllerFactory',
        ]
    ],
    'entity_map'      => [
        'Prisotnost\Entity\TerminStoritve' => 'b001',
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
                "chck-terminstoritve" => "Prisotnost\Assertion\AssertTerminStoritve",
            ],
        ],
        "assertion_map"     => [
            "TerminStoritve-write" => "chck-terminstoritve"
        ],
    ],
];
