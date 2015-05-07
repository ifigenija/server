<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

/**
 * Description of Arhivalije
 *
 * @author rado
 */
class Arhivalije
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "id" => ["alias" => "id"]
        ]
    ];

}
