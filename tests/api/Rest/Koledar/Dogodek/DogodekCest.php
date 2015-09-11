<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Koledar\Dogodek;

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
    private $dogodekUrl        = '/rest/dogodek';
    private $prostorUrl        = '/rest/prostor';
    private $sezonaUrl         = '/rest/sezona';
    private $drzavaUrl         = '/rest/drzava';
    private $arhivalijaUrl     = '/rest/arhivalija';
    private $terminStoritveUrl = '/rest/terminstoritve';
    private $osebaUrl          = '/rest/oseba';
    private $obj;
    private $objPredstava1;
    private $objPredstava2;
    private $objPredstava3;
    private $objPredstava4;
    private $objPredstava5;
    private $objPredstava6;
    private $objPredstava7;
    private $objZasedenost;
    private $objVaja;
    private $objGostovanje;
    private $objDogodekIzven;
    private $objDogodek1;
    private $obj2;
    private $objProstor;
    private $lookProstor1;
    private $lookProstor2;
    private $lookProstor3;
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
        $this->lookProstor1 = $ent                = $I->lookupEntity("prostor", "0006", false);
        $I->assertGuid($ent['id']);

        $this->lookProstor2 = $ent                = $I->lookupEntity("prostor", "0005", false);
        $I->assertGuid($ent['id']);

        $this->lookProstor3 = $ent                = $I->lookupEntity("prostor", "0003", false);
        $I->assertGuid($ent['id']);
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
            'uprizoritev' => $I->lookupEntity('uprizoritev', '0001'),
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
        $data                = [
            'dogodek'     => NULL,
            'uprizoritev' => $I->lookupEntity('uprizoritev', "0002"),
            'gostovanje'  => NULL,
        ];
        $this->objPredstava1 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data                = [
            'dogodek'     => NULL,
            'uprizoritev' => $I->lookupEntity('uprizoritev', "0002"),
            'gostovanje'  => NULL,
        ];
        $this->objPredstava2 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data                = [
            'dogodek'     => NULL,
            'uprizoritev' => $I->lookupEntity('uprizoritev', "0002"),
            'gostovanje'  => NULL,
        ];
        $this->objPredstava3 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);
        // kreiramo še en zapis
        $data                = [
            'dogodek'     => NULL,
            'uprizoritev' => $I->lookupEntity('uprizoritev', "0002"),
            'gostovanje'  => NULL,
        ];
        $this->objPredstava4 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);
        // kreiramo še en zapis
        $data                = [
            'dogodek'     => NULL,
            'uprizoritev' => $I->lookupEntity('uprizoritev', "0002"),
            'gostovanje'  => NULL,
        ];
        $this->objPredstava5 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);
        // kreiramo še en zapis
        $data                = [
            'dogodek'     => NULL,
            'uprizoritev' => $I->lookupEntity('uprizoritev', "0002"),
            'gostovanje'  => NULL,
        ];
        $this->objPredstava6 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);

        $this->objPredstava7 = $ent                 = $I->successfullyCreate($this->predstavaUrl, $data);
        $I->assertGuid($ent['id']);
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
            'konec'           => '2012-05-01T00:00:00+0200',
            'status'          => '100s',
            'razred'          => '500s',
            'termin'          => 'zz',
            'title'           => 'zz',
            'zasedenost'      => $this->objZasedenost['id'],
            'prostor'         => $this->lookProstor1['id'],
            'sezona'          => $this->objSezona['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals('100s', $ent['status']);

        // kreiramo še en zapis
        $data       = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-03-01T00:00:00+0200',
            'konec'           => '2012-07-01T00:00:00+0200',
            'status'          => '200s',
            'razred'          => '100s',
            'termin'          => 'aa',
            'title'           => 'aa',
            'predstava'       => $this->objPredstava1['id'],
            'zasedenost'      => null,
            'vaja'            => null,
            'gostovanje'      => null,
            'splosni'         => null,
            'prostor'         => $this->lookProstor1['id'],
            'sezona'          => $this->objSezona['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals('200s', $ent['status']);

        // kreiramo še en zapis
        $data = [
            'planiranZacetek' => '2011-03-01T00:00:00+0100',
            'zacetek'         => '2012-06-01T00:00:00+0100',
            'konec'           => '2012-09-01T00:00:00+0100',
            'status'          => '600s',
            'razred'          => '100s',
            'termin'          => 'cc',
            'title'           => 'cc',
            'predstava'       => $this->objPredstava2['id'],
            'zasedenost'      => null,
            'vaja'            => null,
            'gostovanje'      => null,
            'splosni'         => null,
            'prostor'         => $this->lookProstor2['id'],
            'sezona'          => $this->objSezona['id'],
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data = [
            'planiranZacetek' => '2011-04-01T00:00:00+0100',
            'zacetek'         => '2012-08-01T00:00:00+0100',
            'konec'           => '2012-11-01T00:00:00+0100',
            'status'          => '200s',
            'razred'          => '100s',
            'termin'          => 'cc',
            'title'           => 'cc',
            'predstava'       => $this->objPredstava3['id'],
            'zasedenost'      => null,
            'vaja'            => null,
            'gostovanje'      => null,
            'splosni'         => null,
            'prostor'         => null,
            'sezona'          => $this->objSezona['id'],
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapise glede na trenutni datum
        $zacetek = new \DateTime();
        $konec   = clone $zacetek;
        $konec->modify('2 months');
        $data    = [
            'planiranZacetek' => '2011-04-01T00:00:00+0100',
            'zacetek'         => $zacetek->format('c'),
            'konec'           => $konec->format('c'),
            'status'          => '200s',
            'razred'          => '100s',
            'termin'          => 'dd',
            'title'           => 'dd',
            'predstava'       => $this->objPredstava4['id'],
            'zasedenost'      => null,
            'vaja'            => null,
            'gostovanje'      => null,
            'splosni'         => null,
            'prostor'         => null,
            'sezona'          => $this->objSezona['id'],
        ];
        $ent     = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);


        // kreiramo še en zapise glede na trenutni datum
        $zacetek = new \DateTime();
        $zacetek->modify('1 month');
        $konec   = clone $zacetek;
        $konec->modify('2 months');
        $data    = [
            'planiranZacetek' => '2011-04-01T00:00:00+0100',
            'zacetek'         => $zacetek->format('c'),
            'konec'           => $konec->format('c'),
            'status'          => '200s',
            'razred'          => '100s',
            'termin'          => 'dd',
            'title'           => 'dd',
            'predstava'       => $this->objPredstava5['id'],
            'zasedenost'      => null,
            'vaja'            => null,
            'gostovanje'      => null,
            'splosni'         => null,
            'prostor'         => null,
            'sezona'          => $this->objSezona['id'],
        ];
        $ent     = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
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
    public function getListVse(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(4, $totR);
        $I->assertEquals("aa", $list[0]['title']);      //glede na sort
        $I->assertEquals("zz", $list[$totR - 1]['title']);      //glede na sort
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListVsePoProstoru(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl . "/vse?prostor=" . $this->lookProstor1['id'], []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(2, $totR);
        $I->assertEquals($this->lookProstor1['id'], $list[0]['prostor']);      //glede na sort
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListVsePoZacetkuInKoncu(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl . "/vse?konec=2012-05-15", []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(2, $totR);

        // povečamo parameter konec
        $resp = $I->successfullyGetList($this->restUrl . "/vse?konec=2012-06-15", []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(3, $totR, "pred 15.6.");

        /**
         * le parameter začetek
         */
        $resp        = $I->successfullyGetList($this->restUrl . "/vse?zacetek=2012-05-15", []);
        $list        = $resp['data'];
        codecept_debug($list);
        $totRzac1505 = $totR        = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(3, $totR);

        /**
         * začetek večji za nekaj mesecev
         */
        $resp = $I->successfullyGetList($this->restUrl . "/vse?zacetek=2012-12-31", []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(3, $totRzac1505 - $totR);


        /**
         * začetek in konec
         */
        $resp = $I->successfullyGetList($this->restUrl . "/vse?zacetek=2012-05-15&konec=2012-06-15", []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(2, $totR);
    }

    /**
     * v listi default se začetek in konec nastavita, če je prazen parameter
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefaultPoZacetkuInKoncu(ApiTester $I)
    {
        /**
         * začetek in konec
         * ali enako kot pri listi vse?
         */
        $resp = $I->successfullyGetList($this->restUrl . "?zacetek=2012-05-15&konec=2012-06-15", []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(2, $totR);

        /**
         * konec pred začetkom(danes)
         */
        $resp = $I->successfullyGetList($this->restUrl . "?konec=2012-05-15", []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(0, $totR);


        /**
         * le parameter začetek
         */
        $resp        = $I->successfullyGetList($this->restUrl . "?zacetek=2012-05-15", []);
        $list        = $resp['data'];
        codecept_debug($list);
        $totRzac1505 = $totR        = $resp['state']['totalRecords'];
        $I->assertEquals(2, $totR, "le začetek");

        /**
         * brez paramtrov -> jih sam doda 
         */
        $resp = $I->successfullyGetList($this->restUrl, []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(2, $totR, "brez parametrov");

        /**
         * od danes do čez 15 dni 
         */
        $konec    = new \DateTime();
        $konec->modify('15 days');
        $konecStr = str_replace("+", "%2B", $konec->format('c'));    // ker drugače urlencoding spremeni "+" v space
        codecept_debug($konecStr);
        $resp     = $I->successfullyGetList($this->restUrl . "?konec=" . $konecStr, []);
        $list     = $resp['data'];
        codecept_debug($list);
        $totR     = $resp['state']['totalRecords'];
        $I->assertEquals(1, $totR);
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
        $ent['status'] = '600s';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals('600s', $entR['status']);
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
        $I->assertEquals($ent['konec'], '2012-05-01T00:00:00+0200');
        $I->assertEquals($ent['status'], '600s');
        $I->assertEquals($ent['razred'], '500s');
        $I->assertEquals($ent['termin'], 'zz');
        $I->assertEquals($ent['title'], 'zz');
        $I->assertEquals($ent['predstava'], null);
        $I->assertEquals($ent['zasedenost'], $this->objZasedenost['id']);
        $I->assertEquals($ent['gostovanje'], null);
        $I->assertEquals($ent['splosni'], null);
        $I->assertEquals($ent['prostor'], $this->lookProstor1['id']);
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
            'status'          => '100s',
            'razred'          => '100s',
            'termin'          => 'cc',
            'title'           => 'cc',
            'predstava'       => null,
            'zasedenost'      => null,
            'vaja'            => null,
            'gostovanje'      => null,
            'splosni'         => null,
            'prostor'         => null,
            'sezona'          => $this->objSezona['id'],
        ];

        // test validacije - obstajati mora ali uprizoritev ali dogodek
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000465, $resp[0]['code']);

        // validacija 
        $data = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => '200s',
            'razred'          => '200s',
            'termin'          => 'dd',
            'title'           => 'dd',
            'predstava'       => null,
            'zasedenost'      => null,
            'vaja'            => $this->objVaja['id'],
            'predstava'       => $this->objPredstava1['id'],
            'gostovanje'      => null,
            'splosni'         => null,
            'prostor'         => null,
            'sezona'          => $this->objSezona['id'],
        ];

        // test validacije - obstajati mora ali uprizoritev ali dogodek
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000361, $resp[0]['code']);

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

    /**
     * test validacije
     * 
     * @param ApiTester $I
     */
    public function updateValidacijaDatumov(ApiTester $I)
    {
        $this->obj2     = $ent            = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $ent['zacetek'] = '2012-02-01T00:00:00+0100';
        $ent['konec']   = '2012-01-01T00:00:00+0200';
        $resp           = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000469, $resp[0]['code'], "konec pred začetkom");
    }

}
