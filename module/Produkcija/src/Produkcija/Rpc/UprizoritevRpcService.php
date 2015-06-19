<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Rpc;

use Zend\View\Model\JsonModel;

/**
 * Description of UprizoritevRpcService
 *
 * @author rado
 */
class UprizoritevRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Kreiranje nove koprodukcije za lastno gledališče za določeno uprizoritev
     * 
     * 
     * @param string $uprizoritevId
     * 
     * @returns pogodba id (ali celi objekt od pogodbe)  ali ?false  , če ne uspe $$
     */
    public function preracunajMaticnaKoprodukcija($uprizoritevId)
    {
        // preverjanje avtorizacije
        $this->expectPermission("Uprizoritev-read");
        $this->expectPermission("StrosekUprizoritve-read");
        $this->expectPermission("Option-read");
        $this->expectPermission("ProdukcijaDelitev-write");
        $this->expectPermission("ProdukcijskaHisa-read");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $uprizoritev = $em->getRepository("Produkcija\Entity\Uprizoritev")
                ->findOneById($uprizoritevId);

        if (!$uprizoritev) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni uprizoritve'), 1000931);
        }

        $optionR = $em->getRepository('App\Entity\Option');
        $option  = $optionR->findOneByName("application.tenant.maticnopodjetje");
        $sifra   = $option->getDefaultValue();      // šifra matičnega podjetja t.j. lastnega gledališča

        $phisaR = $em->getRepository('Produkcija\Entity\ProdukcijskaHisa');
        $phisa  = $phisaR->findOneBySifra($sifra);       // lastno gledališče

        $stroski        = $uprizoritev->getStroski();
        $lastnaSredstva = 0; //init
        if (!$stroski->isEmpty()) {
            $strval = $stroski->getValues();
            foreach ($strval as $su) {
                // preverjanje avtorizacije s kontekstom
                $this->expectPermission("StrosekUprizoritve-read", $su);

                $lastnaSredstva += $su->getVrednostDo();
            }
        }

        $matkoprColl = $uprizoritev->getKoprodukcije()
                ->filter(function($ent) use (&$sifra) {
            return $ent->getKoproducent()->getSifra() === $sifra;     //vrne  koprodukcijo lastnega gledališča
        });
        
        if ($matkoprColl->count()>1){
            throw new \Max\Exception\UnauthException($tr->translate('Obstaja več koprodukcij ('.$matkoprColl->count().') lastega gledališča '), 1000932);
        }
        
        
        if ($matkoprColl->isEmpty()) {
            $kopr = new \Produkcija\Entity\ProdukcijaDelitev();
            $em->persist($kopr);
        } else{
            $kopr=$matkoprColl->get(0);
        }

        // $$ polja bomo še izračunali, ko bomo vedli kako, npr. nas strosek je vsota vseh stroškov uprizoritve ad  #837
        $kopr->setOdstotekFinanciranja(0);
        $kopr->setNasStrosek(TRUE);
        $kopr->setLastnaSredstva($lastnaSredstva);        //$$ seštej vse stroške uprizoritve
        $kopr->setZaproseno(0);
        $kopr->setDrugiJavni(0);
        $kopr->setAvtorskih(0);
        $kopr->setTantiemi(0);
        $kopr->setSkupniStrosek(0); //$$ še za spremeniti
        $kopr->setZaprosenProcent(0); //$$ še za spremeniti
        $kopr->setKoproducent($phisa);
        $kopr->setUprizoritev($uprizoritev);

        // sedaj, ko imamo entitete ponovimo preverjanje avtorizacije zaradi morebitnega assert preverjanja!
        $this->expectPermission("Uprizoritev-read", $uprizoritev);
        $this->expectPermission("Option-read", $option);
        $this->expectPermission("ProdukcijaDelitev-write", $kopr);
        $this->expectPermission("ProdukcijskaHisa-read", $phisa);

        $em->flush();

        return $kopr->getId();
    }

}
