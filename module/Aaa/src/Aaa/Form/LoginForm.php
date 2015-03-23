<?php

namespace Aaa\Form;

use Max\Form\ManagedForm;

class LoginForm extends ManagedForm {

    public function __construct($name = 'loginform') {
        parent::__construct('loginform');
        $this->setAttribute('method', 'post');

        $this->add(
                [
                    'name' => 'username',
                    'attributes' => [
                        'type' => 'text',
                        'id' => 'input-focus'
                    ],
                    'options' => [
                        'label' => 'Uporabniško ime',
                    ],
                ]
        );

        $this->add(
                [
                    'name' => 'password',
                    'attributes' => [
                        'type' => 'password',
                        'id' => 'password'
                    ],
                    'options' => [
                        'label' => 'Geslo',
                    ],
                ]
        );

        $this->add(
                [
                    'name' => 'login',
                    'attributes' => [
                        'type' => 'submit',
                        'value' => 'Prijava',
                    ],
                ]
        );
    }

}