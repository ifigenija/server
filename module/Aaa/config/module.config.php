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
            'Rest\User' => 'Max\Factory\RestControllerFactory',
            'Rest\Role' => 'Max\Factory\RestControllerFactory',
            'Rest\Permission' => 'Max\Factory\RestControllerFactory'
        ],
        'invokables' => [
            'Aaa\Rpc' => 'Aaa\Controller\RpcController',
            'Aaa\Cli' => 'Aaa\Controller\CliController',
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
    'console' => [
        'router' => [
            'routes' => [
                'user-password' => [
                    'options' => [
                        'route' => 'user resetpass <username> <password>',
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
                        'route' => 'user grant <username> <role>',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action' => 'grant'
                        ]
                    ]
                ],
                'user-revoke' => [
                    'options' => [
                        'route' => 'user revoke <username> <role>',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action' => 'revoke'
                        ]
                    ]
                ],
                'user-list' => [
                    'options' => [
                        'route' => '(username|role):what list [<name>] [--role=<role>] [--user=<user>]',
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
