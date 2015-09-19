<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


return [
    'report_renderer' => [
        'template_path_stack' => [
            __DIR__ . '/../templates/report'
        ]
    ],
    'report_template_config' => [
        'program-dela' => [
            'orientation' => 'portrait',
            'size' => 'A4',
            'margins' => [5,5,5,5]
        ]
    ],
    'service_manager' => [
        'factories'  => [
        ],
        'invokables' => [
            'enotaprograma.rpc.service' => 'ProgramDela\Rpc\EnotaProgramaRpcService',
            'enotaprograma.service'     => 'ProgramDela\Service\EnotaProgramaService',
            'programdela.rpc.service'   => 'ProgramDela\Rpc\ProgramDelaRpcService',
            'programdela.service'       => 'ProgramDela\Service\ProgramDelaService',
        ],
    ],
    'controllers'     => [
        'invokables' => [
            'Rpc\programdela' => 'ProgramDela\Controller\RpcController',
        ],
        'factories'  => [
//            'Rest\EnotaPrograma'      => 'Max\Factory\RestControllerFactory',         //rb - ne potrebujemo, ker je superklasa
//            'Relation\EnotaPrograma'         => 'Max\Factory\ToManyControllerFactory', //rb - ne potrebujemo, ker je superklasa
            'Rest\DrugiVir'                      => 'Max\Factory\RestControllerFactory',
            'Rest\EnotaPrograma'                 => 'Max\Factory\RestControllerFactory',
            'Rest\ProgramDela'                   => 'Max\Factory\RestControllerFactory',
            'Relation\ProgramDela'               => 'Max\Factory\ToManyControllerFactory',
            'Rest\ProgramFestival'               => 'Max\Factory\RestControllerFactory',
            'Relation\ProgramFestival'           => 'Max\Factory\ToManyControllerFactory',
            'Rest\ProgramGostovanje'             => 'Max\Factory\RestControllerFactory',
            'Relation\ProgramGostovanje'         => 'Max\Factory\ToManyControllerFactory',
            'Rest\ProgramGostujoca'              => 'Max\Factory\RestControllerFactory',
            'Relation\ProgramGostujoca'          => 'Max\Factory\ToManyControllerFactory',
            'Rest\ProgramIzjemni'                => 'Max\Factory\RestControllerFactory',
            'Relation\ProgramIzjemni'            => 'Max\Factory\ToManyControllerFactory',
            'Rest\ProgramPonovitev'              => 'Max\Factory\RestControllerFactory',
            'Relation\ProgramPonovitev'          => 'Max\Factory\ToManyControllerFactory',
            'Rest\ProgramPonovitevPrejsnjih'     => 'Max\Factory\RestControllerFactory',
            'Relation\ProgramPonovitevPrejsnjih' => 'Max\Factory\ToManyControllerFactory',
            'Rest\ProgramPonovitevPremiere'      => 'Max\Factory\RestControllerFactory',
            'Relation\ProgramPonovitevPremiere'  => 'Max\Factory\ToManyControllerFactory',
            'Rest\ProgramPremiera'               => 'Max\Factory\RestControllerFactory',
            'Relation\ProgramPremiera'           => 'Max\Factory\ToManyControllerFactory',
            'Rest\ProgramRazno'                  => 'Max\Factory\RestControllerFactory',
            'Relation\ProgramRazno'              => 'Max\Factory\ToManyControllerFactory',
            'Rest\TipProgramskeEnote'            => 'Max\Factory\RestControllerFactory',
            'Relation\TipProgramskeEnote'        => 'Max\Factory\ToManyControllerFactory',
            'Rest\ProgramskaEnotaSklopa'         => 'Max\Factory\RestControllerFactory',
            'Rest\PostavkaCDve'                  => 'Max\Factory\RestControllerFactory',
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
