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
    private $vajaUrl           = '/rest/vaja';
    private $gostovanjeUrl     = '/rest/gostovanje';
    private $dogodekUrl        = '/rest/dogodek';
    private $prostorUrl        = '/rest/prostor';
    private $sezonaUrl         = '/rest/sezona';
    private $drzavaUrl         = '/rest/drzava';
    private $arhivalijaUrl     = '/rest/arhivalija';
    private $terminStoritveUrl = '/rest/terminstoritve';
    private $osebaUrl          = '/rest/oseba';
    private $obj1;
    private $obj2;
    private $obj3;
    private $obj4;
    private $obj5;
    private $obj6;
    private $objPredstava1;
    private $objPredstava2;
    private $objPredstava3;
    private $objPredstava4;
    private $objPredstava5;
    private $objPredstava6;
    private $objPredstava7;
    private $objVaja1;
    private $objVaja2;
    private $objVaja3;
    private $objGostovanje;
    private $objDogodekIzven;
    private $objDogodek1;
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
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $roleUrl           = '/rest/role';
    private $rpcRoleUrl        = '/rpc/aaa/role';
    private $rpcUserUrl        = '/rpc/aaa/user';
    private $lookSezona1;
    private $lookSezona2;
    private $lookSezona3;
    private $zacetek1;
    private $konec1;

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
    public function lookupSezona(ApiTester $I)
    {
        $this->lookSezona1 = $look              = $I->lookupEntity("sezona", "2015", false);
        $I->assertGuid($look['id']);

        $this->lookSezona2 = $look              = $I->lookupEntity("sezona", "2016", false);
        $I->assertGuid($look['id']);

        $this->lookSezona3 = $look              = $I->lookupEntity("sezona", "2017", false);
        $I->assertGuid($look['id']);
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
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertGuid($look['id']);
        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertGuid($look['id']);
        $this->lookUprizoritev3 = $look                   = $I->lookupEntity("uprizoritev", "0003", false);
        $I->assertGuid($look['id']);
    }

    /**
     * @depends lookupUprizoritev
     * @param ApiTester $I
     */
    public function createVajo(ApiTester $I)
    {

//        $zacetek = '2014-05-07T10:00:00+0200'; // ker je začetek, bo tudi dogodek kreiral
        $zacetekD       = new \DateTime();
        $zacetekD->modify('+1 day');
        $zacetek        = $zacetekD->format(\DateTime::ISO8601);
        codecept_debug($zacetek);
        $konecD         = clone $zacetekD;
        $konecD->modify('+4 hours');
        $konec          = $konecD->format(\DateTime::ISO8601);
        $this->zacetek1 = $zacetek;
        $this->konec1   = $konec;
        $data           = [
//            'tipvaje'     => $this->lookTipVaje1['id'],
            'tipvaje'     => null,
            'zaporedna'   => 1,
            'porocilo'    => 'zz',
            'uprizoritev' => $this->lookUprizoritev1['id'],
            'title'       => "Vaja $zacetek",
            'status'      => '200s',
            'zacetek'     => $zacetek,
            'konec'       => $konec,
            'prostor'     => $this->lookProstor1['id'],
            'sezona'      => $this->lookSezona1['id'],
        ];
        $this->objVaja1 = $ent            = $I->successfullyCreate($this->vajaUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        codecept_debug($data);
        $I->assertEquals($ent['zacetek'], $data['zacetek']);
        $I->assertEquals($ent['konec'], $data['konec']);


        /**
         * preveri dogodek
         */
        codecept_debug($ent['dogodek']['id']);
        codecept_debug($this->dogodekUrl);
        $this->obj1 = $dogodek    = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);
        codecept_debug($dogodek);
        $I->assertGuid($dogodek['id']);
        $I->assertEquals($ent['zacetek'], $data['zacetek']);
        $I->assertEquals($ent['konec'], $data['konec']);
        $I->assertEquals($ent['title'], $data['title']);
        $I->assertEquals($ent['status'], $data['status']);
        $I->assertEquals($ent['prostor'], $data['prostor']);
        $I->assertEquals($ent['sezona'], $data['sezona']);


        /**
         * še eno vajo
         */
        $zacetekD = new \DateTime();
        $zacetekD->modify('+20 day');
        $zacetek  = $zacetekD->format('c');
        codecept_debug($zacetek);
        $konecD   = clone $zacetekD;
        $konecD->modify('+4 hours');
        $konec    = $konecD->format('c');
        $data     = [
//            'tipvaje'     => $this->lookTipVaje1['id'],
            'tipvaje'     => null,
            'zaporedna'   => 3,
            'porocilo'    => 'aa',
            'uprizoritev' => $this->lookUprizoritev2['id'],
            'title'       => "Vaja $zacetek",
            'status'      => '500s',
            'zacetek'     => $zacetek,
            'konec'       => $konec,
            'prostor'     => $this->lookProstor1['id'],
            'sezona'      => $this->lookSezona1['id'],
        ];


        $this->objVaja2 = $ent            = $I->successfullyCreate($this->vajaUrl, $data);
        $I->assertGuid($ent['id']);
        $this->obj2     = $dogodek        = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);
        $I->assertGuid($dogodek['id']);

        /**
         * še eno vajo
         */
        $zacetekD       = new \DateTime();
        $zacetekD->modify('+20 day');
        $zacetek        = $zacetekD->format('c');
        codecept_debug($zacetek);
        $konecD         = clone $zacetekD;
        $konecD->modify('+4 hours');
        $konec          = $konecD->format('c');
        $data           = [
//            'tipvaje'     => $this->lookTipVaje1['id'],
            'tipvaje'     => null,
            'zaporedna'   => 3,
            'porocilo'    => 'aa',
            'uprizoritev' => $this->lookUprizoritev2['id'],
            'title'       => "Vaja $zacetek",
            'status'      => '500s',
            'zacetek'     => $zacetek,
            'konec'       => $konec,
            'prostor'     => $this->lookProstor2['id'],
            'sezona'      => $this->lookSezona1['id'],
        ];
        $this->objVaja3 = $ent            = $I->successfullyCreate($this->vajaUrl, $data);
        $I->assertGuid($ent['id']);
        $this->obj3     = $dogodek        = $I->successfullyGet($this->dogodekUrl, $ent['dogodek']['id']);
        $I->assertGuid($dogodek['id']);
