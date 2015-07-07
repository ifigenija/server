<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Rpc;

use Zend\View\Model\JsonModel;

/**
 * Description of ProgramDelaRpcService
 *
 * @author rado
 */
class ProgramDelaRpcService
        extends \Max\Service\AbstractMaxService
{

    /**
     * Kreiranje nove koprodukcije za lastno gledališče za določeno enoto programa
     * 
     * 
     * @param string $programDelaId
     * 
     * @returns boolean     uspeh 
     */
    public function zakleni($programDelaId)
    {
        // preverjanje avtorizacije
        $this->expectPermission("ProgramDela-write");
        $this->expectPermission("ProgramDela-lock");

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $tr = $this->getServiceLocator()->get('translator');

        $programDela = $em->getRepository("ProgramDela\Entity\ProgramDela")
                ->findOneById($programDelaId);

        if (!$programDela) {
            throw new \Max\Exception\UnauthException($tr->translate('Ni enote programa'), 1000961);
        }

        $programDela->setZakljuceno(true);           // tu nastavimo novo vrednost

        $programDela->validate();

        // sedaj, ko imamo entitete ponovimo preverjanje avtorizacije zaradi morebitnega assert preverjanja!
        $this->expectPermission("ProgramDela-write", $programDela);
        $this->expectPermission("ProgramDela-lock",$programDela);

        $em->flush();

        return true;
    }

}
