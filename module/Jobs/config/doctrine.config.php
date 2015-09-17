<?php
return [
    'doctrine' => [
        'driver' => [
            'Jobs_module' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'apc',
                'paths' => [
                    __DIR__ . '/../src/Jobs/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'Jobs\Entity' => 'Jobs_module'
                ]
            ]
        ],
    ]
];