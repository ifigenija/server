<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Tip\Stdlib\Hydrator\Strategy;

/**
 * Description of DateString
 *
 * @author boris
 */
class DateString implements \Zend\Stdlib\Hydrator\Strategy\StrategyInterface {

    protected $format = \DateTime::ISO8601;

    /*function __construct($type = 'date') {
        if ($type == 'date') {
            $this->format = 'd.m.Y';
        }

        if ($type == 'datetime') {
            $this->format = 'd.m.Y H:i:s';
        }
        $this->format = \DateTime::
    }*/

    public function extract($value) {
        if ($value) {
            return $value->format($this->format);
        }
        return $value;
    }

    public function hydrate($value) {
        if ($value instanceof \DateTime) {
            return $value;
        } else if (is_null($value)) {
            return $value;
        } else {
            return \DateTime::createFromFormat($this->format, $value);
        }
    }

}
