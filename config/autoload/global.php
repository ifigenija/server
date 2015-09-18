<?php

/**
 * Global Configuration Override
 *
 * You can use this file for overriding configuration values from modules, etc.
 * You would place values in here that are agnostic to the environment and not
 * sensitive to security.
 *
 * @NOTE: In practice, this file will typically be INCLUDED in your source
 * control, so do not include passwords or other sensitive information in this
 * file.
 */
return [
    'service_manager' => [
        'factories' => [
            'translator'                          => 'Zend\I18n\Translator\TranslatorServiceFactory',
            'Navigation'                          => 'Zend\Navigation\Service\DefaultNavigationFactory',
            'Zend\Session\Config\ConfigInterface' => 'Zend\Session\Service\SessionConfigFactory'
        ]
    ],
    'translator'      => [
        'event_manager_enabled'     => true,
        'translation_file_patterns' => [
            [
                'type'     => 'phparray',
                'base_dir' => 'language',
                'pattern'  => '%s/messages.php',
            ],
            [
                'type'     => 'phparray',
                'base_dir' => 'vendor/zendframework/zendframework/resources/languages',
                'pattern'  => '%s/Zend_Validate.php',
            ]
        ],
        'cache'                     => [
            'adapter' => [
                'name'    => 'apc',
                'options' => [
                    'ttl' => 86400
                ]
            ],
        ]
    ],
        'doctrine'        => [
        'configuration'            => [
            'orm_default' => [
                'metadata_cache'   => 'apc',
                'query_cache'      => 'apc',
                'result_cache'     => 'apc',
                'hydration_cache'  => 'apc',
                'driver'           => 'orm_default',
                'generate_proxies' => false,
            ]
        ],
        // migrations configuration
        'migrations_configuration' => array(
            'orm_default' => array(
                'directory' => 'migrations',
                'name'      => 'Doctrine Database Migrations',
                'namespace' => 'DoctrineORMModule\Migrations',
                'table'     => 'migrations',
            ),
        ),
    ],
    'view_manager'    => [
        'display_not_found_reason' => true,
        'display_exceptions'       => true,
        'doctype'                  => 'HTML5',
        'not_found_template'       => 'error/404',
        'exception_template'       => 'error/index',
        'template_map'             => [
            'layout/layout' => 'module/App/layout/layout.phtml',
            'error/404'     => 'module/App/layout/error/404.phtml',
            'error/403'     => 'module/App/layout/error/403.phtml',
            'error/index'   => 'module/App/layout/error/index.phtml',
        ]
    ],
    'translator' => [
      //  'event_manager_enabled' => true,
        'translation_file_patterns' => [
            [
                'type' => 'phparray',
                'base_dir' => 'locale',
                'pattern' => '%s/messages.php',
            ],
            [
                'type' => 'phparray',
                'base_dir' => 'locale',
                'pattern' => '%s/Zend_Validate.php',
            ]
        ],
        'cache' => [
            'adapter' => [
                'name' => 'apc',
                'options' => [
                    'ttl' => 86400
                ]
            ],
        ]
    ]
];
