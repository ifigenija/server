<?php

namespace Aaa\Form\Filter;


class Simple extends \Tip\Form\Filter\Prazna
{

    public function init()
    {
        $this->setName('search-form');
        $this->setAttribute('method', 'post');

        //Text
        $this->add([
            'name' => 'text',
            'type' => 'Zend\Form\Element\Text',
            'attributes' => [
                'placeholder' => 'Išči...',
            ],
            'options' => [
                'label' => 'Išči'
            ]
        ]);
    }

    public function getDefaults()
    {
        return ['text' => ''];
    }

}
