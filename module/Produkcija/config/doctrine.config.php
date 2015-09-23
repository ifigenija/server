<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

return [
    'doctrine' => [
        'driver' => [
            'Produkcija' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'meta',
                'paths' => [
                    __DIR__ . '/../src/Produkcija/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'Produkcija\Entity' => 'Produkcija'
                ]
            ]
        ],
    ],
    'entity_config' => [

        'Produkcija\Entity\Alternacija' => [
            'key' => 'd001',
        ],
        'Produkcija\Entity\Besedilo' => [
            'key' => 'd002',
        ],
        'Produkcija\Entity\Koproducent' => [
            'key' => 'd003'],
        'Produkcija\Entity\KoprodukcijaDelitev' => [
            'key' => 'd004'
        ],
        'Produkcija\Entity\Pogodba' => [
            'key' => 'd005'
        ],
        'Produkcija\Entity\Rekvizit' => [
            'key' => 'd006'
        ],
        'Produkcija\Entity\Sodelavec' => [
            'key' => 'd007'
        ],
        'Produkcija\Entity\TipVloge' => [
            'key' => 'd008'
        ],
        'Produkcija\Entity\Uprizoritev' => [
            'key' => 'd009'
        ],
        'Produkcija\Entity\Vloga' => [
            'key' => 'd00a'
        ],
    ]
];
