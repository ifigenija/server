<?php

/**
 * (copyleft) Licenca
 */

namespace Aaa\Navigation;

/**
 *
 *
 */
class Toolbar extends \Max\Navigation\BaseToolbar
{

    public function getIndexPages()
    {

        $this->addPage([
            'route' => 'aaa',
            'action' => 'dodaj',
            'controller' => $this->getCntName(),
            'label' => 'Dodaj',
        ]);

        return $this;
    }

    public function getDodajPages()
    {
        $this->addSave();
        $this->addHelp();
        return $this;
    }

    public function getPregledPages()
    {
        
        $this->aaaAction('uredi', 'Uredi');
        $this->addHelp();
        return $this;
    }

    public function aaaAction($action, $label)
    {
        $this->addPage([
            'route' => 'aaa',
            'action' => $action,
            'controller' => $this->getCntName(),
            'label' => $label,
            'params' => [
                'id' => $this->controller->params('id')
            ]
        ]);
    }

    private function getCntName()
    {
        $match = $this->controller->getEvent()->getRouteMatch();
        $contr = $match->getParam('controller');
        return substr($contr, strpos($contr, '\\') + 1);
    }

    public function getUrediPages()
    {
        $this->addSave();
        $this->addSaveAndNew();
        $this->addHelp();
        return $this;
    }
   
}
