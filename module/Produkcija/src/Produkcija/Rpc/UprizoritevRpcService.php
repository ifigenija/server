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
    public function novaMaticnaKoprodukcija($uprizoritevId)
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

        //$$ rb psevdo koda:
//        sifra=opcija get maticno podjetje
//        preveri, če koprodukcija za sifro ze obstaja
//                - za vse uprizoritev.koprodukcije
//                    - ali obstaja taka s sifro?
//        ce ne obstaja
//           kreiraj koprodukcijo
//                inicializacija polj
//                   nas strosek   izracunamo kot vsoto stroskovuprizoritve.vrednostdo za to UprizoritevRpcService
//                   koproducent id je maticna produkcijska hisa
//                

        $optionR      = $em->getRepository('App\Entity\Option');
        $option       = $optionR->findOneByName("application.tenant.maticnopodjetje");
        $sifra        = $option->getDefaultValue();
   
        $koprodukcije = $uprizoritev->getKoprodukcije();
        if ($koprodukcije) {
            if ($koprodukcije->exists(function($key, $ent) use (&$sifra){
                        return $ent->getKoproducent()->getSifra() === $sifra;     //vrne true, če obstaja koprodukcija lastnega gledališča
                    })
            ) {
                throw new \Max\Exception\UnauthException($tr->translate('Uprizoritev že ima produkcijsko delitev za lastno gledališče'), 1000932);
            }
        }
        $phisaR = $em->getRepository('Produkcija\Entity\ProdukcijskaHisa');
        $phisa  = $phisaR->findOneBySifra($sifra);       // lastno gledališče
//        $strosekUprR = $em->getRepository('Produkcija\Entity\StrosekUprizoritve');
        $stroski= $uprizoritev->getStroski();
        
        

        $kopr = new \Produkcija\Entity\ProdukcijaDelitev();

        // $$ polja bomo še izračunali, ko bomo vedli kako, npr. nas strosek je vsota vseh stroškov uprizoritve ad  #837
        $kopr->setOdstotekFinanciranja(0);
        $kopr->setNasStrosek(TRUE);
        $kopr->setLastnaSredstva(0);        //$$ seštej vse stroške uprizoritve
        $kopr->setZaproseno(0);
        $kopr->setDrugiJavni(0);
        $kopr->setAvtorskih(0);
        $kopr->setTantiemi(0);
        $kopr->setSkupniStrosek(0); //$$ še za spremeniti
        $kopr->setZaprosenProcent(0);//$$ še za spremeniti
        $kopr->setKoproducent($phisa);
        $kopr->setUprizoritev($uprizoritev);

        $em->persist($kopr);


        // sedaj, ko imamo entiteti ponovimo preverjanje avtorizacije zaradi morebitnega assert preverjanja!
        $this->expectPermission("Uprizoritev-read", $uprizoritev);
//        $this->expectPermission("StrosekUprizoritve-read");       // $$ še implementirati
        $this->expectPermission("Option-read",$option);
        $this->expectPermission("ProdukcijaDelitev-write",$kopr);
        $this->expectPermission("ProdukcijskaHisa-read",$phisa);

        $em->flush();

        return $kopr->getId();
    }

}
