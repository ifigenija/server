<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Service;

use App\Entity\OptionValue;

/**
 * 
 * Ponuja vmesnik do nastavitev aplikacije 
 * Storitev je ponujena preko jsonRpc
 *
 * @author boris
 */
class OptionsRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Vrne vrednost opcij po logiki per user -> globalno -> default 
     * 
     * Prebere iz entitet Option in OptionValue
     * 
     * @param string $name
     * @param boolean $nouser   če true, potem ne prikaže user opcije
     *                               tudi v primeru, če le-ta obstaja
     * @return mixed
     */
    public function getOptions($name, $nouser = false)
    {
        // preverjanje avtorizacije
        $this->expectPermission("Option-read");
        $this->expectPermission("OptionValue-read");

        $em = $this->getEm();

        $rep = $em->getRepository('App\Entity\Option');

        /* @var $opt \App\Entity\Option */
        $opt = $rep->findOneByName($name);

        /*
         *  preverjanje avtorizacije s kontekstom
         */
        $this->expectPermission("Option-read", $opt);

        $this->expect($opt, 'Opcije ne obstajajo ' . $name, 1000403);

        $srv = $this->serviceLocator->get('options.service');

        return $srv->getOptions($name, $nouser);
    }

    /**
     * 
     * Nastavi uporabniško opcijo v OptionValue entiteti
     * 
     * @param string $name    Ime opcij
     * @param mixed $value   vrednost, ki jo vstavi
     * @return boolean
     */
    public function setUserOption($name, $value)
    {
        // preverjanje avtorizacije
        $this->expectPermission("Option-read");
        $this->expectPermission("OptionValue-write");

        $em  = $this->getEm();
        $rep = $em->getRepository('App\Entity\Option');

        /* @var $opt \App\Entity\Option */
        $opt = $rep->findOneByName($name);

        // preverjanje avtorizacije s kontekstom
        $this->expectPermission("Option-read", $opt);


        $this->expect($opt, 'Opcije ne obstajajo ' . $name, 1000404);

        // preveri, če ima globalno opcijo
        $this->expect(!$opt->getReadOnly(), 'Opcija ni globalna ' . $name, 1000405);

        // preveri, če je opcije uporabniško nastavljiva
        $this->expect($opt->getPerUser(), 'Opcija ni uporabniško nastavljiva ' . $name, 1000406);

        //  s katerim uporabniškim imenom je uporabnik prijavljen
        $user = $this->getAuth()->getIdentity();

        $optValR    = $em->getRepository('App\Entity\OptionValue');
        $optValueId = $optValR->getOptionValuesUserId($opt, $user);
        if (empty($optValueId)) {
            // kreiramo nov zapis v OptionValue
            $optVal = new OptionValue();
            $optVal->setValue($value);
            $optVal->setGlobal(false);
            $optVal->addOption($opt);
            $optVal->addUser($user);
        } else {
            // le zamenjamo vrednost
            $optVal = $optValR->findOneById($optValueId);
            $optVal->setValue($value);
        }
        $em->persist($optVal);

        // preverjanje avtorizacije s kontekstom
        $this->expectPermission("OptionValue-write", $optVal);

        $em->flush();

        return true;
    }

    /**
     * 
     * Nastavi uporabniško opcijo v OptionValue entiteti
     * 
     * param type $value   vrednost, ki jo vstavi
     * 
     * @param string $name    Ime opcij
     * @param mixed $value   vrednost, ki jo vstavi
     * @return boolean   
     */
    public function setGlobalOption($name, $value)
    {
        // preverjanje avtorizacije
        $this->expectPermission("Option-write");
        $this->expectPermission("OptionValue-write");
        $this->expectPermission("OptionValue-writeGlobal");

        $em  = $this->getEm();
        $rep = $em->getRepository('App\Entity\Option');

        /* @var $opt \App\Entity\Option */
        $opt = $rep->findOneByName($name);

        $this->expect($opt, 'Opcije ne obstajajo ' . $name, 1000401);

        // preveri, če ima globalno opcijo 
        $this->expect(!$opt->getReadOnly(), 'Opcija ni globalna ' . $name, 1000402);

        $optValR       = $em->getRepository('App\Entity\OptionValue');
        $globalValueId = $optValR->getOptionValuesGlobalId($opt);
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
        $em->persist($optVal);


        // preverjanje avtorizacije s kontekstom
        $this->expectPermission("Option-write", $opt);
        $this->expectPermission("OptionValue-write", $opt);
        $this->expectPermission("OptionValue-writeGlobal", $opt);

        $em->flush();

        return true;
    }
}
