<?php

/*
 *  Licenca GPLv3
 */

namespace InitBaze;

use ApiTester;
use Codeception\Module;

/**
 * Description of PonovnoKreirajDveVajiCest
 * 
 * predvidevamo, da se je pred tem izvedel test KreirajDveVajiCest
 * 
 * ponovno kreiramo 2 zapisa  preverio število vseh zapisov  
 *   - pričakujemo enako število, če smo uspeli pred tem inicializirati bazo
 *   
 * @author rado
 */
class PonovnoKreirajDvaTipaVajeCest
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
     * inicializira bazo  glede na DumpFunctional.sql
     * 
     * 
     * @param ApiTester $I
     */
    public function initBaze(ApiTester $I)
    {
        $I->initDB();
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
        $I->assertEquals(17, $resp['state']['totalRecords']);
    }

}
