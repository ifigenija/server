<?php

namespace Max\Form\Element;


use Zend\Form\Element\Hidden;
use Zend\Validator\Regex;
use Zend\Validator\NotEmpty;
use Zend\InputFilter\InputProviderInterface;

/**
 * Vnosno polje, ki se uporablja za ID polja
 *
 * @author boris
 */
class Multiselect extends \Zend\Form\Element\Select implements InputProviderInterface {

    public function setOptions($options)
    {
        parent::setOptions($options);

        if (!isset($this->options['multiple'])) {
            $this->options['multiple'] = 'multiple';
        }
        $this->setAttribute('multiple', 'multiple');
        return $this;
    }
    
    /**
     * Provide default input rules for this element
     *
     * @return array
     */
    public function getInputSpecification()
    {
        $spec = parent::getInputSpecification();
        
        $spec['required'] = !empty($this->options['required']);

        return $spec;
    }
}


