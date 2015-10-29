<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramPremiera;

use ApiTester;

class FormMetaCest
        extends \Test\FormMetaTester
{

    public function testForm(\ApiTester $I)
    {
        $this->testFormOptions('programpremiera');
    }

}
