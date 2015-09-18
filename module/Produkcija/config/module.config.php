<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [

    'service_manager' => [
        'factories'  => [
        ],
        'invokables' => [
            'alternacija.rpc.service' => 'Produkcija\Rpc\AlternacijaRpcService',
        ],
    ],
    'controllers'     => [
        'invokables' => [
            'Rpc\produkcija' => 'Produkcija\Controller\RpcController',
        ],
        'factories'  => [
            'Rest\pogodba'               => 'Max\Factory\RestControllerFactory',
            'Relation\pogodba'           => 'Max\Factory\ToManyControllerFactory',
            'Rest\alternacija'           => 'Max\Factory\RestControllerFactory',
            'Relation\alternacija'       => 'Max\Factory\ToManyControllerFactory',
            'Rest\funkcija'              => 'Max\Factory\RestControllerFactory',
            'Relation\funkcija'          => 'Max\Factory\ToManyControllerFactory',
            'Rest\rekvizit'              => 'Max\Factory\RestControllerFactory',
            'Relation\rekvizit'          => 'Max\Factory\ToManyControllerFactory',
            'Rest\rekviziterstvo'        => 'Max\Factory\RestControllerFactory',
            'Rest\zvrstSurs'             => 'Max\Factory\RestControllerFactory',
            'Rest\zvrstUprizoritve'      => 'Max\Factory\RestControllerFactory',
            'Rest\besedilo'              => 'Max\Factory\RestControllerFactory',
            'Rest\arhivalija'            => 'Max\Factory\RestControllerFactory',
            'Rest\uprizoritev'           => 'Max\Factory\RestControllerFactory',
            'Relation\uprizoritev'       => 'Max\Factory\ToManyControllerFactory',
            'Rest\produkcijskaHisa'      => 'Max\Factory\RestControllerFactory',
            'Relation\produkcijskaHisa'  => 'Max\Factory\ToManyControllerFactory',
            'Rest\zaposlitev'            => 'Max\Factory\RestControllerFactory',
            'Relation\zaposlitev'        => 'Max\Factory\ToManyControllerFactory',
            'Rest\produkcijaDelitev'     => 'Max\Factory\RestControllerFactory',
            'Relation\produkcijaDelitev' => 'Max\Factory\ToManyControllerFactory',
            'Rest\tipFunkcije'           => 'Max\Factory\RestControllerFactory',
            'Rest\strosekUprizoritve'    => 'Max\Factory\RestControllerFactory',
            'Rest\VrstaStroska'          => 'Max\Factory\RestControllerFactory',
            'Rest\AvtorBesedila'         => 'Max\Factory\RestControllerFactory',
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
