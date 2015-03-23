<?php

namespace Aaa\Form;

use Max\Form\ManagedFieldset;

class RoleFieldset extends ManagedFieldset
{

    protected $entityClass = '\Aaa\Entity\Role';


    public function init()
    {
        parent::init();

        $this->addWithMeta('name');
        $this->addWithMeta('description');
    }

}
