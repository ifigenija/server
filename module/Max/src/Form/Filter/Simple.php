<?php

namespace Tip\Form\Filter;

use Tip\Form\Filter\Prazna;

class Simple extends Prazna
{

    public function init()
    {
        //Text
        $this->add([
            'name' => 'text',
            'type' => 'Zend\Form\Element\Text',
            'attributes' => [
                'placeholder' => 'Išči...',
            ],
            'options' => [
                'formgroupClass' => 'col-xs-6 col-sm-3',
                'label' => 'Išči'
            ]
        ]);
    }

    public function getDefaults()
    {
        return ['text' => ''];
    }

}
