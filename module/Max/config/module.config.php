<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [
    'service_manager' => [
        'invokables' => [
            'entity.metadata.factory' => '\Max\Factory\EntityMetadataFactory',

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
    'controller_plugins' => [
        'invokables' => [
            'trnsl' => 'Max\Plugin\Trnsl'
        ],
    ],
    'form_elements' => [
        'invokables' => [
// elementi
            'id' => 'Max\Form\Element\Id',
            'naziv' => 'Max\Form\Element\Naziv',
            'sifra' => 'Max\Form\Element\Sifra',
            'integer' => 'Max\Form\Element\Integer',
            'decimal' => 'Max\Form\Element\Decimal',
            'multiselect' => 'Max\Form\Element\Multiselect',
            'boolcheckbox' => 'Max\Form\Element\BoolCheckbox',
            'date' => 'Max\Form\Element\Date',
            'email' => 'Max\Form\Element\Email',
            'toone' => 'Max\Form\Element\EntityToOne',
            'tomany' => 'Max\Form\Element\EntityToMany',
            'lookupSelect' => 'Max\Form\Element\LookupSelect',
            // forme
            'EntityForm' => 'Tip\Form\EntityForm'
       
        ]
    ]
];
