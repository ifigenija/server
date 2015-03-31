<?php


return [
    [
        'name' => 'Administrator',
        'surname' => '',
        'email' => 'admin@max.si',
        'username' => 'admin',
        'password' => uniqid(),
        'roles' => ['tip-vse', 'prijavljen-uporabnik', 'administrator-dostopov']
    ],
    [
        'name' => 'Sistemski',
        'surname' => 'Uporabnik',
        'email' => 'rootmail@max.si',
        'username' => 'console',
        'password' => uniqid() . uniqid(),
        'roles' => ['tip-vse', 'prijavljen-uporabnik', 'administrator-dostopov']
    ],
        [
        'name' => 'Anonimni',
        'surname' => 'Uporabnik',
        'email' => 'noreply@max.si',
        'username' => 'anonymous',
        'password' => uniqid() . uniqid(),
        'roles' => ['tip-vse', 'prijavljen-uporabnik', 'administrator-dostopov']
    ]
];
