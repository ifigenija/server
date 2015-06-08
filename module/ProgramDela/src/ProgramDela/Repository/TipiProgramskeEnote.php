<?php

/*
 *  Licenca GPLv3
 */
namespace ProgramDela\Repository;

/**
 * Description of TipiProgramskeEnote
 *
 * @author rado
 */
class TipiProgramskeEnote
        extends \Max\Repository\AbstractMaxRepository
{
     protected $sortOptions = [
        "default" => [
            "id" => ["alias" => "p.id"]
        ],
        "vse" => [
            "id" => ["alias" => "p.id"]
        ],
    ];  
}
