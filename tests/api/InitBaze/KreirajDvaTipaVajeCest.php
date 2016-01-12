<?php

/*
 *  Licenca GPLv3
 */

namespace InitBaze;

use ApiTester;

/**
 * Description of InitBazeVajaCest
 * 
 * reiramo 2 zapisain preverio število vseh zapisov 
 *
 * @author rado
 */
class KreirajDvaTipaVajeCest
{

    private $restUrl = '/rest/tipvaje';
    private $obj1;
    private $obj2;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'sifra' => '9000',
            'ime'   => 'zz',
            'opis'  => 'znd',
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data       = [
            'sifra' => '02',
            'ime'   => 'aa',
            'opis'  => 'and',
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp   = $I->successfullyGetList($this->restUrl, []);
        $list   = $resp['data'];
        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertEquals(20, $resp['state']['totalRecords']);
    }

}
