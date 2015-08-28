<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\KontaktnaOseba;

use ApiTester;

/**
 * Description of KontaktnaOsebaCest
 *
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      - validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - popa,
 *      - oseba
 *      pri many to many relacijah testiraj : update, get (list+id), delete
 *      getlist različne variante relacij
 * 
 * @author rado
 */
class KontaktnaOsebaCest
{

    private $restUrl = '/rest/kontaktnaoseba';
    private $obj;
    private $obj2;
    private $lookPopa;
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
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba1 = $ent              = $I->lookupEntity("oseba", "0001", false);
        $I->assertNotEmpty($ent);

        $this->lookOseba2 = $ent              = $I->lookupEntity("oseba", "0002", false);
        $I->assertNotEmpty($ent);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupPopa(ApiTester $I)
    {
        $this->lookPopa = $ent            = $I->lookupEntity("popa", "0988", false);
        $I->assertNotEmpty($ent);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupPopa
     * @depends lookupOsebo
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {


        $data      = [
            'status'   => 'AK',
            'funkcija' => 'zz',
            'opis'     => 'zz',
            'popa'     => $this->lookPopa['id'],
            'oseba'    => $this->lookOseba1['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'status'   => 'AK',
            'funkcija' => 'aa',
            'opis'     => 'aa',
            'popa'     => $this->lookPopa['id'],
            'oseba'    => $this->lookOseba2['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'aa');
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function getListPoOsebi(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "?oseba=" . $this->lookOseba1['id'];
//
//        $resp = $I->successfullyGetList($listUrl, []);
//        $list = $resp['data'];
//        codecept_debug($resp);
//
//        $I->assertGreaterThanOrEqual(1, $resp['state']['totalRecords']);
//        $I->assertNotEmpty($list);
////        $I->assertEquals("xx", $list[0]['status']);      // odvisno od sortiranja
//    }

    /**
     * preberi vse zapise od popa
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoPopa(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?popa=" . $this->lookPopa['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("xx", $list[0]['status']);      // odvisno od sortiranja
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
////        $I->assertEquals("zz", $list[0]['status']);      //glede na sort
//    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent         = $this->obj;
        $ent['opis'] = 'yy';

        $this->obj = $ent       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($ent['opis'], 'yy');
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
        $I->assertEquals($ent['status'], 'AK');
        $I->assertEquals($ent['funkcija'], 'zz');
        $I->assertEquals($ent['opis'], 'yy');
        $I->assertEquals($ent['popa'], $this->lookPopa['id']);
        $I->assertEquals($ent['oseba']['id'], $this->lookOseba1['id']);
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
