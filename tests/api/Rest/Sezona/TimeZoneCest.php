<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Sezona;

use ApiTester;

/**
 * preverjam pretvorbe časov različnih time zon
 * 
 * @author rado
 */
class TimeZoneCest
{

    private $restUrl         = '/rest/sezona';
    private $dogodekUrl      = '/rest/dogodek';
    private $vajaUrl         = '/rest/vaja';
    private $obj;
    private $obj2;
    private $obj3;
    private $objDogodek1;
    private $objDogodek2;
    private $objVaja1;
    private $objVaja2;
    private $lookupSezonaUrl = '/lookup/sezona';
    private $lookUprizoritev1;
    private $lookUprizoritev2;

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
        // timezona Berlin
        $data       = [
            'sifra'   => '999',
            'ime'     => 'aa',
            'zacetek' => '2023-02-01T00:00:00+0100',
            'konec'   => '2024-02-01T00:00:00+0100',
            'aktivna' => true,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['ime'], 'aa');

        // timezone utc
        $data       = [
            'sifra'   => '991',
            'ime'     => 'bb',
            'zacetek' => '2015-09-14T00:00:00.000Z', //isto kot se na klientu pošilja
            'konec'   => '2015-09-20T00:00:00.000Z',
            'aktivna' => true,
        ];
        $this->obj3 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
//        $I->assertEquals($ent['zacetek'], '2015-09-14T00:00:00+0000');  //konec spremenjen v +0000
        $I->assertEquals($ent['zacetek'], '2015-09-14T02:00:00+0200',"po post setterju");  //če v setterju
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function readDatum(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj3['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['zacetek'], '2015-09-14T00:00:00+0200');  //konec spremenjen v +0200
 
        $ent = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertEquals($ent['zacetek'], '2023-02-01T00:00:00+0100');

    }

    /**
     * sprobam z utc časom
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function datumVUtc(ApiTester $I)
    {
        $ent            = $this->obj2;
        $ent['zacetek'] = '2015-09-14T00:00:00.000Z'; //utc

        $this->obj2 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        codecept_debug($entR);
//        $I->assertEquals($entR['zacetek'], '2015-09-14T00:00:00+0000', "utc");  // tudi po update /PUT je response +0000
        $I->assertEquals($entR['zacetek'], '2015-09-14T02:00:00+0200', "cest setter");  // 

        $ent = $I->successfullyGet($this->restUrl, $ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['zacetek'], '2015-09-14T00:00:00+0200', "po get cest");   // tudi sedaj po getu vrne +0200
    }

}
