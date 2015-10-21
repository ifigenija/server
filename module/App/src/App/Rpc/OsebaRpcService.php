<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Service;

/**
 * 
 * Ponuja vmesnik do podatkov o osebah
 * 
 * Storitev je ponujena preko jsonRpc
 *
 * @author rado
 */
class OsebaRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Poišče podobne osebe glede na kriterije kot npr. enak priimek,
     *
     * @param array $oseba      oseba, za katero iščemo podobne osebe
     * @return array            hidriran seznam podobnih oseb
     * @throws \Max\Exception\UnauthException
     */
    public function podobneOsebe($oseba)
    {

        // preverjanje avtorizacije
        $this->expectPermission("Oseba-read");
        
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");

        $osebaR = $em->getRepository("App\Entity\Oseba");

        
        $this->expect(is_array($oseba), $this->translate("Vhodni parameter oseba mora biti array"), 1001120);

        $imepolja = 'priimek';
        $this->expect(array_key_exists($imepolja, $oseba) && is_string($oseba[$imepolja])
                , $this->translate("Vhodni parameter (oseba.$imepolja) je obvezen tekstovni podatek"), 1001121);
        $imepolja = 'ime';
        $this->expect(array_key_exists($imepolja, $oseba) && is_string($oseba[$imepolja])
                , $this->translate("Vhodni parameter (oseba.$imepolja) je obvezen tekstovni podatek"), 1001122);

        $imepolja = 'id';
        $this->expect(array_key_exists($imepolja, $oseba) && (is_string($oseba[$imepolja]) || is_null($oseba[$imepolja]))
                , $this->translate("Vhodni parameter (oseba.$imepolja) je obvezen tekstovni podatek. Lahko je tudi null"), 1001123);

        /**
         * izvedbo imamo v posebnem servisu, tako, da ga lahko kličemo direktno iz PHP-ja na strežniški strani
         */
        $service = $this->serviceLocator->get('oseba.service');

        $podobneOsebe = $service->podobneOsebe($oseba);

        /**
         * še hidriramo
         */
        $jsonList = [];

        $hydr = $osebaR->getJsonHydrator();

        /**
         * $$ tu bi morda še bilo potrebno preverjati avtorizacije po kontekstu
         */
        foreach ($podobneOsebe as $object) {
            $array      = $hydr->extract($object);
            $jsonList[] = $array;
        }

        return $jsonList;
    }

}
