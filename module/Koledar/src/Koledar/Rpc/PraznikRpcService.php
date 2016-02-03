<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Rpc;

use Max\Functions;

/**
 * Description of PraznikRpcService
 *
 * @author rado
 */
class PraznikRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Preveri, če datum dela prost dan
     *
     * @param string $datum datum, za katerega preverjamo, če je dela prost dan v ISO8601 obliki, npr. "2017-01-01T01:00:00+0100"
     * @return true|false       true če je dela prost dan, false sicer
     * @throws \Max\Exception\UnauthException
     */
    public function delaProstDan($datum)
    {

        // preverjanje avtorizacije
        $this->expectPermission("Praznik-read");

        $this->expectIsoDate($datum, $this->translate("Datum ($datum) ni datum v ISO8601 obliki"), 1001110);
        $datumD = Functions::stringToDateTime($datum);

        /**
         * preračun imamo v posebnem servisu, tako, da ga lahko kličemo direktno iz PHP-ja na strežniški strani
         */
        $service = $this->serviceLocator->get('praznik.service');
        return $service->delaProstDan($datumD);
    }

}
