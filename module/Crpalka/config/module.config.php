<?php

/*
 * Licenca GPL V3 or later
 *  
 */
return array(

    'crpalka'         => array(
        'pravila' => array(
            'pot'          => array(),
            'owningside'   => array(),
            'neowningside' => array(),
            'ident'        => array(),
        ),
    ),
    'controllers'     => array(
        'invokables' => array(
            'Crpalka\Controller\Crpalka' => 'Crpalka\Controller\CrpalkaController',
        ),
    ),
    'service_manager' => array(
        'factories'  => array(
            'crpalka.Service.Factory' => 'Crpalka\Service\CrpalkaServiceFactory',
        ),
    ),
    'doctrine'        => array(
        // Entity Manager instantiation settings
        'entitymanager' => array(
            // configuration for the `doctrine.entitymanager.orm_default` service
            'orm_dest' => array(
                // connection instance to use. The retrieved service name will
                // be `doctrine.connection.$thisSetting`
                'connection'    => 'orm_dest',
                // configuration instance to use. The retrieved service name will
                // be `doctrine.configuration.$thisSetting`
                'configuration' => 'orm_default'
            )
        ),
    ),
    'console'         => array(
        'router' => array(
            'routes' => array(
                'crpalka_precrpajvse' => array(
                    'options' => array(
                        'route'    => 'precrpajVse <entity>',
                        'defaults' => array(
                            'controller' => 'Crpalka\Controller\Crpalka',
                            'action'     => 'precrpajVse'
                        )
                    )
                ),
                'crpalka_precrpaj'    => array(
                    'options' => array(
                        'route'    => 'precrpaj <entity> <id>',
                        'defaults' => array(
                            'controller' => 'Crpalka\Controller\Crpalka',
                            'action'     => 'precrpaj'
                        )
                    )
                ),
                'crpalka_schema'      => array(
                    'options' => array(
                        'route'    => 'schema-update',
                        'defaults' => array(
                            'controller' => 'Crpalka\Controller\Crpalka',
                            'action'     => 'schemaUpdate'
                        )
                    )
                ),

            ),
        ),
    ),
);
