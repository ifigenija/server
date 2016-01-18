<?php

namespace Koledar\Rpc;

use Max\Filter\IsoDateFilter;
use Max\Functions;

/**
 * Description of OperacijeRpcService
 *
 * @author rado
 */
class OperacijeRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Shrani dogodek in pripadajoče ažurirane termine storitve
     * 
     * 
     * @param type $dogodekId
     * @param array $terminiStoritev
     * @return type
     */
    public function shraniDogodek($dogodekId = null, array $terminiStoritev = [])
    {

        /*
         *  preverjanje avtorizacije
         */
        $this->expectPermission("Dogodek-write");
        $this->expectPermission("TerminStoritve-write");

        $this->preveriVhodneParametre($dogodekId, $terminiStoritev, $zacetek, $konec);

        $srv = $this->getServiceLocator()->get('operacije.service');

        $konfliktiOseUpr = $srv->getKonfliktOsebaUpriz($terminisStoritev);

        $jsonResult = $this->dajJson($uprizoritveMozne, $pogojneFunkcije, $osebe, $dogodekId, $konfliktiOseUpr);

        return $jsonResult;
    }


}
