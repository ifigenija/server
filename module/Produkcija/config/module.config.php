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
        ],
        'factories'  => [
            'Rest\pogodba'               => 'Max\Factory\RestControllerFactory',
            'Relation\pogodba'           => 'Max\Factory\ToManyControllerFactory',
            'Rest\alternacija'           => 'Max\Factory\RestControllerFactory',
            'Rest\funkcija'              => 'Max\Factory\RestControllerFactory',
            'Relation\funkcija'          => 'Max\Factory\ToManyControllerFactory',
            'Rest\rekvizit'              => 'Max\Factory\RestControllerFactory',
            'Rest\rekviziterstvo'        => 'Max\Factory\RestControllerFactory',
            'Rest\zvrstSurs'             => 'Max\Factory\RestControllerFactory',
            'Rest\zvrstUprizoritve'      => 'Max\Factory\RestControllerFactory',
            'Rest\besedilo'              => 'Max\Factory\RestControllerFactory',
            'Rest\arhivalija'            => 'Max\Factory\RestControllerFactory',
            'Rest\uprizoritev'           => 'Max\Factory\RestControllerFactory',
            'Rest\produkcijskaHisa'      => 'Max\Factory\RestControllerFactory',
            'Rest\zaposlitev'            => 'Max\Factory\RestControllerFactory',
            'Rest\produkcijaDelitev'     => 'Max\Factory\RestControllerFactory',
            'Relation\produkcijaDelitev' => 'Max\Factory\ToManyControllerFactory',
            'Rest\tipFunkcije'           => 'Max\Factory\RestControllerFactory',
        ],
    ],
    'router'          => [
        'routes' => [
        ],
    ],
    'console'         => [
        'router' => [
            'routes' => [
            ]
        ]
    ],
    'form_elements'   => [
        'invokables' => [
        ]
    ]
];
