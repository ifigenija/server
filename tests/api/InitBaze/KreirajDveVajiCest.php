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
class KreirajDveVajiCest
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
        $I->assertEquals(2, $resp['state']['totalRecords']);
    }

}
