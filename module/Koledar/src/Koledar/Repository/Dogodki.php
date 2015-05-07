<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Repository;

/**
 * Description of Dogodki
 *
 * @author rado
 */
class Dogodki
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "id" => ["alias" => "id"]
        ]
    ];

}
