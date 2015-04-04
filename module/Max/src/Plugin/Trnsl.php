<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Max\Plugin;

use Zend\Mvc\Controller\Plugin\AbstractPlugin;
use Zend\Mvc\Controller\PluginManager;

/**
 *  Trnslt
 *
 * @author boris
 */
class Trnsl
        extends AbstractPlugin
{

    private $translator;

    public function __invoke($message, $textDomain = 'default', $locale = null)
    {
        if (!$this->translator) {
            $this->translator = $this->getController()->getServiceLocator()->get('Translator');
        }
        return $this->translator->translate($message, $textDomain, $locale);
    }

}
