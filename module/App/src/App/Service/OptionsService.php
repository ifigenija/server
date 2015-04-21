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

        $this->expect($opt, 'Opcije ne obstajajo ' . $name, 1000403);

        // najprej preveri ali je opcija uporabniško nastavljiva
        if ($opt->getPerUser()) {
            //  s katerim uporabniškim imenom je uporabnik prijavljen
            $username = $this->getUsername();
            $optValue = $em->getRepository('App\Entity\OptionValue')
                    ->getOptionValuesUserValue($opt->getName(), $username);
            if (!empty($optValue)) {
                return $optValue;
            }
        }

        // preveri, če ima globalno opcijo
        if (!$opt->getReadOnly()) {
            $optValue = $em->getRepository('App\Entity\OptionValue')
                    ->getOptionValuesGlobalValue($opt->getName());
            if (!empty($optValue)) {
                return $optValue;
            }
        }

        // če nima niti uporabniške niti globalne nastavitve
        return $opt->getDefaultValue();
    }

    /**
     * 
     * Nastavi uporabniško opcijo v OptionValue entiteti
     * 
     * @param type $name    Ime opcij
     * @param type $value   vrednost, ki jo vstavi
     * @return boolean
     */
    public function setUserOption($name, $value)
    {
        $em  = $this->getEm();
        $rep = $em->getRepository('App\Entity\Option');

        /* @var $opt \App\Entity\Option */
        $opt = $rep->findOneByName($name);

        $this->expect($opt, 'Opcije ne obstajajo ' . $name, 1000404);

        if ($opt->getReadOnly()) {
            // preveri, če ima globalno opcijo
            $this->expect($opt, 'Opcija ni globalna ' . $name, 1000405);
        }
        if (!$opt->getPerUser()) {
            // preveri, če je opcije uporabniško nastavljiva
            $this->expect($opt, 'Opcija ni uporabniško nastavljiva ' . $name, 1000406);
        }

        $username = $this->getUsername();

        $optValR    = $em->getRepository('App\Entity\OptionValue');
        $optValueId = $optValR->getOptionValuesUserId($name, $username);
        if (empty($optValueId)) {
            // kreiramo nov zapis v OptionValue
            $optVal = new OptionValue();
            $optVal->setValue($value);
            $optVal->setGlobal(false);
            $optVal->addOption($opt);
            $user   = $em->getRepository('Aaa\Entity\User')->findOneByUsername($username);
            $optVal->addUser($user);
        } else {
            // le zamenjamo vrednost
            $optVal = $optValR->findOneById($optValueId);
            $optVal->setValue($value);
        }
        $em->persist($optVal);
        $em->flush();

        return true;
    }

    /**
     * 
     * Nastavi uporabniško opcijo v OptionValue entiteti
     * 
     * param type $value   vrednost, ki jo vstavi
     * 
     * @param type $name    Ime opcij
     * @param type $value   vrednost, ki jo vstavi
     * @return boolean   
     */
    public function setGlobalOption($name, $value)
    {
        $em  = $this->getEm();
        $rep = $em->getRepository('App\Entity\Option');

        /* @var $opt \App\Entity\Option */
        $opt = $rep->findOneByName($name);

        $this->expect($opt, 'Opcije ne obstajajo ' . $name, 1000401);

        if ($opt->getReadOnly()) {
            // preveri, če ima globalno opcijo 
            $this->expect($opt, 'Opcija ni globalna ' . $name, 1000402);
        }

        $optValR       = $em->getRepository('App\Entity\OptionValue');
        $globalValueId = $optValR->getOptionValuesGlobalId($name);
        if (empty($globalValueId)) {
            // kreiramo nov zapis v OptionValue
            $optVal = new OptionValue();
            $optVal->setValue($value);
            $optVal->setGlobal(true);
            $optVal->addOption($opt);
        } else {
            // le zamenjamo vrednost
            $optVal = $optValR->findOneById($globalValueId);
            $optVal->setValue($value);
        }
        $em->persist($optVal);  // $$ ali je lahko več persistov pred flush-em?
        $em->flush();

        return true;
    }

    public function getOptionsWithFlags($name)
    {

        throw new Exception('implementiraj ali ukini', 9999999);
    }

}
