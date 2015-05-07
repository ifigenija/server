<?php

/*
 *  Licenca GPLv3
 */
namespace Produkcija\Repository;

/**
 * Description of Alternacije
 *
 * @author rado
 */
class Alternacije
        extends \Max\Repository\AbstractMaxRepository
{
    protected $sortOptions = [
        "default" => [
            "id" => ["alias" => "id"]
        ]
    ];  
}
