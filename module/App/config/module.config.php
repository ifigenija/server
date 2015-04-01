<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [

    'controllers' => [
        'factories' => [
            'Rest\drzava' => 'Max\Factory\RestControllerFactory',
            'Rest\oseba' => 'Max\Factory\RestControllerFactory',
            'Rest\posta' => 'Max\Factory\RestControllerFactory',
            'Rest\postniNaslov' => 'Max\Factory\RestControllerFactory',
            'Rest\role' => 'Max\Factory\RestControllerFactory',
        ],
        'invokables' => [
            'Rest\options' => 'App\Controller\OptionsRestController',
            'Rpc\app' => '\App\Controller\RpcController',
            'App\index' => '\App\Controller\IndexController',
        ]
    ],

    'router' => [
        'routes' => [
            'home' => [
                'type' => 'Literal',
                'options' => [
                    'route' => '/',
                    'defaults' => [
                        'controller' => 'App\index',
                        'action' => 'index'
                    ]
                ],
            ],
            'rpc' => [
                'type' => 'Literal',
                'options' => [
                    'route' => '/rpc',
                    'defaults' => [
                        '__NAMESPACE__' => 'Rpc',
                    ]
                ],
                'may_terminate' => false,
                'child_routes' => [
                    'settings' => [
                        'type' => 'Segment',
                        'options' => [
                            'route' => '/:controller/:action',
                            'constraints' => [
                                'controller' => 'aaa|app|sodelavci||arhiv|seznam',
                            ],
                        ]
                    ]
                ]
            ],
            'rest' => [
                'type' => 'Segment',
                'options' => [
                    'route' => '/rest/:controller[/:view][/:id]',
                    'defaults' => [
                        '__NAMESPACE__' => 'Rest',
                        'view' => 'default'
                    ],
                    'constraints' => [
                        'controller' => '[A-Za-z]+',
                        'view' => '[A-Za-z]+',
                        'id' => '[0-9]+'
                    ]
                ],
            ],
        ]
    ],
    'form_elements' => [
        'invokables' => [
        ]
    ],
    'view_manager' => [
        'template_path_stack' => [
            __DIR__ . '/../view',
        ],
    ],
];
