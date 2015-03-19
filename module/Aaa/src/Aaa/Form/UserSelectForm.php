<?php

namespace Aaa\Form;

use Aaa\Entity\User;
use Tip\Form\FormModeInterface;
use Tip\Form\ManagedForm;
use Tip\Stdlib\Hydrator\ClassMethods;
use Tip\Stdlib\Hydrator\DoctrineObject;
use Zend\Form\Fieldset;
use Zend\InputFilter\InputFilterProviderInterface;

class UserSelectForm
        extends ManagedForm
        implements InputFilterProviderInterface
{

    public function __construct()
    {
        parent::__construct('userSelect');
    }

    public function init()
    {
        parent::init();

        $this->setHydrator(new DoctrineObject($this->em, 'Aaa\Entity\User'))
                ->setObject(new User())->setUseAsBaseFieldset(false);

        $this->add([
            'type' => 'DoctrineModule\Form\Element\ObjectSelect',
            'name' => 'id',
            'options' => [
                'object_manager' => $this->em,
                'target_class' => 'Aaa\Entity\User',
                'property' => 'username',
                'empty_option' => 'Izberi uporabnika'
            ],
        ]);
        $this->add([
            'name' => 'userSelect',
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

