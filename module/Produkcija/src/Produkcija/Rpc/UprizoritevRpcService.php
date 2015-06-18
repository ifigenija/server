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
    public function novaPogodba($uprizoritevId)
    {
        // preverjanje avtorizacije
        $this->expectPermission("Uprizoritev-read");
        $this->expectPermission("StrosekUprizoritve-read");
        $this->expectPermission("Option-read");
        $this->expectPermission("ProdukcijaDelitev-write");

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
                
                
        
        
        if ($uprizoritev->get()) {
            throw new \Max\Exception\UnauthException($tr->translate('Uprizoritev že ima produkcijsko delitev za lastno gledališče'), 1000932);
        }

        $koprodukcija = new \Produkcija\Entity\Pogodba();


        // vse vrednosti na 0
        $koprodukcija->setVrednostDo(0);
        $koprodukcija->setVrednostDo(0);
        $koprodukcija->setVrednostVaje(0);
        $koprodukcija->setVrednostPredstave(0);
        $koprodukcija->setVrednostUre(0);
        $koprodukcija->setVrednostDoPremiere(0);
        $koprodukcija->setOseba($uprizoritev->getOseba());

        $koprodukcijaR = $em->getRepository("Produkcija\Entity\Pogodba")
                ->setServiceLocator($this->getServiceLocator());
        $koprodukcijaR->create($koprodukcija);           //da kreira tudi šifro
 // create vključuje tudi persist

        $uprizoritev->setPogodba($koprodukcija);

        // sedaj, ko imamo entiteti ponovimo preverjanje avtorizacije zaradi morebitnega assert preverjanja!
        $this->expectPermission("Pogodba-write", $koprodukcija);
        $this->expectPermission("Uprizoritev-write", $uprizoritev);

        $em->flush();

        return $koprodukcija->getId();
    }

}
