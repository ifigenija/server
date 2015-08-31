<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Dogodek;

use ApiTester;

/**
 * Description of DogodekCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto
 * 
 * relacije z drugimi entitetami
 *      - predstava
 *      - zasedenost
 *      - vaja
 *      - gostovanje
 *      - dogodekIzven : narejeno pri dogodekIzvenCest
 *      - prostor
 *      - arhiv                      O2M
 *      - terminiStoritve            O2M
 *      - prodajaPredstave           $$ zaenkrat ne delamo prodaje
 *      - sezona
 * 
 *      getlist različne variante relacij
 *      - vse
 *      - sezona
 * 
 * @author rado
 */
class DogodekCest
{

    private $restUrl           = '/rest/dogodek';
    private $predstavaUrl      = '/rest/predstava';
    private $zasedenostUrl     = '/rest/zasedenost';
    private $vajaUrl           = '/rest/vaja';
    private $gostovanjeUrl     = '/rest/gostovanje';
    private $dogodekIzvenUrl   = '/rest/dogodekIzven';
    private $dogodekUrl        = '/rest/dogodek';
    private $prostorUrl        = '/rest/prostor';
    private $sezonaUrl         = '/rest/sezona';
    private $drzavaUrl         = '/rest/drzava';
    private $arhivalijaUrl     = '/rest/arhivalija';
    private $terminStoritveUrl = '/rest/terminstoritve';
    private $osebaUrl          = '/rest/oseba';
    private $obj;
    private $objPredstava;
    private $objZasedenost;
    private $objVaja;
    private $objGostovanje;
    private $objDogodekIzven;
    private $objDogodek1;
    private $obj2;
    private $objProstor;
    private $lookProstor;
    private $objSezona;
    private $objDrzava;
    private $objArhivalija1;
    private $objArhivalija2;
    private $objTerminStoritve1;
    private $objTerminStoritve2;
    private $objOseba1;
    private $objOseba2;
    private $lookOseba1;
    private $lookOseba2;

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
    public function lookupProstor(ApiTester $I)
    {
//        $this->lookProstor = $ent               = $I->lookupEntity("prostor", "0006", false);
        $ent = $I->lookupEntity("prostor", "0006", false);
        $I->assertTrue(TRUE);
        $I->assertNotEmpty($ent);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba1 = $ent              = $I->lookupEntity("oseba", "0006", false);
        $I->assertNotEmpty($ent);

        $this->lookOseba2 = $ent              = $I->lookupEntity("oseba", "0007", false);
        $I->assertNotEmpty($ent);
    }

