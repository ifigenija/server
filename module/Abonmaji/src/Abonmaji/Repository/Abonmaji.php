<?php

/**
 * Licenca GPLv3 or later
 */

namespace Abonmaji\Repository;

/**
 * 
 *  Description of Abonmaji
 * 
 * @author rado
 */


class Abonmaji
        extends \Max\Repository\AbstractMaxRepository
{   
    protected $sortOptions = [
        "default" => [
            "ime" => ["alias" => "ime"]
        ]
    ];  
}