<?php


namespace Tip\Form\Filter;

use Tip\Form\JsonForm;

abstract class Prazna extends JsonForm implements FilterDataDefaultsInterface {

    public function __construct($name = null, $options = []) {
        parent::__construct($name, $options);
        $this->setName('filter');
    }
    
    abstract public function getDefaults();

}
