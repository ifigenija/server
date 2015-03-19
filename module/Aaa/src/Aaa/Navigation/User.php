<?php

/**
 * (copyleft) Licenca
 */

namespace Aaa\Navigation;

/**
 *
 *
 */
class User extends Toolbar
{

    public function getIndexPages()
    {
        parent::getIndexPages();
        $this->addPage([
            'route' => 'aaa',
            'action' => 'updateCache',
            'controller' => 'User',
            'label' => 'Posodobi '            
        ]);
        return $this;
    }

    public function getPregledPages()
    {
        $this->addUrediDovoljenja($this->controller->params('id'));
        return parent::getPregledPages();
    }

    public function getUrediPages()
    {
        $this->addUrediDovoljenja($this->controller->params('id'));
        $this->addSave();
        $this->addHelp();
        return $this;
    }

    public function addUrediDovoljenja()
    {
        $this->addPage([
            'route' => 'aaa',
            'action' => 'urediDovoljenja',
            'controller' => 'User',
            'label' => 'Uredi Vloge',
            'params' => [
                'id' => $this->controller->params('id')
            ]
        ]);
    }

}
