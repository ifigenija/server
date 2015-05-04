<?php

/**
 * LicencOa GPLv3 or later
 */

namespace App\Repository;

/**
 * Description of Drzave
 *
 * @author boris
 */
class Osebe
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "sifra"]
        ]
    ];
    
}
