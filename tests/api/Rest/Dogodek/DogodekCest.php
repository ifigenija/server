<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Dogodek;

use ApiTester;

/**
 * Description of DogodekCest
 *
 * metode, ki jo podpira API
 * - create
 * - getlist
 * - update
 * - get - kontrola vseh polj te entitete
 * - delete
 * validate metodo za entiteto
 * relacije z drugimi entitetami
 * - predstava
 * - zasedenost
 * - vaja
 * - gostovanje
 * - dogodekIzven
 * - prostor
 * - arhiv
 * - terminiStoritve
 * - prodajaPredstave
 * 
 * getlist različne variante relacij
 * - vse
 * - sezona
 * 
 * @author rado
 */
class DogodekCest
{

    private $restUrl         = '/rest/dogodek';
    private $predstavaUrl    = '/rest/predstava';
    private $zasedenostUrl   = '/rest/zasedenost';
    private $vajaUrl         = '/rest/vaja';
    private $gostovanjeUrl   = '/rest/gostovanje';
    private $dogodekIzvenUrl = '/rest/dogodekIzven';
    private $prostorUrl      = '/rest/prostor';
    private $sezonaUrl      = '/rest/sezona';
    private $obj;
    private $objPredstava;
    private $objZasedenost;
    private $objVaja;
    private $objGostovanje;
    private $objDogodekIzven;
    private $objProstor;
    private $objSezona;

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
    public function createSezono(ApiTester $I)
    {
        $data      = [
            'imeSezone' => 'zz',
            'zacetek'   => '2010-02-01T00:00:00+0100',
            'konec'     => '2011-02-01T00:00:00+0100',
            'aktivna'   => true,
        ];
        $this->objSezona = $ent       = $I->successfullyCreate($this->sezonaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['imeSezone'], 'zz');
    }

    
    
    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'planiranZacetek' => '2011-02-01T00:00:00+0100',
            'zacetek'         => '2012-02-01T00:00:00+0100',
            'konec'           => '2013-02-01T00:00:00+0100',
            'status'          => 1,
            'razred'          => null,
            'termin'          => null,
            'ime'             => null,
            'predstava'       => null,
            'zasedenost'      => null,
            'vaja'            => null,
            'gostovanje'      => null,
            'dogodekIzven'    => null,
            'prostor'         => null,
            'sezona'          => $this->objSezona,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['status'], 1);

        // kreiramo še en zapis
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoSezoni(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?sezona=" . $this->objSezona['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("xx", $list[0]['status']);      // $$ odvisno od sortiranja
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertEquals(2, $resp['state']['totalRecords']);
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
        $ent['status'] = 2;

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['status'], 2);
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
        $I->assertEquals($ent['status'], 2);
        $I->assertEquals($ent['razred'], null);
        $I->assertEquals($ent['termin'], null);
        $I->assertEquals($ent['ime'], null);
        $I->assertEquals($ent['predstava'], null);
        $I->assertEquals($ent['zasedenost'], null);
        $I->assertEquals($ent['vaja'], null);
        $I->assertEquals($ent['gostovanje'], null);
        $I->assertEquals($ent['dogodekIzven'], null);
        $I->assertEquals($ent['prostor'], null);
        $I->assertEquals($ent['sezona'], null);

        $I->assertTrue(isset($ent['arhiv']));
        $I->assertTrue(isset($ent['terminiStoritve']));
        $I->assertTrue(isset($ent['prodajaPredstave']));

        $I->assertEquals(0, count($ent['arhiv']));
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

}
