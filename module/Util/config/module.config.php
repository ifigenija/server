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
    'controllers'     => [
        'invokables' => [
            'Util\Install'       => 'Util\Controller\InstallController',
            'Util\Migrate'       => 'Util\Controller\MigrateController',
            'Util\ImportBesedil' => 'Util\Controller\ImportBesedilController',
        ]
    ],
    'router'          => [
        'routes' => [
        ],
    ],
    'console'         => [
        'router' => [
            'routes' => [
                'populate'      => [
                    'options' => [
                        'route'    => 'populate',
                        'defaults' => [
                            'controller' => 'Util\Install',
                            'action'     => 'populate'
                        ]
                    ]
                ],
                'populateTest'  => [
                    'options' => [
                        'route'    => 'populateTest',
                        'defaults' => [
                            'controller' => 'Util\Install',
                            'action'     => 'populateTest'
                        ]
                    ]
                ],
                'migrate'       => [
                    'options' => [
                        'route'    => 'migrate <db>',
                        'defaults' => [
                            'controller' => 'Util\Migrate',
                            'action'     => 'migrate'
                        ]
                    ]
                ],
                'importBesedil' => [
                    'options' => [
                        'route'    => 'importBesedil <csvfile>',
                        'defaults' => [
                            'controller' => 'Util\ImportBesedil',
                            'action'     => 'importBesedil'
                        ]
                    ]
                ],
            ]
        ]
    ],
    'fixtures'        => [
        __DIR__ . '/../fixture'
    ],
    'test_fixtures'   => [
        __DIR__ . '/../testFixture'
    ]
];
