<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [
    'service_manager' => [
        'invokables' => [
            'entity.metadata.factory' => '\Max\Annotation\EntityMetadataFactory'
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
                                'route' => '/table[/:entity[/:table]]',
                                'defaults' => [
                                    'action' => 'tableMeta',
                                    'controller' => 'Max\Meta',
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
                                'route' => '/form[/:entity[/:form]]',
                                'defaults' => [
                                    'action' => 'formMeta',
                                    'controller' => 'Max\Meta',
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
