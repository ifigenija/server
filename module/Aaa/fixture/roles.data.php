<?php

return [

    [
        'name' => 'administrator-dostopov',
        'description' => 'Uporavljanje uporabnikov, skupin, vlog in dovoljenj.',
        'children' => [],
        'permissions' => []
    ],
    [
        'name' => 'ifi-vse',
        'description' => 'Polni dostop do vsega v aplikaciji.',
        'children' => [],
        'permissions' => []
    ],
    [
        'name' => 'vfs-admin',
        'description' => 'Omogoča polni dostop do naloženih dokumentov in datotek',
        'children' => [
        ],
        'permissions' => []
    ]
];
