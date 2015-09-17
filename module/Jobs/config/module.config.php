<?php

return [
    'service_manager' => [
        'factories' => [
            'jobmanager.service' => 'Jobs\Factory\JobManagerFactory'
        ],
    ],
    'controllers' => [
        'invokables' => [
            'Jobs\Job' => 'Jobs\Controller\JobController',
            'Rest\job' => 'Jobs\Controller\JobRestController',
        ]
    ],
    'console' => [
        'router' => [
            'routes' => [
                'job-list' => [
                    'options' => [
                        'route' => 'job list',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action' => 'cmdList'
                        ]
                    ]
                ],
                'job-list-running' => [
                    'options' => [
                        'route' => 'job list-running',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action' => 'cmdListRunning'
                        ]
                    ]
                ],
                'job-run' => [
                    'options' => [
                        'route' => 'job run <id>',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action' => 'cmdRun'
                        ]
                    ]
                ],
                'job-run-all' => [
                    'options' => [
                        'route' => 'job runall',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action' => 'cmdRunAll'
                        ]
                    ]
                ],
                'job-fail' => [
                    'options' => [
                        'route' => 'job fail <id> <error>',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action' => 'cmdFail'
                        ]
                    ]
                ],
                'job-log' => [
                    'options' => [
                        'route' => 'job log <id>',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action' => 'cmdLog'
                        ]
                    ]
                ],
                'job-reset' => [
                    'options' => [
                        'route' => 'job reset <id>',
                        'defaults' => [
                            'controller' => '\Jobs\Job',
                            'action' => 'cmdReset'
                        ]
                    ]
                ]
            ]
        ]
    ],
    'view_manager' => [
        'template_path_stack' => [
            __DIR__ . '/../view',
        ]
    ]
];