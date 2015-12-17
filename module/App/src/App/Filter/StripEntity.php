<?php

/*
 *  Licenca GPLv3
 */

namespace App\Filter;

/**
 * Description of StripEntity
 *
 * @author boris
 */
class StripEntity

{
    public function filter($class)
    {
        $parts = explode('\\', $class);
        return  array_pop($parts);
    }

}
