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
//            'Rest\EnotaPrograma'      => 'Max\Factory\RestControllerFactory',         //$$ rb verjetno ne potrebujemo, ker je superklasa
            'Rest\ProgramDela'            => 'Max\Factory\RestControllerFactory',
            'Relation\ProgramDela'        => 'Max\Factory\ToManyControllerFactory',
            'Rest\ProgramFestival'        => 'Max\Factory\RestControllerFactory',
            'Rest\ProgramGostovanje'      => 'Max\Factory\RestControllerFactory',
            'Rest\ProgramGostujoca'       => 'Max\Factory\RestControllerFactory',
            'Rest\ProgramIzjemni'         => 'Max\Factory\RestControllerFactory',
            'Rest\ProgramPonovitev'       => 'Max\Factory\RestControllerFactory',
            'Rest\ProgramPremiera'        => 'Max\Factory\RestControllerFactory',
            'Rest\TipProgramskeEnote'     => 'Max\Factory\RestControllerFactory',
            'Relation\TipProgramskeEnote' => 'Max\Factory\ToManyControllerFactory',
            'Rest\EnotaPrograma'          => 'Max\Factory\RestControllerFactory',
            'Rest\ProgramDela'            => 'Max\Factory\RestControllerFactory',
            'Rest\ProgramFestival'        => 'Max\Factory\RestControllerFactory',
            'Rest\ProgramGostovanje'      => 'Max\Factory\RestControllerFactory',
            'Rest\ProgramGostujoca'       => 'Max\Factory\RestControllerFactory',
            'Rest\ProgramIzjemni'         => 'Max\Factory\RestControllerFactory',
            'Rest\ProgramPonovitev'       => 'Max\Factory\RestControllerFactory',
            'Rest\ProgramPremiera'        => 'Max\Factory\RestControllerFactory',
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
