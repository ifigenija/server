<?php

return [
    [
        'name' => 'kravaXXX',
        'type' => 'color',
        'perUser' => true
    ],
    [
        'name' => 'privzetInspicient',
        'type' => 'entity',
        
        'targetEntity' => '\Sodelavci\Entity\Sodelavec'
    ],
    [
        'name' => 'dogodek-status',
        'type' => 'map',
        'public' => true, 
         
        'description' => 'Tabela statusa dogodkov',
        'tags' => ['a', 'b', 'c'],
        'defaultValue' => [
            ['key' => 'planiran', 'value' => 'Dolgoročno', 'tag' => ''],
            ['key' => 'planiran', 'value' => 'Planiran', 'tag' => ''],
            ['key' => 'fiksiran', 'value' => 'Fiksiran', 'tag' => '',],
            ['key' => 'fiksiran', 'value' => 'Zaključen', 'tag' => '',],
        ],
    ],
];
