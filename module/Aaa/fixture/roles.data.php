<?php

return [

    [
        'name' => 'beri-vse',
        'description' => 'Polni dostop do vsega v aplikaciji.',
        'permissions' => []
    ],
    [
        'name' => 'administrator-dostopov',
        'description' => 'Uporavljanje uporabnikov, skupin, vlog in dovoljenj.',
        'permissions' => []
    ],
    [
        'name' => 'anonimous',
        'description' => 'Vloga za javne - neavtenticirane uporabnike',
        'permissions' => ['drzava-default', 'popa-default']
    ],
    [
        'name' => 'ifi-vse',
        'description' => 'Polni dostop do vsega v aplikaciji.',
        'children' => [],
        'permissions' => []
    ],
   
];
