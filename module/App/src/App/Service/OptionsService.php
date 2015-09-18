<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Service;

use App\Entity\OptionValue;
use Max\Service\AbstractMaxService;

/**
 * 
 * Ponuja vmesnik do nastavitev aplikacije 
 * Storitev je ponujena preko jsonRpc
 *
 * @author boris
 */
class OptionsService
        extends AbstractMaxService
{



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

        /* @var $opt \App\Entity\Option */
        $opt = $rep->findOneByName($name);



        $this->expect($opt, 'Opcije ne obstajajo ' . $name, 1000403);

        // najprej preveri ali je opcija uporabniško nastavljiva
        if ($opt->getPerUser()) {
            //  s katerim uporabniškim imenom je uporabnik prijavljen
            $user = $this->getAuth()->getIdentity();

            $optValueR = $em->getRepository('App\Entity\OptionValue');
            $optValue  = $optValueR->getOptionValuesUserValue($opt, $user);


            if (!empty($optValue)) {
                return $optValue;
            }
        }

        // preveri, če ima globalno opcijo
        if (!$opt->getReadOnly()) {
            $optValue = $em->getRepository('App\Entity\OptionValue')
                    ->getOptionValuesGlobalValue($opt);

            if (!empty($optValue)) {
                return $optValue;
            }
        }

        // če nima niti uporabniške niti globalne nastavitve
        return $opt->getDefaultValue();
    }

    /**
     * Vrne opcije pripravljene za uporabo v formi
     * val => label
     *
     * @param string $object
     * @return array
     * @internal param type $name
     */
    public function getOptionValues($object)
    {
        return array_map(function($val) {
            return $val['label'];
        }, $this->getOptions($object));
    }


}
