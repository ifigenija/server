<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [

    'service_manager' => [
        'factories' => [
        ]
    ],
    'controllers' => [
        'invokables' => [
            'Util\Install' => 'Util\Controller\InstallController',
        ]
    ],
    'router' => [
        'routes' => [
        ],
    ],
    'console' => [
        'router' => [
            'routes' => [
                'populate' => [
                    'options' => [
                        'route' => 'populate',
                        'defaults' => [
                            'controller' => 'Util\Install',
                            'action' => 'populate'
                        ]
                    ]
                ],
                'populateTest' => [
                    'options' => [
                        'route' => 'populateTest',
                        'defaults' => [
                            'controller' => 'Util\Install',
                            'action' => 'populateTest'
                        ]
                    ]
                ],
            ]
        ]
    ],
    'form_elements' => [
        'invokables' => [
// elementi
        ]
    ],
    'fixtures' => [
        __DIR__ . '/../fixture'
    ],
    'test_fixtures' => [
        __DIR__ . '/../testFixture'
    ]
];
