<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [
    'service_manager' => [
        'factories'  => [
            'Zend\Session\SessionManager' => 'App\Factory\SessionFactory'
        ],
        'invokables' => [
            'options.service' => '\App\Service\OptionsService'
        ]
    ],
    'controllers'     => [
        'factories'  => [
            'Rest\drzava'       => 'Max\Factory\RestControllerFactory',
            'Rest\oseba'        => 'Max\Factory\RestControllerFactory',
            'Relation\oseba'        => 'Max\Factory\ToManyControllerFactory',
            'Rest\posta'        => 'Max\Factory\RestControllerFactory',
            'Rest\postniNaslov' => 'Max\Factory\RestControllerFactory',
            'Rest\trr'          => 'Max\Factory\RestControllerFactory',
            'Rest\telefonska'   => 'Max\Factory\RestControllerFactory',
            'Rest\popa'         => 'Max\Factory\RestControllerFactory',
            'Rest\role'         => 'Max\Factory\RestControllerFactory',
            'Rest\user'         => 'Max\Factory\RestControllerFactory',
        ],
        'invokables' => [
            'Rest\options' => 'App\Controller\OptionsRestController',
            'Rpc\app'      => '\App\Controller\RpcController',
            'App\index'    => '\App\Controller\IndexController',
        ]
    ],
    'router'          => [
        'routes' => [
            'home' => [
                'type'    => 'Literal',
                'options' => [
                    'route'    => '/',
                    'defaults' => [
                        'controller' => 'App\index',
                        'action'     => 'index'
                    ]
                ],
            ],
            'rpc'  => [
                'type'          => 'Literal',
                'options'       => [
                    'route'    => '/rpc',
                    'defaults' => [
                        '__NAMESPACE__' => 'Rpc',
                    ]
                ],
                'may_terminate' => false,
                'child_routes'  => [
                    'settings' => [
                        'type'    => 'Segment',
                        'options' => [
                            'route'       => '/:controller/:action',
                            'constraints' => [
                                'controller' => '[a-zA-Z0-9]+',
                            ],
                        ]
                    ]
                ]
            ],
            'rest' => [
                'type'    => 'Segment',
                'options' => [
                    'route'       => '/rest/:controller[/:view][/:id]',
                    'defaults'    => [
                        '__NAMESPACE__' => 'Rest',
                        'view'          => 'default',
                        'action'        => null
                    ],
                    'constraints' => [
                        'controller' => '[A-Za-z]+',
                        'view'       => '[A-Za-z]+',
                        'id'         => \Max\Consts::UUID
                    ]
                ],
                 'may_terminate' => true,
                'child_routes' => [
                    'relation' => [
                        'type' => 'Segment',
                        'options' => [
                            'route' => '/:relation[/:relid]',
                            'defaults' => [
                                '__NAMESPACE__' => 'Relation',
                                'action' => null
                            ],
                            'constraints' => [
                                'relation' => '[A-Za-z]+',
                                'relid' => \Max\Consts::UUID,
                            ],
                        ],
                    ]
                ]
            ],
        ]
    ],
    'form_elements'   => [
        'invokables' => [
        ]
    ],
    'view_manager'    => [
        'template_path_stack' => [
            __DIR__ . '/../view',
        ],
        'strategies'          => [
            'ViewJsonStrategy'
        ],
    ],
    'zfc_rbac'        => [
        'protection_policy' => \ZfcRbac\Guard\GuardInterface::POLICY_ALLOW,
        'assertion_manager' => [
            "invokables" => [
                "chck-oseba" => "App\Assertion\AssertOseba",
            ],
        ],
        "assertion_map" => [
            "Oseba-write" => "chck-oseba" 
        ],
        
        'guest_role'        => 'anonymous',
        'role_provider'     => [
            'ZfcRbac\Role\ObjectRepositoryRoleProvider' => [
                'object_manager'     => 'doctrine.entitymanager.orm_default',
                'class_name'         => 'Aaa\Entity\Role',
                'role_name_property' => 'name'
            ]
        ]
    ],
];
