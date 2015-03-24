<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of FieldValue
 *
 * @author boris
 */
class FieldValue
{
    //put your code here
    
        /**
     * Vrne vrednost
     * @param string $name
     * @param type $value
     * @return type
     */
    public function fromPath($name, $value)
    {

        if (strpos($name, '.')) {
            list ($assoc, $field) = explode('.', $name);
            $ameth = 'get' . ucfirst($assoc);
            $fmeth = 'get' . ucfirst($field);
            if ($value->$ameth()) {
                $result = $value->$ameth()->$fmeth();
                if (is_object($result) && method_exists($result, 'getId')) {
                    $result = $result->getId();
                }
                if ($result instanceof DateTime) {
                    $result = $result->format(DATE_ISO8601);
                }
            } else {
                $result = '';
            }
        } else {
            $fmeth = 'get' . ucfirst($name);
            $result = $value->$fmeth();
            if ($result instanceof DateTime) {
                $result = $result->format(DATE_ISO8601);
            }
        }

        return $result;
    }
}
