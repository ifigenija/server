<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

/**
 * Description of Funkcije
 *
 * @author rado
 */
class Funkcije
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "naziv" => ["alias" => "naziv"]
        ]
    ];

}
