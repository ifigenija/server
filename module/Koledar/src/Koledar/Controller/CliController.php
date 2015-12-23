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

class CliController extends AbstractActionController
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

        $input = [$u];
        if ($u2) {
            $input[] = $u2;
        }

        $osebe = $srv->getSodelujoci($input);
        $this->expect(!empty($osebe), 'Uprizoritev nima zasedbe', 3000602);
        $this->dumpOsebe($osebe);

        $rezultat = $srv->getMozneUprizoritve($osebe);

        // izpis rezultata
        /** @var Uprizoritev $upr */
        foreach ($rezultat as $upr) {
            echo sprintf("%10s %s\n", $upr->getSifra(), $upr->getNaslov());
        }

        $rezultat = $srv->getPogojneUprizoritve($osebe);

        $this->groupByUprizoritev($rezultat,$osebe);
    }

    public function groupByUprizoritev($rezultat,$osebe=[])
    {
        $u = '';

        // izpis pogojnih
        /** @var Uprizoritev $upr */
        foreach ($rezultat as $fun) {
            if ($u !== $fun->getUprizoritev()->getSifra()) {
                echo sprintf("%s %s\n", $fun->getUprizoritev()->getSifra(), $fun->getUprizoritev()->getNaslov());
                $u = $fun->getUprizoritev()->getSifra();
            }
            echo sprintf("  - %s\n", trim($fun->getNaziv()));
            echo sprintf("      - zasedeni: %s\n",  $fun->getImena($osebe,true));
            echo sprintf("      - prosti  : %s\n",  $fun->getImena($osebe,false));
        }
    }

    public function dumpOsebe($osebe){

        echo "------------------------------------------\n";
        $r = $this->getEm()->getRepository('App\Entity\Oseba');
        foreach($osebe as $o) {
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
        $this->expect($u !== null, "Ne najdem uprizoritve", 3000601);


        /** @var VzporedniceService $srv */
        $srv = $this->getServiceLocator()->get('vzporednice.service');

        $osebe = $srv->getSodelujoci([$u]);
        $this->dumpOsebe($osebe);
        $this->expect(!empty($osebe), 'Uprizoritev nima zasedbe', 3000602);


        $rezultat = $srv->getKonfliktneFunkcije($osebe)->getQuery()->getResult();

        $this->groupByUprizoritev($rezultat,$osebe);
    }

}