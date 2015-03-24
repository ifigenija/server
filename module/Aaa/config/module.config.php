<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [
    'doctrine' => [
        'driver' => [
            'aaa' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'apc',
                'paths' => [
                    __DIR__ . '/../src/Aaa/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'Aaa\Entity' => 'aaa'
                ]
            ]
        ],
        'authentication' => [
            'orm_default' => [
                'object_manager' => 'Doctrine\ORM\EntityManager',
                'identity_class' => 'Aaa\Entity\User',
                'identity_property' => 'username',
                'credential_property' => 'password',
                'credential_callable' => 'Aaa\Service\AaaService::checkPassword'
            ]
        ]
    ],
    'service_manager' => [
        'factories' => [
            'rbac_strategy' => 'Aaa\Factory\JsonStrategyFactory',
            'Zend\Authentication\AuthenticationService' => 'Aaa\Factory\AuthenticationServiceFactory',
        ]
    ],
    'controllers' => [
        'invokables' => [
            'Aaa\User' => 'Aaa\Controller\UserController',
            'Aaa\Role' => 'Aaa\Controller\RoleController',
            'Aaa\Rpc' => 'Aaa\Controller\RpcController',
            'Aaa\Permission' => 'Aaa\Controller\PermissionController'
        ]
    ],
    'router' => [
        'routes' => [
            'rpc' => [
                'child_routes' => [
                    [
                        'type' => 'Literal',
                        'options' => [
                            'route' => '/aaa',
                            'defaults' => [
                                'action' => 'login',
                                'controller' => 'Aaa\User',
                            ],
                            'constraints' => [
                                'action' => 'aaa|logout'
                            ],
                        ]
                    ]
                ],
            ]
        ],
    ],
    'console' => [
        'router' => [
            'routes' => [
                'user-reset-password' => [
                    'options' => [
                        'route' => 'user resetpass <username>',
                        'defaults' => [
                            'controller' => 'Aaa\User',
                            'action' => 'password'
                        ]
                    ]
                ],
                'user-enable-disable' => [
                    'options' => [
                        'route' => 'user (enable|disable):mode <username>',
                        'defaults' => [
                            'controller' => 'Aaa\User',
                            'action' => 'enable'
                        ]
                    ]
                ],
                'user-update-cache' => [
                    'options' => [
                        'route' => 'user updateCache',
                        'defaults' => [
                            'controller' => 'Aaa\User',
                            'action' => 'updateCache'
                        ]
                    ]
                ]
            ]
        ]
    ],
    'form_elements' => [
        'invokables' => [
// elementi
            // forme           
            'Aaa-UserFieldset' => 'Aaa\Form\UserFieldset',
            'Aaa-GroupFieldset' => 'Aaa\Form\GroupFieldset',
            'Aaa-RoleFieldset' => 'Aaa\Form\RoleFieldset',
            'Aaa-PermissionFieldset' => 'Aaa\Form\PermissionFieldset'
        ]
    ]
];
