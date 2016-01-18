<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [

    'service_manager' => [
        'factories'  => [
        ],
        'invokables' => [
            'praznik.rpc.service'     => 'Koledar\Rpc\PraznikRpcService',
            'praznik.service'         => 'Koledar\Service\PraznikService',
            'vzporednice.service'     => 'Koledar\Service\VzporedniceService',
            'vzporednice.rpc.service' => 'Koledar\Rpc\VzporedniceRpcService',
            'operacije.service'       => 'Koledar\Service\OperacijeService',
            'operacije.rpc.service'   => 'Koledar\Rpc\OperacijeRpcService',
        ],
    ],
    'controllers'     => [
        'invokables' => [
            'Rpc\koledar' => 'Koledar\Controller\RpcController',
            'Koledar\Cli' => 'Koledar\Controller\CliController',
        ],
        'factories'  => [
            'Rest\dogodek'         => 'Max\Factory\RestControllerFactory',
            'Relation\dogodek'     => 'Max\Factory\ToManyControllerFactory',
            'Rest\predstava'       => 'Max\Factory\RestControllerFactory',
            'Relation\predstava'   => 'Max\Factory\ToManyControllerFactory',
            'Rest\gostovanje'      => 'Max\Factory\RestControllerFactory',
            'Relation\gostovanje'  => 'Max\Factory\ToManyControllerFactory',
            'Rest\gostujoca'       => 'Max\Factory\RestControllerFactory',
            'Rest\dogodekSplosni'  => 'Max\Factory\RestControllerFactory',
            'Rest\sezona'          => 'Max\Factory\RestControllerFactory',
            'Relation\sezona'      => 'Max\Factory\ToManyControllerFactory',
            'Rest\vaja'            => 'Max\Factory\RestControllerFactory',
            'Rest\tipVaje'         => 'Max\Factory\RestControllerFactory',
            'Rest\Praznik'         => 'Max\Factory\RestControllerFactory',
            'Rest\dogodekTehnicni' => 'Max\Factory\RestControllerFactory',
        ]
    ],
    'router'          => [
        'routes' => [
        ],
    ],
    'console'         => [
        'router' => [
            'routes' => [
                'prekrivanje' => [
                    'options' => [
                        'route'    => 'prekrivanje <stevilka> [<stevx>]',
                        'defaults' => [
                            'controller' => 'Koledar\Cli',
                            'action'     => 'prekrivanje'
                        ]
                    ],
                ],
                'vzporednice' => [
                    'options' => [
                        'route'    => 'vzporednice <stevilka> [<stevx>]',
                        'defaults' => [
                            'controller' => 'Koledar\Cli',
                            'action'     => 'vzporednice'
                        ]
                    ]
                ],
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
                "chck-dogodek" => 'Koledar\Assertion\AssertDogodek',
            ],
        ],
        "assertion_map"     => [
            "Dogodek-read" => "chck-dogodek"
        ],
    ],
];