//        $I->fail('$$');
    }

    /**
     * 
     * @param ApiTester $I
     */
//    public function createDrzavo(ApiTester $I)
//    {
//        $data            = [
//            'sifra'     => 'XX',
//            'sifraDolg' => 'xx',
//            'isoNum'    => 'xx',
//            'isoNaziv'  => 'xx',
//            'naziv'     => 'xx',
//        ];
//        $this->objDrzava = $ent             = $I->successfullyCreate($this->drzavaUrl, $data);
//        $I->assertNotEmpty($ent['id']);
//    }

    /**
     *  kreiramo zapis
     * 
     * @depends createVajo
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $data           = $this->obj1;
        $data['title']  = 'uu';
        $data['termin'] = 'uu';
        codecept_debug($data);

        $this->obj1 = $ent        = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
        $I->assertGuid($ent['id']);
        $I->assertEquals('uu', $ent['title']);
//        $I->assertEquals('uu', $ent['termin']);
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends update
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $this->obj1 = $ent        = $I->successfullyGet($this->restUrl, $this->obj1['id']);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);

        $zacetek = '2014-05-07T10:00:00+0200';

        $I->assertEquals($ent['title'], "uu");
        $I->assertEquals($ent['status'], '200s');
        $I->assertEquals($ent['zacetek'], $this->zacetek1);
        $I->assertEquals($ent['konec'], $this->konec1);
        $I->assertEquals($ent['prostor']['id'], $this->lookProstor1['id']);
        $I->assertEquals($ent['sezona'], $this->lookSezona1['id']);
        $I->assertEquals($ent['razred'], '200s');
//        $I->assertEquals($ent['termin'], 'uu');
        $I->assertEquals($ent['vaja'], $this->objVaja1['id']);
        $I->assertEquals($ent['predstava'], null);
        $I->assertEquals($ent['gostovanje'], null);
        $I->assertEquals($ent['splosni'], null);

        $I->assertTrue(isset($ent['terminiStoritve']));
        $I->assertTrue(isset($ent['prodajaPredstave']));

        $I->assertEquals(0, count($ent['terminiStoritve']));
        $I->assertEquals(0, count($ent['prodajaPredstave']));
    }

    /**
     *  kreiramo zapis
     * 
     * @depends update
     * 
     * @param ApiTester $I
     */
    public function createVecTerminovStorive(ApiTester $I)
    {
        /**
         * kreiramo gosta
         */
        $data = [
            'planiranZacetek' => '2005-12-11T00:00:00+0100',
            'planiranKonec'   => '2006-12-11T00:00:00+0100',
            'zacetek'         => '2007-12-11T00:00:00+0100',
            'konec'           => '2008-12-11T00:00:00+0100',
            'planiranoTraja'  => 3.56,
            'dogodek'         => $this->obj2['id'],
            'alternacija'     => null,
            'oseba'           => $this->lookOseba1['id'],
            'dezurni'         => false,
            'gost'            => true,
        ];

        $this->objTerminStoritve1 = $ent                      = $I->successfullyCreate($this->terminStoritveUrl, $data);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        // kreiramo še en zapis
        $data                     = [
            'planiranZacetek' => '2005-11-11T00:00:00+0100',
            'planiranKonec'   => '2006-11-11T00:00:00+0100',
            'zacetek'         => '2007-11-11T00:00:00+0100',
            'konec'           => '2008-11-11T00:00:00+0100',
            'planiranoTraja'  => 4.22,
            'dogodek'         => $this->obj2['id'],
            'alternacija'     => null,
            'oseba'           => $this->lookOseba2['id'],
            'dezurni'         => false,
            'gost'            => true,
        ];
        $this->objTerminStoritve2 = $ent                      = $I->successfullyCreate($this->terminStoritveUrl, $data);
        $I->assertGuid($ent['id']);
    }

