<?php

namespace Aaa\Form;

use Max\Form\ManagedFieldset;

/**
 * GroupFieldset za kreiranje / urejanje imena in opisa skupine
 *
 * @author boris
 */
class GroupFieldset
        extends ManagedFieldset
{

    protected $entityClass = 'Aaa\Entity\Group';

    public function init()
    {
        parent::init();
        $this->addWithMeta('name');
        $this->addWithMeta('description');
    }


}
