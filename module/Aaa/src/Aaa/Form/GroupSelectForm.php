 <?php

namespace Aaa\Form;

use Max\Form\FormModeInterface;
use Max\Form\ManagedFieldset;
use Max\Stdlib\Hydrator\ClassMethods;
use Max\Stdlib\Hydrator\DoctrineObject;
use Zend\Form\Fieldset;
use Zend\InputFilter\InputFilterProviderInterface;

class GroupSelectFieldset extends ManagedFieldset implements InputFilterProviderInterface {


    public function __construct() {
        parent::__construct('group_select');
    }

    public function init() {
        parent::init();

        $this->add([
            'type' => 'DoctrineModule\Form\Element\ObjectSelect',
            'name' => 'id',
            'options' => [
                'object_manager' => $this->em,
                'target_class' => 'Aaa\Entity\Group',
                'property' => 'name',
            ],
        ]);
    }

    public function getInputFilterSpecification() {
        return [];
    }

}

