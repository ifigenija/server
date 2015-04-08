<?php

namespace Max\Form\Element;

use Zend\Form\Element\Checkbox as ZendCheckbox;
use Zend\Validator\Regex;
use Zend\Validator\NotEmpty;
use Zend\InputFilter\InputProviderInterface;

/**
 * Vnosno polje, ki se uporablja za ID polja
 *
 * @author boris
 */
class BoolCheckbox extends ZendCheckbox implements InputProviderInterface
{

    /**
     * @var bool
     */
    protected $uncheckedValue = false;

    /**
     * @var bool
     */
    protected $checkedValue = true;

    /*
     * Set options for an element. Accepted options are:
     * - label: label to associate with the element
     * - label_attributes: attributes to use when the label is rendered
     * - format: datetime format - php format value
     *
     * @param  array|\Traversable $options
     * @return DateTime|ElementInterface
     */

    public function setOptions($options)
    {
        parent::setOptions($options);

        return $this;
    }

    /**
     * Provide default input rules for this element
     *
     * Attaches the captcha as a validator.
     *
     * @return array
     */
    public function getInputSpecification()
    {
        $spec = [
            'name' => $this->getName(),
            'required' => $this->getOption('required'),
            'validators' => [$this->getValidator()],        
            'filters' => [new \Zend\Filter\Callback([$this, 'convertToBool'])]
        ];

        return $spec;
    }

    public function convertToBool($value)
    {
        if ($value === '1' || $value === 'true' || $value === true) {
            return true;
        } 
        return false;
    }
    
        /**
     * Checks or unchecks the checkbox.
     *
     * @param mixed $value A boolean flag or string that is checked against the "checked value".
     * @return Element
     */
    public function setValue($value)
    {
        // Cast to strings because POST data comes in string form
        $checked = $this->convertToBool($value) ===  $this->getCheckedValue();
        $this->value = $checked ? $this->getCheckedValue() : $this->getUncheckedValue();
        return $this;
    }

}
