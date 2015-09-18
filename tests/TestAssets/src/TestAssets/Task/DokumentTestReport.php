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
    }

    public function checkData() { 
        parent::checkData();
    }
}
