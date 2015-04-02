<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [
    'service_manager' => [
        'invokables' => [
            'entity.metadata.factory' => '\Max\Ann\EntityMetadataFactory'
        ]
    ],
    'controllers' => [
        'invokables' => [
            'Max\Meta' => '\Max\Controller\MetaController',
        ]
    ],
    'router' => [
        'routes' => [
            'meta' => [
                'type' => 'Literal',
                
                'may_terminate' => false,
                'options' => [
                    'route' => '/meta',
                    'child_routes' => [
                        [
                            'type' => 'Segment',
                            'options' => [
                                'route' => '/table[/:entity[/:view]]',
                                'defaults' => [
                                    'action' => 'table',
                                    'controller' => 'Max\Meta',
                                    'view' => 'default'
                                ],
                                'constraints' => [
                                    'entity' => '[A-Za-z0-9-]+',
                                    'table' => '[A-Za-z0-9-]+'
                                ],
                            ]
                        ],
                        [
                            'type' => 'Segment',
                            'options' => [
                                'route' => '/form[/:entity[/:view]]',
                                'defaults' => [
                                    'action' => 'form',
                                    'controller' => 'Max\Meta',
                                     'view' => 'default'
                                ],
                                'constraints' => [
                                    'entity' => '[A-Za-z0-9-]+'
                                ],
                            ]
                        ],
                        [
                            'type' => 'Segment',
                            'options' => [
                                'route' => '/filter[/:entity[/:view]]',
                                'defaults' => [
                                    'action' => 'filter',
                                    'controller' => 'Max\Meta',
                                     'view' => 'default'
                                ],
                                'constraints' => [
                                    'entity' => '[A-Za-z0-9-]+'
                                ],
                            ]
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
        ]
    ]
];
