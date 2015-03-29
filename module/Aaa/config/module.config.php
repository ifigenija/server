<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [
    'service_manager' => [
        'factories' => [
            'rbac_strategy' => '\Aaa\Factory\JsonStrategyFactory',
            'Zend\Authentication\AuthenticationService' => 'Aaa\Factory\AuthenticationServiceFactory',
        ]
    ],
    'controllers' => [
        'factories' => [
            'Aaa\User' => 'Max\Factories\RestControllerFactorie',
            'Aaa\Role' => 'Aaa\Controller\RoleController',
            'Aaa\Permission' => 'Aaa\Controller\PermissionController'
        ],
        'invokables' => [
            'Aaa\Rpc' => 'Aaa\Controller\RpcController',
        ]
    ],
    'rest_controller_config' => [
        'Aaa\User' => [
            'hydrator' => [
                
            ],
            'lists' => [
                'default' => [ 
                    
                ]
            ],            
        ],
        'Aaa\Role' => [],
        'Aaa\Permission' => [],
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
                'user-password' => [
                    'options' => [
                        'route' => 'user pass <username>',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action' => 'password'
                        ]
                    ]
                ],
                'user-enable' => [
                    'options' => [
                        'route' => 'user enable <username>',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action' => 'enable'
                        ]
                    ]
                ],
                'user-disable' => [
                    'options' => [
                        'route' => 'user disable <username>',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action' => 'disable'
                        ]
                    ]
                ],
                'user-grant' => [
                    'options' => [
                        'route' => 'user grant <role>',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action' => 'enable'
                        ]
                    ]
                ],
                'user-revoke' => [
                    'options' => [
                        'route' => 'user revoke <role>',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action' => 'disable'
                        ]
                    ]
                ],                
                'user-list' => [
                    'options' => [
                        'route' => '(user|role):what list <name> [--role=:role] [--user=:user] ',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action' => 'list'
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
    ],
    'fixtures' => [
        __DIR__ . '../fixture'
    ]
];
