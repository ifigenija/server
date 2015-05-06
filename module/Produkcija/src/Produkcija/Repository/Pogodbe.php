<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

/**
 * Description of Pogodbe
 *
 * @author rado
 */
class Pogodbe
  extends \Max\Repository\AbstractMaxRepository
{   
    protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "sifra"]
        ]
    ];  
}