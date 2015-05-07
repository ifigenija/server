<?php

/*
 *  Licenca GPLv3
 */
namespace Produkcija\Repository;

/**
 * Description of Rekviziterstva
 *
 * @author rado
 */
class Rekviziterstva
  extends \Max\Repository\AbstractMaxRepository
{   
    protected $sortOptions = [
        "default" => [
            "id" => ["alias" => "id"]
        ]
    ];  
}