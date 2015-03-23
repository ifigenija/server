<?php

/*
 * Licenca GPL V3 or later
 *  
 */

namespace Tip\Form\Filter;

/**
 * Forma za preverjanje polj iz query parametrov master[group]master[nivo]master[id]
 *
 * @author boris
 */
class DetailFilter
    extends Prazna
{

    public function init()
    {
        parent::init();
        $this->setName('master');
        $this->add([
            'name' => 'group',
            'type' => 'select',
        ]);
        $this->add([
            'name' => 'nivo',
            'type' => 'select',
            'options' => [
                'value_options' => [
                    'l0' => 'l0',
                    'l1' => 'l1',
                    'l2' => 'l2',
                    'l3' => 'l3',
                    'raw' => 'raw'
                ],
            ]
        ]);
        $this->add([
            'name' => 'id',
            'type' => 'text',
            'options' => [
                'filters' => [ new \Zend\Filter\StringTrim()],
                'validators' => [ new \Zend\Validator\Regex(['pattern' => '/^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$/'])],
                'required' => false
            ]
        ]);
                $this->add([
            'name' => 'ids',
            'type' => 'text',
            'options' => [
                'filters' => [ new \Zend\Filter\StringTrim()],
                'validators' => [ new \Zend\Validator\Regex(['pattern' => '/^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}(,[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})*$/'])],
                'required' => false
            ]
        ]);
    }

    public function getDefaults()
    {
        return [];
    }

}
