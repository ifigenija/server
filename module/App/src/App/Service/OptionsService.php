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
class OptionsService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Za nastavljanje vrednosti opcij
     * 
     * @param string $name
     * @param mixed $value
     * @param bool $global
     * retuns array errors
     */
    public function setValue($name, $value, $global = false)
    {
        $em   = $this->getEm();
        $orep = $em->getRepository('App\Entity\Option');

        $opt = $orep->find($name);

        $user = $this->getIdentity();

        $this->expectPermission('options-');
    }

    /**
     * Vrne vrednost opcij po logiki per user -> globalno -> default 
     * 
     * Prebere iz entitet Option in OptionValue
     * 
     * @param string $name
     * @return mixed
     */
    public function getOptions($name)
    {
        $em = $this->getEm();

        $rep    = $em->getRepository('App\Entity\Option');
        $valRep = $em->getRepository('App\Entity\OptionValue');

        /* @var $opt \App\Entity\Option */
        $opt = $rep->findOneByName($name);

        $this->expect($opt, 'Opcije ne obstajajo ' . $name, 1000200);

        // najprej preveri ali je opcija uporabniško nastavljiva
        if ($opt->getPerUser()) {
            //  s katerim uporabniškim imenom je uporabnik prijavljen
            $username = $this->getUsername();
            $gname=$opt->getName();
            $optValA  = $em->getRepository('App\Entity\OptionValue')
                    ->getOptionValuesUserValue($opt->getName(), $username);
            $a        = 1;
            return $optValA->getValue();     //$$ rb to je še potrebno urediti!
        }

        // 
        return $opt->getDefaultValue();
    }

    public function getOptionsWithFlags($name)
    {

        throw new Exception('implementiraj ali ukini', 9999999);
    }

}
