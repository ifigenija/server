<?php

/*
 *  Licenca GPLv3
 */

namespace Max\Filter;

use Zend\Filter\AbstractFilter;

/**
 * Filter za toone relacije. Poskrbi, da se array pretvori v id objekta
 * @author g1smo
 *
 */
class EntityToOne
        extends AbstractFilter
{

    public function filter($value)
    {
        if (\is_array($value))
            $value = $value['id'];


        return $value;
    }

}
