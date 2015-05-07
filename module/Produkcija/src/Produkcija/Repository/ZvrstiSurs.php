<?php

/*
 *  Licenca GPLv3
 */
namespace Produkcija\Repository;

/**
 * Description of ZvrstiSurs
 *
 * @author rado
 */
class ZvrstiSurs
  extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "ime" => ["alias" => "ime"]
        ]
    ];

}
