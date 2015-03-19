<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [
    'doctrine' => [
        'driver' => [
            'aaa_module' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'apc',
                'paths' => [
                    __DIR__ . '/../src/Aaa/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'Aaa\Entity' => 'aaa_module'
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
    'view_manager' => [
        'template_path_stack' => [
            __DIR__ . '/../view'
        ]
    ],
    'controllers' => [
        'invokables' => [
            'Aaa\User' => 'Aaa\Controller\UserController',
            'Aaa\Role' => 'Aaa\Controller\RoleController',
            'Aaa\Group' => 'Aaa\Controller\GroupController',
            'Aaa\Permission' => 'Aaa\Controller\PermissionController'
        ]
    ],
    'zfc_rbac' => include __DIR__ . '/rbac.config.php',
    'router' => [
        'routes' => [
            'login' => [
                'type' => 'Segment',
                'options' => [
                    'route' => '/login[/:action]',
                    'defaults' => [
                        'action' => 'login',
                        'controller' => 'Aaa\User',
                    ],
                    'constraints' => [
                        'action' => 'login|logout'
                    ],
                ]
            ],
            'changepass' => [
                'type' => 'Literal',
                'options' => [
                    'route' => '/changepass',
                    'defaults' => [
                        'controller' => 'Aaa\User',
                        'action' => 'changePassword'
                    ]
                ],
            ],
            'aaa' => [
                'type' => 'Segment',
                'options' => [
                    'route' => '/aaa/:controller[/:action][/:id]',
                    'constraints' => [
                        'controller' => implode('|', [
                            'Group',
                            'User',
                            'Role',
                            'Permission',
                        ]),
                        'action' => implode('|', [
                            'dodaj',
                            'urediDovoljenja',
                            'uredi',
                            'pregled',
                            'brisi',
                            'index',
                            'group',
                            'odstraniUporabnika',
                            'odstraniVlogo',
                            'dodajUporabnika',
                            'dodajVlogo',
                            'updateCache',
                        ]),
                        'id' => \Aaa\UUID
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Aaa',
                        'controller' => 'User',
                        'action' => 'index'
                    ],
                ]
            ],
            'acljson' => [
                'type' => 'Literal',
                'options' => [
                    'route' => '/aaa/acljson'
                ],
                'may_terminate' => false,
                'child_routes' => [
                    'group' => [
                        'type' => 'Literal',
                        'options' => [
                            'route' => '/groups',
                            'defaults' => [
                                'controller' => 'Group',
                                'action' => 'getGroupList'
                            ]
                        ]
                    ],
                    'user' => [
                        'type' => 'Literal',
                        'options' => [
                            'route' => '/users',
                            'defaults' => [
                                'controller' => 'User',
                                'action' => 'getUserList'
                            ]
                        ]
                    ]
                ]
            ],
        ]
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
                'user-setgroup-removegroup' => [
                    'options' => [
                        'route' => 'user (setgroup|removegroup):mode <username> <group>',
                        'defaults' => [
                            'controller' => 'Aaa\User',
                            'action' => 'group'
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
