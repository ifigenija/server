<?php

namespace Rest\Popa;

use ApiTester;

/**
 *      -create
 *      -getlist
 *      -update
 *      -get kontrola vseh polj te entitete
 *      -delete
 * -validate metodo za entiteto
 * -relacije z drugimi entitetami
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *  validate metodo za entiteto - zaradi nullable=false do validacije sploh ne pride
 * relacije z drugimi entitetami
 * - drzava     
 * - osebe      $$ 2M    
 * - naslovi    $$ 2M    
 * - telefonske $$ 2M     
 * - trrji      $$ 2M     
 * - pogodbe    $$ 2M 
 * getlist različne variante relacij
 */
class PopaCest
{

    private $restUrl   = '/rest/popa';
    private $drzavaUrl = '/rest/drzava';
    private $id        = '00000000-0000-0000-0000-000000000000';
    private $obj;
    private $objDrzava;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * najde državo
     * 
     * @param ApiTester $I
     */
    public function getListDrzava(ApiTester $I)
    {
        $resp            = $I->successfullyGetList($this->drzavaUrl, []);
        $list            = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objDrzava = $drzava          = array_pop($list);
        $I->assertNotEmpty($drzava);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'sifra'     => 'ZZ12',
            'tipkli'    => '3', // $$ rb ko bodo opcije porihtane
            'stakli'    => 'AK', // $$ rb ko bodo opcije porihtane
            'naziv'     => 'zz',
            'naziv1'    => 'zz',
            'panoga'    => 'zz',
            'email'     => 'z@zzz.zz',
            'url'       => 'zz',
            'opomba'    => 'zz',
            'drzava'    => $this->objDrzava['id'],
            'idddv'     => 'zz',
            'maticna'   => 'ZZ123',
            'zavezanec' => 'Da',
            'jeeu'      => 'Da',
            'datZav'    => '2010-02-01T00:00:00+0100',
            'datnZav'   => '2017-02-01T00:00:00+0100',
            'zamejstvo' => FALSE,
        ];
        $this->obj = $popa      = $I->successfullyCreate($this->restUrl, $data);

//        codecept_debug($popa);
        $I->assertNotEmpty($popa['id']);
        $I->assertEquals('ZZ12', $popa['sifra']);

        // kreiramo še en zapis
        $data = [
            'sifra'     => 'AA12',
            'tipkli'    => '4', // $$ rb ko bodo opcije porihtane
            'stakli'    => 'AK', // $$ rb ko bodo opcije porihtane
            'naziv'     => 'aa',
            'naziv1'    => 'aa',
            'panoga'    => 'aa',
            'email'     => 'a@zzz.zz',
            'url'       => 'aa',
            'opomba'    => 'aa',
            'drzava'    => $this->objDrzava['id'],
            'idddv'     => 'aa',
            'maticna'   => 'AA123',
            'zavezanec' => 'Da',
            'jeeu'      => 'Da',
            'datZav'    => '2011-02-01T00:00:00+0100',
            'datnZav'   => '2018-02-01T00:00:00+0100',
            'zamejstvo' => FALSE,
        ];
        $popa = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($popa['id']);
        $I->assertEquals('AA12', $popa['sifra']);
    }

//    /**
//     * 
//     * @depends create
//     * @param ApiTester $I
//     */
//    public function getList(ApiTester $I)
//    {
//        $resp = $I->successfullyGetList($this->restUrl, []);
//        $list = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $this->id = array_pop($list)['id'];
//        $I->assertNotEmpty($this->id);
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $popa           = $this->obj;
        $popa['panoga'] = 'tralala';

        $popa = $I->successfullyUpdate($this->restUrl, $popa['id'], $popa);

        $I->assertEquals('tralala', $popa['panoga']);
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function read(ApiTester $I)
    {
        $popa = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals($popa['sifra'], 'ZZ12');
//        $I->assertEquals($popa['tipkli'], '3'); // $$ rb ko bodo opcije porihtane
//        $I->assertEquals($popa['stakli'], 'AK'); // $$ rb ko bodo opcije porihtane
        $I->assertEquals($popa['naziv'], 'zz');
        $I->assertEquals($popa['naziv1'], 'zz');
        $I->assertEquals($popa['panoga'], 'tralala');
        $I->assertEquals($popa['email'], 'z@zzz.zz');
        $I->assertEquals($popa['url'], 'zz');
        $I->assertEquals($popa['opomba'], 'zz');
        $I->assertEquals($popa['drzava'], $this->objDrzava['id']);
        $I->assertEquals($popa['idddv'], 'zz');
        $I->assertEquals($popa['maticna'], 'ZZ123');
//        $I->assertEquals($popa['zavezanec'], 'Da');  // $$ rb ko jasno za checkbox
//        $I->assertEquals($popa['jeeu'], 'Da');        // $$ rb ko jasno za checkbox
        $I->assertEquals($popa['datZav'], '2010-02-01T00:00:00+0100');
        $I->assertEquals($popa['datnZav'], '2017-02-01T00:00:00+0100');
        $I->assertEquals($popa['zamejstvo'], FALSE);
    }

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

        $I->assertNotEmpty($list);
        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertEquals("aa", $list[0]['naziv']);      //glede na sort
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?q=a";     // na nazivu je wildcard, išče *a*
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertEquals("aa", $list[0]['naziv']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function delete(ApiTester $I)
    {
        $popa = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

    /**
     * kreiramo popa, test validacije  - zaenkrat izpustimo, ker do validacije zaradi nullable=false pri vseh 3 poljih sploh ne pride
     * 
     * @param ApiTester $I
     */
//    public function createKlientaBrezNaziva(ApiTester $I)
//    {
////            $this->expect($this->sifra, "Šifra je obvezen podatek", 1000310);
////        $this->expect($this->naziv, "Naziv je obvezen podatek", 1000311);
////        $this->expect($this->drzava, "Država je obvezen podatek", 1000312);
//        $data = [
//            'sifra'     => 'cc',
//            'naziv'     => '',
//            'drzava'    => $this->objDrzava['id'],
////            'drzava'    => NULL,
//        ];
//
//        // test validacije - oseba mora imeti ime
//        $resp = $I->failToCreate($this->restUrl, $data);
//        $I->assertNotEmpty($resp);
//        // testiramo na enako številko napake kot je v validaciji
//        $I->assertEquals(1000311, $resp[0]['code']);
//    }
}
