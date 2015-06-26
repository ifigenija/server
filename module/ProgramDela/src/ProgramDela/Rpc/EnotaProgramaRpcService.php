<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Rpc;

use Zend\View\Model\JsonModel;

/**
 * Description of EnotaProgramaRpcService
 *
 * @author rado
 */
class EnotaProgramaRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Kreiranje nove koprodukcije za lastno gledališče za določeno enoto programa
     * 
     * 
     * @param string $enotaProgramaId
     * 
     * @returns koprodukcija id 
     */
    public function novaMaticnaKoprodukcija($enotaProgramaId)
    {
        // preverjanje avtorizacije
        $this->expectPermission("ProdukcijaDelitev-write");
        $this->expectPermission("EnotaPrograma-read");
        $this->expectPermission("Option-read");
        $this->expectPermission("ProdukcijskaHisa-read");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $enotaPrograma = $em->getRepository("ProgramDela\Entity\EnotaPrograma")
                ->findOneById($enotaProgramaId);

        if (!$enotaPrograma) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni enote programa'), 1000941);
        }

        $optionR = $em->getRepository('App\Entity\Option');
        $option  = $optionR->findOneByName("application.tenant.maticnopodjetje");
        $sifra   = $option->getDefaultValue();      // šifra matičnega podjetja t.j. lastnega gledališča

        $phisaR         = $em->getRepository('Produkcija\Entity\ProdukcijskaHisa');
        $phisa          = $phisaR->findOneBySifra($sifra);       // lastno gledališče
        // seštejemo vrednosti iz stroškom uprizoritve

        $matkoprColl = $enotaPrograma->getKoprodukcije()
                ->filter(function($ent) use (&$sifra) {
            return $ent->getKoproducent()->getSifra() === $sifra;     //vrne  koprodukcijo lastnega gledališča
        });

        if ($matkoprColl->count() > 1) {
            throw new \Max\Exception\UnauthException($tr->translate('Obstaja več koprodukcij (' . $matkoprColl->count() . ') lastega gledališča '), 1000942);
        }

        // če koprodukcija še ne obstaja, jo kreiramo
        if ($matkoprColl->isEmpty()) {
            $kopr = new \Produkcija\Entity\ProdukcijaDelitev();
            $kopr->setKoproducent($phisa);
            $kopr->setEnotaPrograma($enotaPrograma);
            $em->persist($kopr);
        } else {
            $kopr = $matkoprColl->get(0);
        }

        $kopr->setOdstotekFinanciranja(100);
        $kopr->validate();

        // sedaj, ko imamo entitete ponovimo preverjanje avtorizacije zaradi morebitnega assert preverjanja!
        $this->expectPermission("ProdukcijaDelitev-write",$kopr);
        $this->expectPermission("EnotaPrograma-read",$enotaPrograma);
        $this->expectPermission("Option-read",$option);
        $this->expectPermission("ProdukcijskaHisa-read",$phisa);
        
        $em->flush();

        return $kopr->getId();
    }

}
