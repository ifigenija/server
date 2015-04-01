<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

return [
    'doctrine' => [
        'driver' => [
            'Prodaja' => [
                'class' => 'Doctrine\ORM\Mapping\Driver\AnnotationDriver',
                'cache' => 'apc',
                'paths' => [
                    __DIR__ . '/../src/Prodaja/Entity'
                ]
            ],
            'orm_default' => [
                'drivers' => [
                    'Prodaja\Entity' => 'Prodaja'
                ]
            ]
        ],
    ],
    'entity_config' => [
        'Prodaja\Entity\Kupec' => [
            'key' => 'c001',
        ],
        'Prodaja\Entity\NacinPlacila' => [
            'key' => 'c002'
        ],
        'Prodaja\Entity\PlacilniInstrument' => [
            'key' => 'c003'
        ],
        'Prodaja\Entity\PodrocjeSedenja' => [
            'key' => 'c004',
        ],
        'Prodaja\Entity\PostavkaRacuna' => [
            'key' => 'c005'
        ],
        'Prodaja\Entity\ProdajaPredstave' => [
            'key' => 'c006'
        ],
        'Prodaja\Entity\ProdanSedez' => [
            'key' => 'c006'
        ],
        'Prodaja\Entity\Prostor' => [
            'key' => 'c007'
        ],
        'Prodaja\Entity\Racun' => [
            'key' => 'c008'
        ],
        'Prodaja\Entity\RazpisanSedez' => [
            'key' => 'c009'
        ],
        'Prodaja\Entity\Rezervacija' => [
            'key' => 'c00a'
        ],
        'Prodaja\Entity\Sedez' => [
            'key' => 'c00b'
        ],
        'Prodaja\Entity\Sedez' => [
            'key' => 'c00c'
        ],
        'Prodaja\Entity\SedezniRed' => [
            'key' => 'c00d'
        ],
        'Prodaja\Entity\VrstaSedezev' => [
            'key' => 'c00e'
        ],
    ],
];