//    /**
//     * @depends update
//     * @param ApiTester $I
//     */
//    public function getListVse(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "/vse";
//        codecept_debug($listUrl);
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//
//        codecept_debug($list);
//        $totR = $resp['state']['totalRecords'];
//        $I->assertGreaterThanOrEqual(4, $totR);
//        $I->assertEquals("aa", $list[0]['title']);      //glede na sort
//        $I->assertEquals("zz", $list[$totR - 1]['title']);      //glede na sort
//    }

    /**
     * @param ApiTester $I
     */
    public function createVloge(ApiTester $I)
    {
        // 2. vloga
        $data = [
            'name'        => 'TEST-NAVADEN-D-R',
            'description' => 'Testna vloga za navadnega uporabnika z read dostopom do Dogodkov',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('TEST-NAVADEN-D-R', $role['name']);
        $I->assertNotEmpty($role['id']);
    }

    /**
     * Doda dovoljenja vlogam
     * 
     * @depends createVloge
     * @param ApiTester $I
     */
    public function grantPermissioneVlogam(ApiTester $I)
    {
        // 2. vloga, dodamo le -read
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST-NAVADEN-D-R",
            'permname' => 'Dogodek-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * @depends grantPermissioneVlogam
     * @param ApiTester $I
     */
    public function grantRoleUporabnikom(ApiTester $I)
    {
        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$irena,
            'rolename' => 'TEST-NAVADEN-D-R',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * @depends createVajo
     * @depends lookupProstor
     * @param ApiTester $I
     */
    public function getListPoProstorih(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl . "?prostor[]=" . $this->lookProstor1['id'] . "&prostor[]=" . $this->lookProstor2['id'], []);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(3, $totR);
    }

    /**
     * @depends createVajo
     * @depends lookupUprizoritev
     * @param ApiTester $I
     */
    public function getListPoUprizoritvah(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl . "?uprizoritev[]=" . $this->lookUprizoritev2['id'] . "&uprizoritev[]=" . $this->lookUprizoritev1['id'], []);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(3, $totR);
    }

    /**
     * v listi default se začetek in konec nastavita, če je prazen parameter
     * 
     * @depends createVajo
     * @param ApiTester $I
     */
    public function getListDefaultPoZacetkuInKoncu(ApiTester $I)
    {
        /**
         * pri default listi je status po defaultu >=500s
         */
        $statusvsi = "status[]=200s&status[]=400s&status[]=500s&status[]=600s&status[]=610s&status[]=710s&status[]=720s&status[]=790s&";

        /**
         * začetek in konec
         * ali enako kot pri listi vse?
         */
        $resp = $I->successfullyGetList($this->restUrl . "?" . $statusvsi . "zacetek=2012-05-15&konec=2015-08-02", []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(5, $totR);

        /**
         * konec pred začetkom(danes)
         */
        $resp = $I->successfullyGetList($this->restUrl . "?" . $statusvsi . "konec=2012-05-15", []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(0, $totR);


        /**
         * le parameter začetek
         * konec izračuna sam 1 mesec več
         */
        $resp        = $I->successfullyGetList($this->restUrl . "?" . $statusvsi . "zacetek=2012-05-15", []);
        $list        = $resp['data'];
        codecept_debug($list);
        $totRzac1505 = $totR        = $resp['state']['totalRecords'];
        $I->assertEquals(2, $totR, "le začetek");

        /**
         * brez paramtrov -> jih sam doda 
         */
        $resp = $I->successfullyGetList($this->restUrl . "?" . $statusvsi, []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(3, $totR, "brez parametrov");

        /**
         * od danes do čez 15 dni 
         */
        $konec    = new \DateTime();
        $konec->modify('15 days');
        $konecStr = str_replace("+", "%2B", $konec->format('c'));    // ker drugače urlencoding spremeni "+" v space
        codecept_debug($konecStr);
        $resp     = $I->successfullyGetList($this->restUrl . "?" . $statusvsi . "konec=" . $konecStr, []);
        $list     = $resp['data'];
        codecept_debug($list);
        $totR     = $resp['state']['totalRecords'];
        $I->assertEquals(1, $totR);
    }

    /**
     * v listi default se začetek in konec nastavita, če je prazen parameter
     * 
     * @depends createVajo
     * @param ApiTester $I
     */
    public function getListDefaultPoStatusu(ApiTester $I)
    {

        /**
         * default za privilegirane uporabnike so vsi 
         */
        $resp    = $I->successfullyGetList($this->restUrl, []);
        $list    = $resp['data'];
        codecept_debug($list);
        $totRDEf = $totR    = $resp['state']['totalRecords'];
        $I->assertEquals(3, $totR, "default default");

        /**
         *  status >=500s
         */
        $statusi = "status[]=500s&status[]=600s&status[]=610s&status[]=710s&status[]=720s&status[]=790s&";

        $resp    = $I->successfullyGetList($this->restUrl . "?" . $statusi, []);
        $list    = $resp['data'];
        codecept_debug($list);
        $totR500 = $totR    = $resp['state']['totalRecords'];
        $I->assertEquals(2, $totR, "default default");

        /**
         * sedaj pogledamo vse v default obdobju
         */
        $statusi = "status[]=200s&status[]=400s&status[]=500s&status[]=600s&status[]=610s&status[]=710s&status[]=720s&status[]=790s&";
        $resp    = $I->successfullyGetList($this->restUrl . "?" . $statusi, []);
        $list    = $resp['data'];
        codecept_debug($list);
        $totR    = $resp['state']['totalRecords'];
        $I->assertEquals($totRDEf, $totR);

        /**
         * sedaj preverimo, če z navadnim uporabnikom prestavi default na 500? 
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$irena, \IfiTest\AuthPage::$irenaPass);
        $statusi = "status[]=200s&status[]=400s&status[]=500s&status[]=600s&status[]=610s&status[]=710s&status[]=720s&status[]=790s&";
        $resp    = $I->successfullyGetList($this->restUrl . "?" . $statusi, []);
        $list    = $resp['data'];
        codecept_debug($list);
        $totRDEf = $totR    = $resp['state']['totalRecords'];
        $I->assertEquals($totR500, $totR);
    }

    /**
     * @depends createVajo
     * @param ApiTester $I
     */
    public function getListDefaultPoUprizoritvi(ApiTester $I)
    {
        $statusvsi = "status[]=200s&status[]=400s&status[]=500s&status[]=600s&status[]=610s&status[]=710s&status[]=720s&status[]=790s&";

        $resp = $I->successfullyGetList($this->restUrl . "?" . $statusvsi . "uprizoritev[]=" . $this->lookUprizoritev1['id'], []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(1, $totR);

        $resp = $I->successfullyGetList($this->restUrl . "?" . $statusvsi . "uprizoritev[]=" . $this->lookUprizoritev2['id'], []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(2, $totR);

        $resp = $I->successfullyGetList($this->restUrl . "?" . $statusvsi . "uprizoritev[]=", []);
        $list = $resp['data'];
        codecept_debug($list);
        $totR = $resp['state']['totalRecords'];
        $I->assertEquals(3, $totR);
    }

    /**
     * brisanje zapisa
     * 
     * @depends update
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
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
        $I->assertEquals(1001709, $resp[0]['code'], "konec pred začetkom");
    }

    /**
     * testi validacije
     * 
     * @param ApiTester $I
     */
    public function updateValidacije(ApiTester $I)
    {
        /**
         * razred mora obstajati
         */
        $data           = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $data['razred'] = null;
        $resp           = $I->failToUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($resp);
//        $I->assertTrue((strpos($resp[0]['message'], 'required') !== false), "razred je obvezen");
        $I->assertEquals(1001704, $resp[0]['code'], "razred je obvezen");


        /**
         * razred, ki ni v seznamu dovoljenih
         */
        $data['razred'] = 'nepravilen';
        $resp           = $I->failToUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($resp);
//        $I->assertTrue((strpos($resp[0]['message'], 'required') !== false), "razred je obvezen");
        $I->assertEquals(1001702, $resp[0]['code'], "razred je obvezen");
    }

}
