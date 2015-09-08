<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\TerminStoritve;

use ApiTester;

/**
 * Description of TerminStoritveCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - dogodek
 *      - alternacija
 *      - oseba
 *      getlist različne variante relacij
 *      - vse
 *      - alternacija
 * 
 * @author rado
 */
class TerminStoritveCest
{

    private $restUrl              = '/rest/terminstoritve';
    private $osebaUrl             = '/rest/oseba';
    private $alternacijaUrl       = '/rest/alternacija';
    private $dogodekUrl           = '/rest/dogodek';
    private $vajaUrl              = '/rest/vaja';
    private $obj;
    private $objOseba;
    private $lookOseba;
    private $objVaja;
    private $objDogodek;
    private $objAlternacija;
    private $lookAlternacija;
    private $funkcijaUrl          = '/rest/funkcija';
    private $lookFunkcija;
    private $lookupAlternacijaUrl = '/lookup/alternacija';

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * @param ApiTester $I
     */
    public function lookupFunkcijo(ApiTester $I)
    {
        $this->lookFunkcija = $look               = $I->lookupEntity("funkcija", "Tezej", false);
        codecept_debug($look);
        $I->assertNotEmpty($look);
    }

    /**
     * 
     * @param ApiTester $I
     */
//    public function createVajo(ApiTester $I)
//    {
//        $data          = [
//            'zaporedna'   => 1,
//            'porocilo'    => 'zz',
//            'dogodek'     => null, //$$rb najprej mora biti kreirana vaja, šele potem dogodek.
//            'uprizoritev' => null,
//        ];
//        $this->objVaja = $ent           = $I->successfullyCreate($this->vajaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['porocilo'], 'zz');
//    }

    /**
     * @param ApiTester $I
     */
    public function getListDogodek(ApiTester $I)
    {
        $resp             = $I->successfullyGetList($this->dogodekUrl, []);
        $list             = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objDogodek = $ent              = array_pop($list);
        $I->assertNotEmpty($ent);
    }

    /**
     * 
     * @depends createVajo
     * @param ApiTester $I
     */
//    public function createDogodek(ApiTester $I)
//    {
//        $data             = [
//            'planiranZacetek' => '2011-02-01T00:00:00+0100',
//            'zacetek'         => '2012-02-01T00:00:00+0100',
//            'konec'           => '2013-02-01T00:00:00+0100',
//            'status'          => 1,
//            'razred'          => null,
//            'termin'          => null,
//            'ime'             => null,
//            'predstava'       => null,
//            'zasedenost'      => null,
//            'vaja'            => $this->objVaja['id'],
//            'gostovanje'      => null,
//            'dogodekIzven'    => null,
//            'prostor'         => null,
//            'sezona'          => null,
//        ];
//        $this->objDogodek = $ent              = $I->successfullyCreate($this->dogodekUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['status'], 1);
//    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba = $ent             = $I->lookupEntity("oseba", "0006", false);
        $I->assertNotEmpty($ent);
    }

    /**
     *  kreiramo  osebo
     * 
     * @param ApiTester $I
     */
//    public function createOsebo(ApiTester $I)
//    {
//        $data = [
//            'naziv'         => 'zz',
//            'ime'           => 'zz',
//            'priimek'       => 'zz',
//            'funkcija'      => 'zz',
//            'srednjeIme'    => 'zz',
//            'psevdonim'     => 'zz',
//            'email'         => 'x@xxx.xx',
//            'datumRojstva'  => '1973-28-03T04:30:00',
//            'emso'          => 'ZZ',
//            'davcna'        => 'ZZ123',
//            'spol'          => 'M',
//            'opombe'        => 'zz',
//            'drzavljanstvo' => 'zz',
//            'drzavaRojstva' => 'zz',
//            'krajRojstva'   => 'zz',
//            'user'          => null,
//        ];
//
//        $this->objOseba = $oseba          = $I->successfullyCreate($this->osebaUrl, $data);
//
//        $I->assertEquals('zz', $oseba['ime']);
//        $I->assertNotEmpty($oseba['id']);
//    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupAlternacija(ApiTester $I)
    {
        // igralec
        $resp                  = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0001', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija = $resp['data'][0];
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * 
     * @param ApiTester $I
     */
//    public function createAlternacijo(ApiTester $I)
//    {
//        $data                 = [
//            'zaposlen'     => true,
//            'funkcija'     => $this->lookFunkcija['id'],
//            'sodelovanje'  => NULL,
//            'oseba'        => $this->lookOseba['id'],
//            'koprodukcija' => NULL,
//            'pogodba'      => NULL,
//        ];
//        $this->objAlternacija = $ent                  = $I->successfullyCreate($this->alternacijaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['zaposlen'], true);
//    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupOsebo
     * @depends lookupAlternacija
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'planiranZacetek' => '2021-02-01T00:00:00+0100',
            'planiranKonec'   => '2022-02-01T00:00:00+0100',
            'zacetek'         => '2023-02-01T00:00:00+0100',
            'konec'           => '2024-02-01T00:00:00+0100',
            'planiranoTraja'  => 1.23,
            'dogodek'         => $this->objDogodek['id'],
            'alternacija'     => $this->lookAlternacija['id'],
            'oseba'           => $this->lookOseba['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['planiranoTraja'], 1.23);

        // kreiramo še en zapis
        $data = [
            'planiranZacetek' => '2005-02-01T00:00:00+0100',
            'planiranKonec'   => '2006-02-01T00:00:00+0100',
            'zacetek'         => '2007-02-01T00:00:00+0100',
            'konec'           => '2008-02-01T00:00:00+0100',
            'planiranoTraja'  => 4.56,
            'dogodek'         => $this->objDogodek['id'],
            'alternacija'     => $this->lookAlternacija['id'],
            'oseba'           => $this->lookOseba['id'],
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['planiranoTraja'], 4.56);
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $resp   = $I->successfullyGetList($this->restUrl, []);
        $list   = $resp['data'];
        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertEquals("2005-02-01T00:00:00+0100", $list[0]['ime']);
        $I->assertEquals("2021-02-01T00:00:00+0100", $list[$totRec - 1]['planiranZacetek']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getListVse(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "/vse";
//        codecept_debug($listUrl);
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent                   = $this->obj;
        $ent['planiranoTraja'] = 7.89;

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($ent['planiranoTraja'], 7.89);
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['planiranZacetek'], '2021-02-01T00:00:00+0100');
        $I->assertEquals($ent['planiranKonec'], '2022-02-01T00:00:00+0100');
        $I->assertEquals($ent['zacetek'], '2023-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2024-02-01T00:00:00+0100');
        $I->assertEquals($ent['planiranoTraja'], 7.89);
        $I->assertEquals($ent['dogodek'], $this->objDogodek['id']);
        $I->assertEquals($ent['alternacija'], $this->lookAlternacija['id']);
        $I->assertEquals($ent['oseba'], $this->lookOseba['id']);
    }

    /**
     * Seznam, ki ga rabi inšpecient oz. vodja tehnike, ko vnaša ure za nek dogodek
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function getListUre(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "/ure?dogodek=" . $this->objDogodek['id'];
//        codecept_debug($listUrl);
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
//    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
