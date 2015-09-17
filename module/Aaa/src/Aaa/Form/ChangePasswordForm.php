<?php

namespace Aaa\Form;

use Max\Form\ManagedForm;
use Zend\InputFilter\InputFilterProviderInterface;

class ChangePasswordForm
        extends ManagedForm
        implements InputFilterProviderInterface
{

    public function __construct($name = 'changePass')
    {
        parent::__construct($name);
    }

    public function init()
    {
        $this->add([
            'name' => 'password',
            'attributes' => [
                'type' => 'password',
            ],
            'options' => [
                'label' => 'Geslo',
                'minLength' => 7
            ],
        ]);

        $this->add([
            'name' => 'password2',
            'attributes' => [
                'type' => 'password',
            ],
            'options' => [
                'label' => 'Ponovitev',
                'minLength' => 7
            ],
        ]);

        $this->add([
            'name' => 'spremeni',
            'attributes' => [
                'type' => 'submit',
                'value' => 'Spremeni',
            ],
        ]);
    }

    public function getInputFilterSpecification()
    {
        return [
            [
                'name' => 'password',
                'filters' => [],
                'validators' => [
                    new \Zend\Validator\NotEmpty(),
                    new \Zend\Validator\StringLength(['min' => 7, 'encoding' => 'UTF-8'])],
            ],
            [
                'name' => 'password2',
                'filters' => [],
                'validators' => [
                    new \Zend\Validator\NotEmpty(),
                    new \Zend\Validator\StringLength(['min' => 7, 'encoding' => 'UTF-8'])],
            ],
        ];
    }

}

