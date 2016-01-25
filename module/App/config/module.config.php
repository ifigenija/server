<?php

/*
 * Licenca gplv3
 */


return [
    'service_manager' => [
        'factories'  => [
            'Zend\Session\SessionManager' => 'App\Factory\SessionFactory'
        ],
        'invokables' => [
            'options.rpc.service'     => 'App\Service\OptionsRpcService',
            'options.service'         => 'App\Service\OptionsService',
            'entity.decorator.filter' => 'App\Filter\DecorateEntity',
            'entity.stripper.filter'  => 'App\Filter\StripEntity',
            'oseba.rpc.service'       => 'App\Service\OsebaRpcService',
            'oseba.service'           => 'App\Service\OsebaService',
        ]
    ],
    'controllers'     => [
        'factories'  => [
            'Rest\drzava'                  => 'Max\Factory\RestControllerFactory',
            'Rest\oseba'                   => 'Max\Factory\RestControllerFactory',
            'Relation\oseba'               => 'Max\Factory\ToManyControllerFactory',
            'Rest\posta'                   => 'Max\Factory\RestControllerFactory',
            'Rest\postninaslov'            => 'Max\Factory\RestControllerFactory',
            'Rest\trr'                     => 'Max\Factory\RestControllerFactory',
            'Rest\telefonska'              => 'Max\Factory\RestControllerFactory',
            'Rest\popa'                    => 'Max\Factory\RestControllerFactory',
            'Relation\popa'                => 'Max\Factory\ToManyControllerFactory',
            'Rest\role'                    => 'Max\Factory\RestControllerFactory',
            'Rest\user'                    => 'Max\Factory\RestControllerFactory',
            'Rest\kontaktnaoseba'          => 'Max\Factory\RestControllerFactory',
            'Rest\tippopa'                 => 'Max\Factory\RestControllerFactory',
            'Rest\option'                 => 'Max\Factory\RestControllerFactory',            
            'Rest\organizacijskaenota'     => 'Max\Factory\RestControllerFactory',
            'Relation\organizacijskaenota' => 'Max\Factory\ToManyControllerFactory',
        ],
        'invokables' => [
            //'Rest\options' => 'App\Controller\OptionsRestController',
            'Rpc\app'      => '\App\Controller\RpcController',
            'App\index'    => '\App\Controller\IndexController',
            'Lookup'       => '\Max\Controller\LookupController',
        ]
    ],
    'router'          => [
        'routes' => [
            'home'   => [
                'type'    => 'Literal',
                'options' => [
                    'route'    => '/',
                    'defaults' => [
                        'controller' => 'App\index',
                        'action'     => 'index'
                    ]
                ],
            ],
            'rpc'    => [
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
            'rest'   => [
                'type'          => 'Segment',
                'options'       => [
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
                'child_routes'  => [
                    'relation' => [
                        'type'    => 'Segment',
                        'options' => [
                            'route'       => '/:relation[/:relid]',
                            'defaults'    => [
                                '__NAMESPACE__' => 'Relation',
                                'action'        => null
                            ],
                            'constraints' => [
                                'relation' => '[A-Za-z]+',
                                'relid'    => \Max\Consts::UUID,
                            ],
                        ],
                    ]
                ]
            ],
            'lookup' => [
                'type'    => 'Segment',
                'options' => [
                    'route'       => '/lookup/:ent',
                    'defaults'    => [
                        'controller' => 'Lookup',
                        'action'     => null
                    ],
                    'constraints' => [
                        'ent' => '[A-Za-z-]+'
                    ]
                ],
            ]
        ]
    ],
    'console'         => [
        'router' => [
            'routes' => [

                'matica-create' => [
                    'options' => [
                        'route'    => 'matica [--force] <naziv>',
                        'defaults' => [
                            'controller' => 'App\Cli',
                            'action'     => 'createMatico'
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
                "chck-oseba-write"   => "App\Assertion\AssertOseba",
                "chck-trr-write"     => "App\Assertion\AssertTrrWrite",
                "chck-trr"           => "App\Assertion\AssertTrr",
                "chck-tel-write"     => "App\Assertion\AssertTelefonskaWrite",
                "chck-tel"           => "App\Assertion\AssertTelefonska",
                "chck-pnaslov-write" => "App\Assertion\AssertPostniNaslovWrite",
                "chck-pnaslov"       => "App\Assertion\AssertPostniNaslov",
            ],
        ],
        "assertion_map"     => [
            "Oseba-write"        => "chck-oseba-write",
            "Trr-write"          => "chck-trr-write",
            "Trr-read"           => "chck-trr",
            "Telefonska-write"   => "chck-tel-write",
            "Telefonska-read"    => "chck-tel",
            "PostniNaslov-write" => "chck-pnaslov-write",
            "PostniNaslov-read"  => "chck-pnaslov",
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
