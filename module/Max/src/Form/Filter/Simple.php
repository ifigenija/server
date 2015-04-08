<?php

namespace Max\Form\Filter;

use Max\Form\Filter\Prazna;

class Simple extends Prazna
{

    public function init()
    {
        //Text
        $this->add([
            'name' => 'q',
            'type' => 'Zend\Form\Element\Text',
            'attributes' => [
                'placeholder' => 'Išči...',
            ],
            'options' => [
                'label' => 'Išči',
            ]
        ]);
    }

    public function getDefaults()
    {
        return ['text' => ''];
    }

}
