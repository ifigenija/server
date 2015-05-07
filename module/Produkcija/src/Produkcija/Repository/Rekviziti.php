<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

/**
 * Description of Rekviziti
 *
 * @author rado
 */
class Rekviziti
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "ime" => ["alias" => "ime"]
        ]
    ];

}
