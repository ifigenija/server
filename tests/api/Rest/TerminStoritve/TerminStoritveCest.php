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
    private $obj1;
    private $obj2;
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

        /**
         * default status >=500s
         */
        $resp             = $I->successfullyGetList($this->dogodekUrl . "?zacetek=2000-01-01&konec=2200-05-05", []);
        $list             = $resp['data'];
        codecept_debug($list);
        $totRDEf          = $totR             = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(1, $totR, "default default");
        $this->objDogodek = $ent              = array_pop($list);
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


        /**
         * še preberi osebo od alternacije
         */
        $this->objAlternacija = $ent                  = $I->successfullyGet($this->alternacijaUrl, $this->lookAlternacija['id']);
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
        $data       = [
            'planiranZacetek' => '2021-02-01T00:00:00+0100',
            'planiranKonec'   => '2022-02-01T00:00:00+0100',
            'zacetek'         => '2023-02-01T00:00:00+0100',
            'konec'           => '2024-02-01T00:00:00+0100',
            'planiranoTraja'  => 1.23,
            'dogodek'         => $this->objDogodek['id'],
            'alternacija'     => $this->lookAlternacija['id'],
// pri alternaciji osebo sam priredi
//            'oseba'           => $this->lookOseba['id'],
            'dezurni'         => null,
            'gost'            => null,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
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
//            'oseba'           => $this->lookOseba['id'],
            'dezurni'         => null,
            'gost'            => null,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['planiranoTraja'], 4.56);


        /**
         * kreiramo dežurnega
         */
        $data       = [
            'planiranZacetek' => '2005-02-11T00:00:00+0100',
            'planiranKonec'   => '2006-02-11T00:00:00+0100',
            'zacetek'         => '2007-02-11T00:00:00+0100',
            'konec'           => '2008-02-11T00:00:00+0100',
            'planiranoTraja'  => 3.56,
            'dogodek'         => $this->objDogodek['id'],
            'alternacija'     => null,
            'oseba'           => $this->lookOseba['id'],
            'dezurni'         => true,
            'gost'            => false,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        /**
         * kreiramo gosta
         */
        $data = [
            'planiranZacetek' => '2005-12-11T00:00:00+0100',
            'planiranKonec'   => '2006-12-11T00:00:00+0100',
            'zacetek'         => '2007-12-11T00:00:00+0100',
            'konec'           => '2008-12-11T00:00:00+0100',
            'planiranoTraja'  => 3.56,
            'dogodek'         => $this->objDogodek['id'],
            'alternacija'     => null,
            'oseba'           => $this->lookOseba['id'],
            'dezurni'         => false,
            'gost'            => true,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
        codecept_debug($resp);
        $totRec = $resp['state']['totalRecords'];
        codecept_debug($totRec);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertEquals("2005-02-01T00:00:00+0100", $list[0]['planiranZacetek']);
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
        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 7.89;

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

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
        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);

        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['planiranZacetek'], '2021-02-01T00:00:00+0100');
        $I->assertEquals($ent['planiranKonec'], '2022-02-01T00:00:00+0100');
        $I->assertEquals($ent['zacetek'], '2023-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2024-02-01T00:00:00+0100');
        $I->assertEquals($ent['planiranoTraja'], 7.89);
        $I->assertEquals($ent['dogodek'], $this->objDogodek['id']);
        $I->assertEquals($ent['alternacija'], $this->objAlternacija['id']);
        $I->assertEquals($ent['oseba'], $this->objAlternacija['oseba']['id']);
        $I->assertEquals($ent['dezurni'], null);
        $I->assertEquals($ent['gost'], null);

        /**
         * preberemo dežurnega
         */
        $ent = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertEquals($ent['alternacija'], null);
        $I->assertEquals($ent['oseba'], $this->lookOseba['id']);
        $I->assertEquals($ent['dezurni'], true);
        $I->assertEquals($ent['gost'], false);
    }

    /**
     * spremenim zapis za kontrolo validacije
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZaValidacijo(ApiTester $I)
    {
        /**
         * ne more hkrati biti alternacija in dežurni
         */
        $ent            = $this->obj1;
        $ent['dezurni'] = true;
        $resp           = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1001080, $resp[0]['code']);

        // neskladnost gost in alternacija
        $ent            = $this->obj1;
        $ent['dezurni'] = false;
        $ent['gost']    = true;
        $resp           = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1001080, $resp[0]['code']);

        // niti alternacija niti gost niti dežurni
        $ent                = $this->obj1;
        $ent['dezurni']     = false;
        $ent['gost']        = false;
        $ent['alternacija'] = null;
        $resp               = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1001080, $resp[0]['code']);
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
        $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
    }

}
