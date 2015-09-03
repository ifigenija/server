<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Sezona;

use ApiTester;

/**
 * Description of SezonaCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - dogodki O2M
 *      getlist različne variante relacij
 *      - vse
 * 
 * @author rado
 */
class SezonaCest
{

    private $restUrl         = '/rest/sezona';
    private $dogodekUrl      = '/rest/dogodek';
    private $vajaUrl         = '/rest/vaja';
    private $obj;
    private $obj2;
    private $objDogodek1;
    private $objDogodek2;
    private $objVaja1;
    private $objVaja2;
    private $lookupSezonaUrl = '/lookup/sezona';
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $zasedenostUrl   = '/rest/zasedenost';
    private $objZasedenost;

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
        $data      = [
            'ime'     => 'zz',
            'zacetek' => '2010-02-01T00:00:00+0100',
            'konec'   => '2011-02-01T00:00:00+0100',
            'aktivna' => true,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['ime'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'ime'     => 'aa',
            'zacetek' => '2012-02-01T00:00:00+0100',
            'konec'   => '2013-02-01T00:00:00+0100',
            'aktivna' => true,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['ime'], 'aa');
    }

    /**
     * @param ApiTester $I
     */
//    public function getListVaja(ApiTester $I)         // v tem primeru ne uporabimo tega, ker so fixture vaje že vezane na nek Dogodek
//    {
//        $resp             = $I->successfullyGetList($this->vajaUrl. "/vse", []);
//        $list             = $resp['data'];
//        $I->assertNotEmpty($list);
//        $this->objVaja1 = $ent              = array_pop($list);
//        $I->assertNotEmpty($ent);
//        $this->objVaja2 = $ent              = array_pop($list);
//        $I->assertNotEmpty($ent);
//    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);

        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertNotEmpty($look);
    }

    /**
     * @depends lookupUprizoritev
     * @param ApiTester $I
     */
    public function createVajo(ApiTester $I)
    {
        $data           = [
            'zaporedna'   => 1,
            'porocilo'    => 'zz',
            'dogodek'     => null, // najprej mora biti kreirana vaja, šele potem dogodek.
            'uprizoritev' => $this->lookUprizoritev2['id'],
        ];
        $this->objVaja1 = $ent            = $I->successfullyCreate($this->vajaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['porocilo'], 'zz');

        $data           = [
            'zaporedna'   => 1,
            'porocilo'    => 'cc',
            'dogodek'     => null, // najprej mora biti kreirana vaja, šele potem dogodek.
            'uprizoritev' => $this->lookUprizoritev2['id'],
        ];
        $this->objVaja2 = $ent            = $I->successfullyCreate($this->vajaUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
     *  kreiramo zapis
     * 
     * @depends createZasedenost
     * @depends create
     * @depends createVajo
     * @param ApiTester $I
     */
    public function createDogodekSezone(ApiTester $I)
    {
        $data              = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => '100',
            'razred'          => '200',
            'termin'          => 'zz',
            'ime'             => 'zz',
            'predstava'       => null,
            'zasedenost'      => null,
            'vaja'            => $this->objVaja1['id'],
            'gostovanje'      => null,
            'dogodekIzven'    => null,
            'prostor'         => null,
            'sezona'          => $this->obj2['id'],
        ];
        $this->objDogodek1 = $ent               = $I->successfullyCreate($this->dogodekUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data              = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => '100',
            'razred'          => '500',
            'termin'          => 'aa',
            'ime'             => 'aa',
            'predstava'       => null,
            'zasedenost'      => $this->objZasedenost['id'],
            'vaja'            => null,
            'gostovanje'      => null,
            'dogodekIzven'    => null,
            'prostor'         => null,
            'sezona'          => $this->obj2['id'],
        ];
        $this->objDogodek2 = $ent               = $I->successfullyCreate($this->dogodekUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl;

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("zz", $list[0]['ime']);      // odvisno od sortiranja
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
//        $I->assertEquals(2, $resp['state']['totalRecords']);
//        $I->assertEquals("zz", $list[0]['ime']);      // odvisno od sortiranja
//    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent        = $this->obj;
        $ent['ime'] = 'yy';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['ime'], 'yy');
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

        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['zacetek'], '2010-02-01T00:00:00+0100');
        $I->assertEquals($ent['konec'], '2011-02-01T00:00:00+0100');
        $I->assertEquals($ent['aktivna'], true);
        $I->assertNotEmpty($ent['sifra'], "šifra");

        $I->assertTrue(isset($ent['dogodki']));

        $I->assertEquals(0, count($ent['dogodki']));
    }

    /**
     * test delovanja lookup-a
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function lookupSezona(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->lookupSezonaUrl, []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords'], "total records");
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
     * preberemo relacije
     * 
     * @depends createDogodekSezone
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZDogodki(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "dogodki", "");
        $I->assertEquals(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "dogodki", $this->objDogodek1['id']);
        $I->assertEquals(1, count($resp));
    }

}
