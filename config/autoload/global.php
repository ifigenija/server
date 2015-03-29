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
            'translator' => 'Zend\I18n\Translator\TranslatorServiceFactory',
            'Navigation' => 'Zend\Navigation\Service\DefaultNavigationFactory'
        ]
    ],
    'translator' => [
        'event_manager_enabled' => true,
        'translation_file_patterns' => [
            [
                'type' => 'phparray',
                'base_dir' => 'language',
                'pattern' => '%s/messages.php',
            ],
            [
                'type' => 'phparray',
                'base_dir' => 'vendor/zendframework/zendframework/resources/languages',
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
    ],
    'view_manager' => [
        'display_not_found_reason' => true,
        'display_exceptions' => true,
        'doctype' => 'HTML5',
        'not_found_template' => 'error/404',
        'exception_template' => 'error/index',
        'template_map' => [
            'layout/layout' => 'layout/fragment.phtml',
            'layout/requireconfig' => 'layout/requireconfig.phtml',
            'layout/stoposto' => 'layout/stoposto.phtml',
            'layout/appstart' => 'layout/appstart.phtml',
            'layout/print' => 'layout/print.phtml',
            'error/404' => 'layout/error/404.phtml',
            'error/403' => 'layout/error/403.phtml',
            'error/index' => 'layout/error/index.phtml',
        ]
    ],
    'zfc_rbac' => [
        'protection_policy' => \ZfcRbac\Guard\GuardInterface::POLICY_ALLOW,
        'guest_role' => 'guest',
        'role_provider' => [
            'ZfcRbac\Role\ObjectRepositoryRoleProvider' => [
                'object_manager' => 'doctrine.entitymanager.orm_default',
                'class_name' => 'Aaa\Entity\Role',
                'role_name_property' => 'name'
            ]
        ]
    ]
    
];
