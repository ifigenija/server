<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Tip\Stdlib\Hydrator\Strategy;

class JsonString implements \Zend\Stdlib\Hydrator\Strategy\StrategyInterface {
    public function extract($value) {
        return \Zend\Json\Json::decode($value);
        
    }

    public function hydrate($value) {
        return \Zend\Json\Json::encode($value, 'true');
    }
}
