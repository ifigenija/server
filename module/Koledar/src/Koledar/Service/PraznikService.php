<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Service;

/**
 * Description of PraznikRpcService
 *
 * @author rado
 */
class PraznikService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Preveri, če datum dela prost dan
     *
     * @param string $datum datum, za katerega preverjamo, če je dela prost dan v ISO8601 obliki, npr. "1970-01-01T01:00:00+01:00"
     * @return true|false       true če je dela prost dan, false sicer
     * @throws \Max\Exception\UnauthException
     */
    public function delaProstDan($datum)
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $praznikR = $em->getRepository("Koledar\Entity\Praznik");

        /**
         * preveri, $$
         *      če obstaja pranik z istim dan,mesec,leto kot datum in delaprostdan=true
         *      če obstaja pranik z istim dan,mesec,leto kot datum in leto=null in delaprostdan=true
         */
        $dan     = intval(date('d', strtotime($datum)));
        $mesec   = intval(date('m', strtotime($datum)));
        $leto    = intval(date('Y', strtotime($datum)));
        $praznik = $praznikR->findOneBy(["dan" => $dan, "mesec" => $mesec, "leto" => $leto]);
        if ($praznik) {
            return true;
        }
        $praznik = $praznikR->findOneBy(["dan" => $dan, "mesec" => $mesec, "leto" => NULL]);
        if ($praznik) {
            return true;
        }

        return false;
    }

}
