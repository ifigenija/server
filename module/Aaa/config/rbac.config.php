<?php

return [
    'guards' => [
        'ZfcRbac\Guard\RouteGuard' => [
            'login' => ['*'],
            'changepass' => ['prijavljen-uporabnik'],
            'aaa' => ['administrator-dostopov'],
            'acljson' => ['prijavljen-uporabnik']
        ]        
    ]
];
