<?php

namespace Koledar\Rpc;

use Max\Filter\IsoDateFilter;
use Max\Functions;

/**
 * Description of DogodekRpcService
 *
 * @author rado
 */
class DogodekRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Shrani dogodek in pripadajoče ažurirane termine storitve
     * 
     * @param guid $dogodekId           
     * @param array $terminiStoritev   polje terminov storitev v obliki:
     *                                   [ { 'id' : 'id-ts'
     *                                      ,'dogodek' : 'id-dogodek'
     *                                      ,'planiranZacetek' : 'iso-date'
     *                                      ,'planiranKonec' : 'iso-date'
     *                                      ,'alternacija' : 'id-alternacije'
     *                                      ,'dezurni' : 'boolean'
     *                                      ,'gost' : 'boolean'
     *                                      ,'sodelujoc' : 'boolean'
     *                                      ,'oseba' : 'oseba-id'
     *                                     } ,...]
     * @return type
     */
    public function azurirajTSDogodka($dogodekId, array $terminiStoritev = [])
    {
        /*
         *  preverjanje avtorizacije
         */
        $this->expectPermission("Dogodek-write");
        $this->expectPermission("TerminStoritve-write");
        $this->expectPermission("Alternacija-read");
        $this->expectPermission("Oseba-read");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");

        $dogodek = $em->getRepository("Koledar\Entity\Dogodek")
                ->findOneById($dogodekId);
        if (!$dogodek) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni dogodka'), 1001240);
        }
        /*
         * ali vsi termini storitve pripadajo pravemu dogodku
         */
        foreach ($terminiStoritev as $ts) {
            if (array_key_exists("dogodek", $ts)) {
                $this->expect(!array_key_exists("dogodek", $ts) || $ts['dogodek'] == $dogodekId
                        , "Dogodek termina storitve " . $ts['dogodek'] . " ni isti kot pri Dogodku", 1001241);
            }
        }

        $srv = $this->getServiceLocator()->get('dogodek.service');

        $srv->azurirajTSDogodka($dogodek, $terminiStoritev);

        $em->flush();

        return true;
    }

    /**
     * Skopira/klonira dogodek skupaj z vsemi termini storitve v nov dogodek, ki ima različen začetek in konec
     * 
     * @param type $dogodekId
     * @param type $zacetek         začetek novega dogodka
     * @return boolean
     * @throws \Max\Exception\UnauthException
     */
    public function kopirajDogodek($dogodekId, $zacetek)
    {
        /*
         *  preverjanje avtorizacije
         */
        $this->expectPermission("Dogodek-write");
        $this->expectPermission("TerminStoritve-write");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");

        $dogodek = $em->getRepository("Koledar\Entity\Dogodek")
                ->findOneById($dogodekId);
        if (!$dogodek) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni dogodka'), 1001242);
        }
        if (!empty($zacetek)) {
            $this->expectIsoDate($zacetek, $this->translate('Začetek (' . $zacetek . ') ni datum v ISO8601 obliki'), 1001243);
        }
        $this->expect(!empty($zacetek), "Začetek in konec morata biti prisotna", 1001245);
        $zacetekD = Functions::stringToDateTime($zacetek);


        $srv = $this->getServiceLocator()->get('dogodek.service');

        $novId = $srv->kopirajDogodek($dogodek, $zacetekD);

        $em->flush();

        return $novId;
    }

}
