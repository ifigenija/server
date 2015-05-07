<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

/**
 * Description of Besedila
 *
 * @author rado
 */
class Besedila
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "naslov" => ["alias" => "naslov"]
        ]
    ];

}
