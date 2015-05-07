<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

/**
 * Description of ZvrstiUprizoritve
 *
 * @author rado
 */
class ZvrstiUprizoritve
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "ime" => ["alias" => "ime"]
        ]
    ];

}
