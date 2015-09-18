<?php

/*
 * Licenca GPL V3 or later
 *  
 */

namespace TestAssets\Task;


use Max\Exception\MaxException;
use Jobs\Annotation\Task as Task;
use Jobs\Task\AbstractPrinterTask;
use TestAssets\Entity\Dokument;
use TestAssets\Entity\Pozicija;


/**
 * Description of DocumentPrinterTask
 * @Task\Meta(name="Test Izpis dokumenta", acl="neki.permission")
 * @author boris
 */
class DokumentTestReport extends AbstractPrinterTask {

    /**
     * 
     * @var Dokument
     */
    protected $entity;
    
    
    public function taskBody() {
        $entities = [];

        $stor = new Dokument();
        $stor->setNaziv('Prevoz')
            ->setSifra('1233312 CCCCC');

        $err = $this->addDocumentReport('test-report', 'naziv report', $stor);
        if ($err) throw new \Exception($err);
        $err = $this->finishReport('xxxx');
        if ($err) throw new \Exception($err);
    }

    public function checkData() { 
        parent::checkData();
    }
}
