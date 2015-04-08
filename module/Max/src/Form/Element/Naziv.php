<?php

namespace Max\Form\Element;

use Zend\Form\Element\Text;
use Zend\InputFilter\InputProviderInterface;
use Zend\Validator\NotEmpty;
use Zend\Validator\StringLength;

/**
 * Vnosno polje za string polja, ki iz metapodatkov vzamejo requred in dolžino
 *
 * @author boris
 */
class Naziv extends Text implements InputProviderInterface {

    /**
     * Seed attributes
     *
     * @var array
     */
    protected $attributes = [
        'type' => 'text',
        'class' => 'naziv-polje'
    ];
    protected $validators;

    /**
     *
     * @var \Doctrine\ORM\Mapping\ClassMetadata;
     */
    protected $metadata;

    protected function getValidators() {

        if (null === $this->validators) {
            $chain = new \Zend\Validator\ValidatorChain();

            if ($this->options['required']) {
                $chain->addValidator(new NotEmpty(), true);
            }

            if (isset($this->options['maxlength'])) {
                $chain->addValidator(new StringLength([
                    'max' => $this->getOption('maxlength')
                ]));
            }
            if ($this->getAttribute('type') == 'url') {
                $chain->addByName('Uri');
            }

            $this->validators = $chain;
        }
        return $this->validators;

        return;
    }

    /**
     * Nastavi opcije za polje kratka šifra.
     * Privzeto je to dolžina min 1 in max 3
     * maxLength,
     *
     * @param  array|\Traversable $options
     * @return ElementInterface
     */
    public function setOptions($options) {
        parent::setOptions($options);

        if (!isset($this->options['required'])) {
            $this->options['required'] = true;
        }

        if (!isset($this->options['maxlength'])) {
            $this->options['maxlength'] = 50;
        }
        $this->setAttribute('maxlength', $this->options['maxlength']);


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
                ['name' => 'StringTrim'],
                ['name' => 'StripTags']
            ],
            'required' => $this->getOption('required'),
            'validators' => $this->getValidators()
        ];

        return $spec;
    }

}


