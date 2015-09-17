<?php

/*
 *  Licenca GPLv3
 */

namespace App\Filter;

/**
 * Description of DecorateEntity
 *
 * @author boris
 */
class StripEntity

{
    public function filter($entity)
    {
        $parts = explode('\\', $class);
        return  array_pop($parts);
    }

}
