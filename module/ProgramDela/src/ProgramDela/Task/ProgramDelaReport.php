<?php

namespace ProgramDela\Task;

use Max\Exception\MaxException;
use ProgramDela\Entity\ProgramDela;

use Jobs\Annotation\Task as Task;

/**
 * Task za izpis reporta dobavnice
 *
 *  @Task\Meta(name="Dobavnica", acl="Logistika-DokumentDobavnica-read")
 */
class DobavnicaReport extends AbstractPrinterTask {

    /**
     *
     * @var ProgramDela
     */
    protected $entity;


    public function taskBody() {

        $title = ["Program dela","{$this->entity->getStevilka()}"];
        $this->addDocumentReport($title, $this->entity);
    }

    public function checkData() {
        $rep = $this->em->getRepository('\ProgramDela\Entity\ProgramDela');
        $this->entity = $rep->find($this->data['id']);

        if (!$this->entity) {
            throw new MaxException('Programdela ne obstaja', 1000688);
        }
    }
}