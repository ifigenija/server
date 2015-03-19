<?php

namespace Aaa\Form;

use Tip\Form\ManagedFieldset;

class PermissionFieldset extends ManagedFieldset  {

    protected $entityClass = 'Aaa\Entity\Permission';

    public function init() {
        parent::init();

        $this->addWithMeta('name');
        $this->addWithMeta('description');

    }

}