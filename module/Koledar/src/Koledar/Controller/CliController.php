<?php

/**
 * Created by PhpStorm.
 * User: boris
 * Date: 12. 12. 15
 * Time: 18:39
 */

namespace Koledar\Controller;

use Koledar\Service\VzporedniceService;
use Max\Controller\Traits\EntityTrait;
use Max\Expect\ExpectTrait;
use Produkcija\Entity\Uprizoritev;
use Zend\Mvc\Controller\AbstractActionController;

class CliController
        extends AbstractActionController
{

    use EntityTrait;

use ExpectTrait;

    /**
     * @throws \Max\Exception\MaxException
     */
    public function vzporedniceAction()
    {

        $rep = $this->getRepository('Produkcija\Entity\Uprizoritev');

        $u = $rep->findOneBySifra($this->params('stevilka'));
        if ($this->params('stevx')) {
            $u2 = $rep->findOneBySifra($this->params('stevx'));
        } else {
            $u2 = null;
        }
        $this->expect($u !== null, "Ne najdem uprizoritve", 3000601);


        /** @var VzporedniceService $srv */
        $srv = $this->getServiceLocator()->get('vzporednice.service');

        $uprA = [$u];
        if ($u2) {
            $uprA[] = $u2;
        }

        $osebe = $srv->getSodelujoci($uprA);
        $this->expect(!empty($osebe), 'Uprizoritev nima zasedbe', 3000602);
        $this->dumpOsebe($osebe);

        $rezultat = $srv->getMozneUprizoritve($osebe);

        // izpis rezultata
        /** @var Uprizoritev $upr */
        foreach ($rezultat as $upr) {
            if (!in_array($upr, $uprA)) {
                echo sprintf("%s %s\n", $upr->getSifra(), $upr->getNaslov());
            }
        }

        $rezultat = $srv->getPogojneUprizoritve($osebe);

        $this->groupByUprizoritev($rezultat, $osebe, $uprA);
    }

    /**
     * Izpiše funkcije, ki so že grupirane po šifri uprizoritve,
     * izpusti uprizoritve, ki so v parametrih
     * 
     * @param type $rezultat
     * @param type $osebe
     * @param type $uprA            seznam uprizoritev, ki jih ne vključi v izpis
     */
    public function groupByUprizoritev($rezultat, $osebe = [], $uprA = [])
    {
        $u = '';

        // izpis pogojnih
        /** @var Uprizoritev $upr */
        foreach ($rezultat as $fun) {
            if (!in_array($fun->getUprizoritev(), $uprA)) {
                if ($u !== $fun->getUprizoritev()->getSifra()) {
                    echo sprintf("%s %s\n", $fun->getUprizoritev()->getSifra(), $fun->getUprizoritev()->getNaslov());
                    $u = $fun->getUprizoritev()->getSifra();
                }
                echo sprintf("  - %s\n", trim($fun->getNaziv()));
                echo sprintf("      - zasedeni: %s\n", $fun->getImena($osebe, true));
                echo sprintf("      - prosti  : %s\n", $fun->getImena($osebe, false));
            }
        }
    }

    public function dumpOsebe($osebe)
    {

        echo "------------------------------------------\n";
        $r = $this->getEm()->getRepository('App\Entity\Oseba');
        foreach ($osebe as $o) {
            $os = $r->find($o);
            echo $os->getPolnoime() . ";";
        }
        echo "\n------------------------------------------\n";
    }

    /**
     * @throws \Max\Exception\MaxException
     */
    public function prekrivanjeAction()
    {

        $rep = $this->getRepository('Produkcija\Entity\Uprizoritev');

        $u = $rep->findOneBySifra($this->params('stevilka'));
        $u = $rep->findOneBySifra($this->params('stevilka'));
        if ($this->params('stevx')) {
            $u2 = $rep->findOneBySifra($this->params('stevx'));
        } else {
            $u2 = null;
        }
        $this->expect($u !== null, "Ne najdem uprizoritve", 3000601);


        /** @var VzporedniceService $srv */
        $srv = $this->getServiceLocator()->get('vzporednice.service');

        $uprA = [$u];
        if ($u2) {
            $uprA[] = $u2;
        }

        $osebe = $srv->getSodelujoci($uprA);
        $this->dumpOsebe($osebe);
        $this->expect(!empty($osebe), 'Uprizoritev nima zasedbe', 3000602);


//        $rezultat = $srv->getKonfliktneFunkcije($osebe)->getQuery()->getResult();
        $vrniKonfliktne = true;
        $rezultat       = $srv->getPogojneUprizoritve($osebe, $vrniKonfliktne);

        $this->groupByUprizoritev($rezultat, $osebe, $uprA);
    }

}
