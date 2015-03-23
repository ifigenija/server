<?php

namespace Tip\Stdlib\Hydrator\Strategy;

/**
 * Description of Number
 *
 * @author boris
 */
class Number implements \Zend\Stdlib\Hydrator\Strategy\StrategyInterface
{

    public function extract($value)
    {

        return (float) $value;
    }

    public function hydrate($value)
    {
        return $value;
    }

}
