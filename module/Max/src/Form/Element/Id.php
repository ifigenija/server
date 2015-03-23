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
class Id extends Hidden implements InputProviderInterface {
     /**
     * Seed attributes
     *
     * @var array
     */
    protected $attributes = [
        'type' => 'hidden',
    ];

    protected $validators;


    protected function getValidators()
    {

        if (null === $this->validators) {
            $chain = new \Zend\Validator\ValidatorChain();
            $chain->addValidator(new NotEmpty(),true);
            $chain->addValidator(new Regex('/[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}/'));
            $this->validators = $chain;
        }
        return $this->validators;

    }

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

        if (!isset($this->options['required'])) {
            $this->options['required'] = true;
        }
        if (isset($this->options['label'])) {
            $this->options['label'] = '';
        }
        return $this;
    }


    /**
     * Provide default input rules for this element
     *
     * Attaches the captcha as a validator.
     *
     * @return array
     */
    public function getInputSpecification() {
        $spec = [
            'name' => $this->getName(),
            'filters' => [
    //            array('name' => 'null'),
            ],
            'required' => $this->getOption('required'),
            'validators' => $this->getValidators()
        ];

        return $spec;
    }
}


