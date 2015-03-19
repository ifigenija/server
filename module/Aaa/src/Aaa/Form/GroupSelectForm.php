 <?php

namespace Aaa\Form;

use Tip\Form\FormModeInterface;
use Tip\Form\ManagedFieldset;
use Tip\Stdlib\Hydrator\ClassMethods;
use Tip\Stdlib\Hydrator\DoctrineObject;
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

