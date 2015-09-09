<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Rpc;

use Zend\View\Model\JsonModel;

/**
 * Description of AlternacijaRpcService
 *
 * @author rado
 */
class AlternacijaRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Kreiranje nove pogodbe Alternaciji
     * 
     * Procedura deluje podobno kot 2 REST ukaza, vendar v 1 flushu:
     *  POST /rest/pogodba      vrednostPredstave=0,...
     *  PUT  /rest/alternacija   pogodba= idPogodbe 
     * 
     * @param string $alternacijaId
     * 
     * @returns pogodba id (ali celi objekt od pogodbe)  ali ?false  , če ne uspe $$
     */
    public function novaPogodba($alternacijaId)
    {
        // preverjanje avtorizacije
        $this->expectPermission("Pogodba-write");
        $this->expectPermission("Alternacija-write");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $alternacija = $em->getRepository("Produkcija\Entity\Alternacija")
                ->findOneById($alternacijaId);
        if (!$alternacija) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni alternacije'), 1000921);
        }

        if ($alternacija->getPogodba()) {
            throw new \Max\Exception\UnauthException($tr->translate('Alternacija že ima pogodbo'), 1000922);
        }

        $pogodba = new \Produkcija\Entity\Pogodba();

        // vse vrednosti na 0
//        $pogodba->setVrednostDo(0);
//        $pogodba->setVrednostDo(0);
        $pogodba->setVrednostVaj(0);
        $pogodba->setVrednostVaje(0);
        $pogodba->setPlaniranoSteviloVaj(0);
        $pogodba->setVrednostPredstave(0);
//        $pogodba->setVrednostUre(0);
        $pogodba->setVrednostDoPremiere(0);
        $pogodba->setPlaciloNaVajo(FALSE);
        $pogodba->setJeAvtorskePravice(FALSE);
        $pogodba->setOseba($alternacija->getOseba());

        $pogodbaR = $em->getRepository("Produkcija\Entity\Pogodba")
                ->setServiceLocator($this->getServiceLocator());
        $pogodbaR->create($pogodba);           //da kreira tudi šifro
        // create vključuje tudi persist

        $alternacija->setPogodba($pogodba);

        $pogodba->preracunaj();
        $pogodba->validate();
        $alternacija->preracunaj();
        $alternacija->validate();
        
        // sedaj, ko imamo entiteti ponovimo preverjanje avtorizacije zaradi morebitnega assert preverjanja!
        $this->expectPermission("Pogodba-write", $pogodba);
        $this->expectPermission("Alternacija-write", $alternacija);

        $em->flush();

        return $pogodba->getId();
    }

}
