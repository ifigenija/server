<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Service;

/**
 * 
 * Ponuja vmesnik do nastavitev aplikacije 
 * Storitev je ponujena preko jsonRpc
 *
 * @author boris
 */
class SettingsService
        extends Max\Service\AbstractMaxService
{

    /**
     * Preberi vrednost nastavitve 
     * 
     * @param string $name 
     * @return array {
     */
    public function getValue($name)
    {
        $em = $this->getEm();
        $rep = $em->getRepository('App\Entity\Option');
        $option = $this->find($name);
        
        $this->expectAuthenticated();
        return $value;
    }

    /**
     * 
     * @param string $name
     * @param mixed $value
     * @param bool $global
     * retuns array errors
     */
    public function setValue($name, $value, $global = false)
    {
        $em = $this->getEm();
        $orep = $em->getRepository('App\Entity\Option');
        
        $opt = $orep->find($name);
        
        $user = $this->getIdentity();
        
        $this->expectPermission('options-');
    }

    public function setValues($values)
    {
        foreach ($values as $v) {

            $this->setValue($v['option'], $v['value'], $v['global']);
        }
    }

}
