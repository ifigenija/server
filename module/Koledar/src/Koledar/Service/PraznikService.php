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
     * @param \DateTime $datum datum, za katerega preverjamo, če je dela prost dan v ISO8601 obliki, npr. "1970-01-01T01:00:00+01:00"
     * @return boolean       true če je dela prost dan, false sicer
     */
    public function delaProstDan(\DateTime $datum)
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");

        $praznikR = $em->getRepository("Koledar\Entity\Praznik");

        /**
         * preveri, $$
         *      če obstaja pranik z istim dan,mesec,leto kot datum in delaprostdan=true
         *      če obstaja pranik z istim dan,mesec,leto kot datum in leto=null in delaprostdan=true
         */
        $dan   = intval($datum->format('d'));
        $mesec = intval($datum->format('m'));
        $leto  = intval($datum->format('Y'));
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
