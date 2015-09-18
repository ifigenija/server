<?php

return [
    'service_manager' => [
        'factories' => [
            'jobmanager.service' => 'Jobs\Factory\JobManagerFactory'
        ],
    ],
    'controllers'     => [
        'invokables' => [
            'Jobs\Job' => 'Jobs\Controller\JobController',
            'Rest\job' => 'Jobs\Controller\JobRestController',
            'Jobs\ReportFiles' => 'Jobs\Controller\ReportFilesController',
        ]
    ],
    'router'          => [
        'routes' => [
            'reports'       => [
                'type'    => 'Segment',
                'options' => [
                    'route'       => '/reports/prenesi/:id',
                    'defaults'    => [
                        '__NAMESPACE__' => 'Jobs',
                        'sekcija'       => 'public',
                        'action'        => 'prenesi',
                        'controller'    => 'ReportFiles'
                    ],
                    'constraints' => ['id' => \Max\Consts::UUID],
                ]
            ]
        ]
    ],
    'console'         => [
        'router' => [
            'routes' => [
                'job-list'         => [
                    'options' => [
                        'route'    => 'job list',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action'     => 'cmdList'
                        ]
                    ]
                ],
                'job-list-running' => [
                    'options' => [
                        'route'    => 'job list-running',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action'     => 'cmdListRunning'
                        ]
                    ]
                ],
                'job-run'          => [
                    'options' => [
                        'route'    => 'job run <id>',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action'     => 'cmdRun'
                        ]
                    ]
                ],
                'job-run-all'      => [
                    'options' => [
                        'route'    => 'job runall',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action'     => 'cmdRunAll'
                        ]
                    ]
                ],
                'job-fail'         => [
                    'options' => [
                        'route'    => 'job fail <id> <error>',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action'     => 'cmdFail'
                        ]
                    ]
                ],
                'job-log'          => [
                    'options' => [
                        'route'    => 'job log <id>',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action'     => 'cmdLog'
                        ]
                    ]
                ],
                'job-reset'        => [
                    'options' => [
                        'route'    => 'job reset <id>',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action'     => 'cmdReset'
                        ]
                    ]
                ]
            ]
        ]
    ],
    'view_manager'    => [
        'template_path_stack' => [
            __DIR__ . '/../view',
        ]
    ],
    'view_helpers'    => [
        'invokables' => [
            'table' => 'Jobs\View\Helper\Table',
        ]
    ],
    'report_renderer' => [
        'template_map' => [
            'printlayout/table'    => __DIR__ . '/../templates/report/table.phtml',
            'printlayout/document' => __DIR__ . '/../templates/report/document.phtml',
            'printlayout/style'    => __DIR__ . '/../templates/report/style.css'
        ],
    ],
];