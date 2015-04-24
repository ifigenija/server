<?php

namespace Max\Filter;

use Zend\Filter\AbstractFilter;

/**
 * Filter za toone relacije. Poskrbi, da se array pretvori v id objekta
 * @author boris
 *
 */
class IsoDateFilter extends AbstractFilter
{

    public function filter($value)
    {
        $r = false;
        if (is_string($value)) {
            // iso date format 
            $r = \DateTime::createFromFormat('Y-m-d\TH:i:s.uO', $value);
            if (!$r) {
                $r = \DateTime::createFromFormat('Y-m-d\TH:i:sO', $value);
            } 
            if (!$r) {
                $r = \DateTime::createFromFormat(\DateTime::ISO8601, $value);
            } 
            if (!$r) {
                $r = \DateTime::createFromFormat('Y-m-d\TH:i:s', $value);
            } 
            if (!$r) {
                $r = \DateTime::createFromFormat('Y-m-d', $value);
            } 
            if (!$r) {
                $r = \DateTime::createFromFormat('d.m.Y H:i:s', $value);
            } 
            if (!$r) {
                $r = \DateTime::createFromFormat('d.m.Y', $value);
            }
        }
        return $r ?: $value;
    }

}
