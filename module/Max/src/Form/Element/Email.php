<?php

namespace Max\Form\Element;

use Zend\Form\Element;
use Zend\Validator\Regex as RegexValidator;
use Zend\InputFilter\InputProviderInterface;
use Zend\Validator\NotEmpty;
use Zend\Validator\StringLength;

/**
 * Vnosno polje, ki se uporablja za vnos email-a
 *
 * @author boris
 */
class Email extends Element implements InputProviderInterface {

    /**
     * Seed attributes
     *
     * @var array
     */
    protected $attributes = [
        'type' => 'text',
          'class' => 'email-polje',
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
            $chain->addValidator(new RegexValidator(
                    '/^[a-zA-Z0-9.!#$%&\'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/'
            ));

            if (isset($this->options['maxlength'])) {
                $chain->addValidator(new StringLength([
                    'max' => $this->getOption('maxlength')
                ]));
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

        if (!isset($this->options['prependIcon'])) {
           $this->options['prependIcon'] = 'icon-afna';
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
                ['name' => 'StringTrim'],
            ],
            'required' => $this->getOption('required'),
            'validators' => $this->getValidators()
        ];
        return $spec;
    }

}


