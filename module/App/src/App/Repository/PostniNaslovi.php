<?php

/**
 * Licenca GPLv3 or later
 */

namespace App\Repository;

/**
 * Description of PostniNaslovi
 *
 * @author rado
 */
class PostniNaslovi
        extends \Max\Repository\AbstractMaxRepository
{
    
    protected $sortOptions = [
        "default" => [
            "naziv" => ["alias" => "naziv"]
        ]
    ];
    
}
