<?php

namespace Rest\Generalno;

use \ApiTester;

class EnabledDisabledCest
{

    private $permUrl = '/rest/permission';

    public function _before(ApiTester $I)
    {
        
    }

    public function _after(ApiTester $I)
    {
        
    }

    // tests
    public function updateMethodDisabled(ApiTester $I)
    {
        $err = $I->failToUpdate($this->permUrl, '00000000-0000-0000-0000-000000000000', []);
        $words = explode(" ", $err['message']);
        $I->assertEquals('disabled', array_pop($words));
    }

    // tests
    public function deleteMethodDisabled(ApiTester $I)
    {
        $err = $I->failToDelete($this->permUrl, '00000000-0000-0000-0000-000000000000');
        $words = explode(" ", $err['message']);
        $I->assertEquals('disabled', array_pop($words));
    }

    // tests
    public function createMethodDisabled(ApiTester $I)
    {
        $err = $I->failToCreate($this->permUrl, '00000000-0000-0000-0000-000000000000', ['name' => "xxxx"]);
        $words = explode(" ", $err['message']);
        $I->assertEquals('disabled', array_pop($words));
    }

}
