<?php

namespace ProgramDela\Task;

use Jobs\Task\AbstractPrinterTask;
use Max\Exception\MaxException;
use ProgramDela\Entity\ProgramDela;

use Jobs\Annotation\Task as Task;

/**
 * Task za izpis reporta dobavnice
 *
 *  @Task\Meta(name="Program dela", acl="ProgramDela-write")
 */
class ProgramDelaReport extends AbstractPrinterTask {

    /**
     *
     * @var ProgramDela
     */
    protected $entity;


    public function taskBody() {

        $title = "Program dela " . $this->entity->getSifra();
        $this->addDocumentReport('program-dela', $title, $this->entity);

        $this->finishReport($title);
    }

    public function checkData() {
        parent::checkData();
        $rep = $this->em->getRepository('\ProgramDela\Entity\ProgramDela');
        $this->entity = $rep->find($this->data['id']);

        if (!$this->entity) {
            throw new MaxException('Programdela ne obstaja', 1000688);
        }
    }
}