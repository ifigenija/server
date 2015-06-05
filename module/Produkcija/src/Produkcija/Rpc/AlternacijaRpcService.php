<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Rpc;

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
     * @param string $alternacija_id
     * 
     * @returns pogodba id (ali celi objekt od pogodbe)  ali ?false  , če ne uspe $$
     */
    public function novaPogodba($alternacijaId)
    {
        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $alternacija = $em->getRepository("Produkcija\Entity\Alternacija")
                ->findOneById($alternacijaId);
        if (!$alternacija) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni alternacije'), 1000911);
        }

        if ($alternacija->getPogodba()) {
            throw new \Max\Exception\UnauthException($tr->translate('Alternacija že ima pogodbo'), 1000912);
        }

        $pogodba = new \Produkcija\Entity\Pogodba();


        // vse vrednosti na 0
        $pogodba->setVrednostDo(0);
        $pogodba->setVrednostDo(0);
        $pogodba->setVrednostVaje(0);
        $pogodba->setVrednostPredstave(0);
        $pogodba->setVrednostUre(0);
        $pogodba->setVrednostDoPremiere(0);
        $pogodba->setOseba($alternacija->getOseba());
        
        $pogodbaR=$em->getRepository("Produkcija\Entity\Pogodba")
                        ->setServiceLocator($this->getServiceLocator());
        $pogodbaR->create($pogodba);           //da kreira tudi šifro

        $alternacija->setPogodba($pogodba);

        $em->flush();

        return $this->getPogodbaData($pogodba); //$$ ali to v redu?
    }

    /**
     * Vrne podatke o pogodbi pripravljene za pošiljanje na klienta
     * 
     * @param \Produkcija\Entity\Pogodba $pogodba
     */
    protected function getPogodbaData($pogodba)
    {

        return [
            'id'                 => $pogodba->getId(),
            'sifra'              => $pogodba->getSifra(),
            'vrednostDo'         => $pogodba->getVrednostDo(),
            'zacetek'            => $pogodba->getZacetek(),
            'konec'              => $pogodba->getKonec(),
            'vrednostVaje'       => $pogodba->getVrednostVaje(),
            'vrednostPredstave'  => $pogodba->getVrednostPredstave(),
            'vrednostUre'        => $pogodba->getVrednostUre(),
            'vrednostDoPremiere' => $pogodba->getVrednostDoPremiere(),
            'aktivna'            => $pogodba->getAktivna(),
            'zaposlenVDrJz'      => $pogodba->getZaposlenVDrJz(),
            'opis'               => $pogodba->getOpis(),
            'alternacije'        => $pogodba->getAlternacije(),
            'oseba'              => $pogodba->getOseba(),
            'popa'               => $pogodba->getPopa(),
            'id'                 => $pogodba->getTrr(),
        ];
    }

}
