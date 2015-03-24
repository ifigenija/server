<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [
    'doctrine' => [
        'driver' => [
            'ifiBase' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'apc',
                'paths' => [
                    __DIR__ . '/../src/IfiBase/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'IfiBase\Entity' => 'ifiBase'
                ]
            ]
        ],
        'authentication' => [
            'orm_default' => [
                'object_manager' => 'Doctrine\ORM\EntityManager',
                'identity_class' => 'Aaa\Entity\User',
                'identity_property' => 'username',
                'credential_property' => 'password',
                'credential_callable' => 'Aaa\Entity\User::checkPassword'
            ]
        ]
    ],
    'service_manager' => [
        'factories' => [
            'Rbac\Rbac' => 'Aaa\Factory\RbacFactory',
            'rbac_strategy' => 'Aaa\Factory\AcceptHeaderStrategyFactory',
            'Zend\Authentication\AuthenticationService' => 'Aaa\Factory\AuthenticationServiceFactory',
        ]
    ],
  
    'controllers' => [
        'invokables' => [
        ]
    ],
    'router' => [
        'routes' => [
            'rpc' => [
                'type' => 'Literal',
                'options' => [
                    'route' => '/rpc'
                ],
                'may_terminate' => false,
                'child_routes' => [
                    'settings' => [
                        'type' => 'Literal',
                        'options' => [
                            'route' => '/settings',
                            'defaults' => [
                                'controller' => 'IfiRpc',
                                'action' => 'settings'
                            ]
                        ]
                    ]
                    
                ]
            ],
        ]
    ],
    'form_elements' => [
        'invokables' => [
            
        ]
    ]
];
