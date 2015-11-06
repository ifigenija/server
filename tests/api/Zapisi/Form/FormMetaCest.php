<?php

namespace module\Vfs\Form;

use ApiTester;
use FormMetaTester;

/*
 * Licenca GPL V3 or later
 *  
 */

/**
 * 
 * Form meta testi za tehnologijo
 * @author boris
 */
class FormMetaCest
    extends FormMetaTester
{

    public function formMetaVfsDatoteka(ApiTester $I)
    {
        $this->testFormOptions('datoteka');
    }

    public function formMetaVfsPriponka(ApiTester $I)
    {
        $this->testFormOptions('zapis');
    }

    public function formMetaVfsMapa(ApiTester $I)
    {
        $this->testFormOptions('mapa');
    }

    public function formMetaVfsMapaAcl(ApiTester $I)
    {
        $this->testFormOptions('mapaAcl');
    }

  
}
