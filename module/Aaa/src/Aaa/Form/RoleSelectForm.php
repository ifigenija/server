<?php

namespace Aaa\Form;

use Aaa\Entity\Role;
use Max\Form\FormModeInterface;
use Max\Form\ManagedForm;
use Max\Stdlib\Hydrator\ClassMethods;
use Max\Stdlib\Hydrator\DoctrineObject;
use Zend\Form\Fieldset;
use Zend\InputFilter\InputFilterProviderInterface;

class RoleSelectForm
        extends ManagedForm
        implements InputFilterProviderInterface
{

    public function __construct()
    {
        parent::__construct('role');
    }

    public function init()
    {
        parent::init();


        $this->add([
            'type' => 'DoctrineModule\Form\Element\ObjectSelect',
            'name' => 'id',
            'options' => [
                'object_manager' => $this->em,
                'target_class' => 'Aaa\Entity\Role',
                'property' => 'name',
            ],
        ]);

        $this->add([
            'name' => 'roleSelect',
            'attributes' => [
                'type' => 'submit',
                'Value' => 'Dodaj'
            ]
        ]);
    }

    public function getInputFilterSpecification()
    {
        return [];
    }

}

