<?php

namespace App\Task;

use Jobs\Task\AbstractPrinterTask;

abstract class IfiPrinterTask
        extends AbstractPrinterTask
{
    /**
     * Vrne naziv matičnega gledališča
     *
     * @return Popa
     */
    public function getFirma()
    {
        $em        = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');
        $repo      = $em->getRepository('App\Entity\Option');
        $option    = $repo->findOneByName("application.tenant.maticnopodjetje");
        $matGledId = $option->getDefaultValue();
        $repo      = $em->getRepository('App\Entity\Popa');
        return $repo->findOneBySifra($matGledId);
    }
    
}
