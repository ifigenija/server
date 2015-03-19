<?php

namespace Aaa\Form;

use Tip\Form\ManagedFieldset;

class UserFieldset extends ManagedFieldset 
{

    protected $entityClass = 'Aaa\Entity\User';

    public function init()
    {
        parent::init();

        $this->addWithMeta('name');
        $this->addWithMeta('surname');
        $this->addWithMeta('email');
        $this->addWithMeta('expires');
        $this->addWithMeta('enabled');
        $this->addWithMeta('defaultRoute');
        $this->addWithMeta('defaultRouteParams');
        $this->addWithMeta('username');
        $this->addWithMeta('password');
        $this->addWithMeta('apiKey');
    }

    public function getInputFilterSpecification()
    {
        return [
            'apiKey' => [
                'name' => 'apiKey',
                'required' => false,
                'validators' => [
                    [
                        'name' => 'regex',
                        'options' => [
                            'pattern' => "/^[[:alnum:]]{24,48}$/"
                        ]
                    ]
                ]
            ]
        ];
    }

}