    /**
     *  napolnimo vsaj en zapis
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
//        $this->objOseba1 = $oseba           = $I->successfullyCreate($this->osebaUrl, $data);
//
//        $I->assertEquals('zz', $oseba['ime']);
//        $I->assertNotEmpty($oseba['id']);
//    }

    /**
     * 
     * @param ApiTester $I
     */
    public function createVajo(ApiTester $I)
    {
        $data          = [
            'zaporedna'   => 1,
            'porocilo'    => 'zz',
            'dogodek'     => null, //najprej mora biti kreirana vaja, šele potem dogodek.
            'uprizoritev' => null,
        ];
        $this->objVaja = $ent           = $I->successfullyCreate($this->vajaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['porocilo'], 'zz');
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function createSezono(ApiTester $I)
    {
        $data            = [
            'ime'     => 'zz',
            'zacetek' => '2010-02-01T00:00:00+0100',
            'konec'   => '2011-02-01T00:00:00+0100',
            'aktivna' => true,
        ];
        $this->objSezona = $ent             = $I->successfullyCreate($this->sezonaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['ime'], 'zz');
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function createPredstavo(ApiTester $I)
    {
        $data               = [
            'dogodek'     => NULL,
            'uprizoritev' => NULL,
            'gostovanje'  => NULL,
            'gostujoca'   => NULL,
        ];
        $this->objPredstava = $ent                = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['gostujoca'], null);

        // kreiramo še en zapis
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function createZasedenost(ApiTester $I)
    {
        $data                = [
            'dogodek' => null,
        ];
        $this->objZasedenost = $ent                 = $I->successfullyCreate($this->zasedenostUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['dogodek'], null);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function createDrzavo(ApiTester $I)
    {
        $data            = [
            'sifra'     => 'XX',
            'sifraDolg' => 'xx',
            'isoNum'    => 'xx',
            'isoNaziv'  => 'xx',
            'naziv'     => 'xx',
        ];
        $this->objDrzava = $ent             = $I->successfullyCreate($this->drzavaUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function createGostovanje(ApiTester $I)
    {
        $data                = [
            'vrsta'   => 'zz',
            'dogodek' => null,
            'drzava'  => $this->objDrzava['id'],
        ];
        $this->objGostovanje = $ent                 = $I->successfullyCreate($this->gostovanjeUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['vrsta'], 'zz');

        // kreiramo še en zapis
        $data = [
            'vrsta'   => 'aa',
            'dogodek' => null,
            'drzava'  => $this->objDrzava['id'],
        ];
        $ent  = $I->successfullyCreate($this->gostovanjeUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['vrsta'], 'aa');
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
//    public function createProstor(ApiTester $I)
//    {
//        $data             = [
//            'ime'          => 'zz',
//            'jePrizorisce' => true,
//            'kapaciteta'   => 1,
//            'opis'         => 'zz',
//        ];
//        $this->objProstor = $ent              = $I->successfullyCreate($this->prostorUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//        codecept_debug($ent);
//        $I->assertEquals($ent['ime'], 'zz');
//    }

    /**
     *  kreiramo zapis
     * 
     * @depends createVajo
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => 1,
            'razred'          => 'zz',
            'termin'          => 'zz',
            'title'             => 'zz',
            'predstava'       => null,
            'zasedenost'      => $this->objZasedenost['id'],
            'vaja'            => $this->objVaja['id'],
            'gostovanje'      => null,
            'dogodekIzven'    => null,
            'prostor'         => $this->lookProstor['id'],
            'sezona'          => $this->objSezona['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['status'], 1);


        // kreiramo še en zapis
        $data       = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => 4,
            'razred'          => 'aa',
            'termin'          => 'aa',
            'title'             => 'aa',
            'predstava'       => $this->objPredstava['id'],
            'zasedenost'      => null,
            'vaja'            => null,
            'gostovanje'      => null,
            'dogodekIzven'    => null,
            'prostor'         => null,
            'sezona'          => $this->objSezona['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['status'], 4);
    }

  
    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecTerminovStorive(ApiTester $I)
    {
        $data                     = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'planiranKonec'   => '2012-02-01T00:00:00+0100',
            'zacetek'         => '2013-02-01T00:00:00+0100',
            'konec'           => '2014-02-01T00:00:00+0100',
            'planiranoTraja'  => 1.23,
            'dogodek'         => $this->obj2['id'],
            'alternacija'     => null,
            'oseba'           => $this->lookOseba1['id'],
        ];
        $this->objTerminStoritve1 = $ent                      = $I->successfullyCreate($this->terminStoritveUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['planiranoTraja'], 1.23);

        // kreiramo še en zapis
        $data                     = [
            'planiranZacetek' => '2015-02-01T00:00:00+0100',
            'planiranKonec'   => '2016-02-01T00:00:00+0100',
            'zacetek'         => '2017-02-01T00:00:00+0100',
            'konec'           => '2018-02-01T00:00:00+0100',
            'planiranoTraja'  => 4.56,
            'dogodek'         => $this->obj2['id'],
            'alternacija'     => null,
            'oseba'           => $this->lookOseba2['id'],
        ];
        $this->objTerminStoritve2 = $ent                      = $I->successfullyCreate($this->terminStoritveUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['planiranoTraja'], 4.56);
    }

    /**
     * preberi vse zapise
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function getListPoSezoni(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "?sezona=" . $this->objSezona['id'];
//
//        $resp = $I->successfullyGetList($listUrl, []);
//        $list = $resp['data'];
//        codecept_debug($resp);
//
//        $I->assertEquals(2, $resp['state']['totalRecords']);
//        $I->assertNotEmpty($list);
////        $I->assertEquals("xx", $list[0]['status']);      // odvisno od sortiranja
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl;
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//        $I->assertEquals("zz", $list[0]['status']);      //glede na sort
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent           = $this->obj;
        $ent['status'] = 3;

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['status'], 3);
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
        $I->assertEquals($ent['planiranZacetek'], '2011-02-01T00:00:00+0100');
        $I->assertEquals($ent['zacetek'], '2012-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2013-02-01T00:00:00+0100');
        $I->assertEquals($ent['status'], 3);
        $I->assertEquals($ent['razred'], 'zz');
        $I->assertEquals($ent['termin'], 'zz');
        $I->assertEquals($ent['title'], 'zz');
        $I->assertEquals($ent['predstava'], null);
        $I->assertEquals($ent['zasedenost'], $this->objZasedenost['id']);
        $I->assertEquals($ent['vaja'], $this->objVaja['id']);
        $I->assertEquals($ent['gostovanje'], null);
        $I->assertEquals($ent['dogodekIzven'], null);
        $I->assertEquals($ent['prostor'], $this->lookProstor['id']);
        $I->assertEquals($ent['sezona'], $this->objSezona['id']);

        $I->assertTrue(isset($ent['terminiStoritve']));
        $I->assertTrue(isset($ent['prodajaPredstave']));

        $I->assertEquals(0, count($ent['terminiStoritve']));
        $I->assertEquals(0, count($ent['prodajaPredstave']));
    }

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

    /**
     * test validacije
     * 
     * @param ApiTester $I
     */
    public function createDogodekValidacija(ApiTester $I)
    {
//        $this->expect($this->vaja || $this->predstava, "Vaja ali predstava sta obvezna", 1000361);
//        $this->expect(!($this->vaja && $this->predstava), "Dogodek je lahko le samo vaja ali samo predstava", 1000362);
        // validacija 
        $data = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => 6,
            'razred'          => 'cc',
            'termin'          => 'cc',
            'title'             => 'cc',
            'predstava'       => null,
            'zasedenost'      => null,
            'vaja'            => null,
            'gostovanje'      => null,
            'dogodekIzven'    => null,
            'prostor'         => null,
            'sezona'          => $this->objSezona['id'],
        ];

        // test validacije - obstajati mora ali uprizoritev ali dogodek
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000361, $resp[0]['code']);

        // validacija 
        $data = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => 7,
            'razred'          => 'dd',
            'termin'          => 'dd',
            'title'             => 'dd',
            'predstava'       => $this->objPredstava['id'],
            'zasedenost'      => null,
            'vaja'            => $this->objVaja['id'],
            'gostovanje'      => null,
            'dogodekIzven'    => null,
            'prostor'         => null,
            'sezona'          => $this->objSezona['id'],
        ];

        // test validacije - obstajati mora ali uprizoritev ali dogodek
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000362, $resp[0]['code']);
    }

    /**
     * preberemo relacije
     * @depends createVecArhivalij
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZArhivalijami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "arhivi", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "arhivi", $this->objArhivalija1['id']);
        $I->assertEquals(1, count($resp));
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecTerminovStorive
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSTerminiStoritve(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "terminiStoritve", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "terminiStoritve", $this->objTerminStoritve1['id']);
        $I->assertEquals(1, count($resp));
    }

}
