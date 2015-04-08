<?php

namespace Max\Form\Element;

use Zend\Form\Element\Text;
use Zend\InputFilter\InputProviderInterface;
use Zend\Validator\NotEmpty;
use Zend\Validator\StringLength;

/**
 * Vnosno polje za zneske
 *
 * @author boris
 */
class Znesek extends Decimal implements InputProviderInterface {

    /**
     * Nastavi opcije za polje znesek.
     *
     * @param  array|\Traversable $options
     * @return ElementInterface
     */
    public function setOptions($options) {
        if (!isset($this->options['prependIcon'])) {
            $this->options['prependIcon'] = 'fa fa-money';
        }
        parent::setOptions($options);

        return $this;
    }


}


