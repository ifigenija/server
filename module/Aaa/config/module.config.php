<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [
    'service_manager' => [
        'factories'  => [
            'rbac_strategy'                             => '\Aaa\Factory\JsonStrategyFactory',
            'Zend\Authentication\AuthenticationService' => 'Aaa\Factory\AuthenticationServiceFactory',
            'Rbac\Rbac'                                 => 'Aaa\Factory\RbacFactory',
        ],
        'invokables' => [
            'auth.rpc.service' => 'Aaa\Rpc\AuthRpcService',
            'user.rpc.service' => 'Aaa\Rpc\UserRpcService',
            'role.rpc.service' => 'Aaa\Rpc\RoleRpcService',
        ]
    ],
    'controllers'     => [
        'factories'  => [
            'Rest\User'           => 'Max\Factory\RestControllerFactory',
            'Relation\User'       => 'Max\Factory\ToManyControllerFactory',
            'Rest\Role'           => 'Max\Factory\RestControllerFactory',
            'Relation\Role'       => 'Max\Factory\ToManyControllerFactory',
            'Rest\Permission'     => 'Max\Factory\RestControllerFactory',
            'Relation\Permission' => 'Max\Factory\ToManyControllerFactory',
        ],
        'invokables' => [
            'Rpc\aaa' => 'Aaa\Controller\RpcController',
            'Aaa\Cli' => 'Aaa\Controller\CliController',
            'App\Cli' => 'App\Controller\CliController',
        ],
    ],
    'console'         => [
        'router' => [
            'routes' => [
                'user-password' => [
                    'options' => [
                        'route'    => 'user resetpass <username> <password>',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action'     => 'password'
                        ]
                    ]
                ],
                'user-enable'   => [
                    'options' => [
                        'route'    => 'user enable <username>',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action'     => 'enable'
                        ]
                    ]
                ],
                'user-disable'  => [
                    'options' => [
                        'route'    => 'user disable <username>',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action'     => 'disable'
                        ]
                    ]
                ],
                'user-grant'    => [
                    'options' => [
                        'route'    => 'user grant <username> <role>',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action'     => 'grant'
                        ]
                    ]
                ],
                'user-revoke'   => [
                    'options' => [
                        'route'    => 'user revoke <username> <role>',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action'     => 'revoke'
                        ]
                    ]
                ],
                'user-list'     => [
                    'options' => [
                        //  --role / --user sta spremenjena v --rolename / --username, ker se user/role besedi uporabljata že levo v (user|role)
                        //  drugače ne deluje
                        //      spremenil tudi --rolename=<rolename>      v le --rolename=  (in podobno pri username), 
                        //      ker je ta krajša oblika glede na dokumentacijo podprto (isto delovanje)
                        'route'    => '(user|role):what list [--rolename=] [--username=]',
                        'defaults' => [
                            'controller' => 'Aaa\Cli',
                            'action'     => 'list'
                        ]
                    ]
                ],
                'matica-create'     => [
                    'options' => [
                        'route'    => 'matica [--naziv=]',
                        'defaults' => [
                            'controller' => 'App\Cli',
                            'action'     => 'createMatico'
                        ]
                    ]
                ],
            ]
        ]
    ],
    'session'         => array(
        'config'  => array(
            'class'   => 'Zend\Session\Config\SessionConfig',
            'options' => array(
                'name' => 'ifigenija',
            ),
        ),
        'storage' => 'Zend\Session\Storage\SessionArrayStorage'
    ),
    'fixtures'        => [
        __DIR__ . '../fixture'
    ]
];
