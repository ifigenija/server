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
class PonovnoKreirajDveVajiCest
{

    private $restUrl        = '/rest/vaja';
    private $dogodekUrl     = '/rest/dogodek';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $obj;
    private $objVaja2;
    private $objDogodek;
    private $objUprizoritev;
    private $lookUprizoritev;

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
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev = $look                  = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'zaporedna'   => 1,
            'porocilo'    => 'zz',
            'dogodek'     => null, // najprej mora biti kreirana vaja, šele potem dogodek.
            'uprizoritev' => $this->lookUprizoritev['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['porocilo'], 'zz');

        // kreiramo še en zapis
        $data           = [
            'zaporedna'   => 2,
            'porocilo'    => 'aa',
            'dogodek'     => null, //najprej mora biti kreirana vaja, šele potem dogodek.
            'uprizoritev' => $this->lookUprizoritev['id'],
        ];
        $this->objVaja2 = $ent            = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['porocilo'], 'aa');
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefaultPoUprizoritvi(ApiTester $I)
    {
        $resp   = $I->successfullyGetList($this->restUrl . "?uprizoritev=" . $this->lookUprizoritev['id'], []);
        $list   = $resp['data'];
        $totRec = $resp['state']['totalRecords'];
        codecept_debug($list);
        $I->assertEquals(2, $resp['state']['totalRecords'], "mora isti število kot pri prejšnjem testu KreirajDveVajiCest");
    }
}
