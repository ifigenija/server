<?php

/*
 *  Licenca GPLv3
 */

namespace Zapisi\MapaAcl;

use ApiTester;

/**
 * Description of MapaAclCest
 * 
 *  metode, ki jo podpira API
 *      .create
 *      .getlist
 *      .update
 *      .get - kontrola vseh polj te entitete
 *      .delete
 * validate metodo za entiteto
 * relacije z drugimi entitetami (to many relacije)
 * .pri many to many relacijah testiraj : update, get (list+id), delete
 * .pri one to many relacijah testiraj : get (list+id)
 *      getlist različne variante relacij
 *      .vse
 *      .default
 * 
 * @author rado
 */
class MapaAclCest
{

    private $restUrl    = '/rest/mapaacl/default';
    private $restUrlVse = '/rest/mapaacl/vse';
    private $obj1;
    private $obj2;
    private $lookPermission1;
    private $lookPermission2;

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
    public function lookupDovoljenje(ApiTester $I)
    {
        $this->lookPermission1 = $look                  = $I->lookupEntity("permission", "Posta-read", false);
        $I->assertNotEmpty($look);

        $this->lookPermission2 = $look                  = $I->lookupEntity("permission", "Posta-write", false);
        $I->assertNotEmpty($look);
    }

    /**
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'mapa'   => \Page\SifrantPage::$mapa_prva,
            'perm'   => $this->lookPermission1['id'],
            'dostop' => 'R',
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data       = [
            'mapa'   => \Page\SifrantPage::$mapa_prva,
            'perm'   => $this->lookPermission2['id'],
            'dostop' => 'D',
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent           = $this->obj1;
        $ent['dostop'] = 'W';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['dostop'], 'W');
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
        $I->assertEquals($ent['mapa'], \Page\SifrantPage::$mapa_prva);
        $I->assertEquals($ent['perm'], $this->lookPermission1['id'],"permission");
        $I->assertEquals($ent['dostop'], 'W');
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getListVse(ApiTester $I)
//    {
//        $listUrl = $this->restUrlVse;
//        codecept_debug($listUrl);
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl."?mapa=". \Page\SifrantPage::$mapa_prva, []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
    }

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

    /**
     * test validacij
     * 
     * @depends create
     */
    public function updateZaValidacije(ApiTester $I)
    {
//        $this->expect($this->perm, "Dovoljenje ne sme biti prazno", 1001012);
//        $this->expect($this->dostop, "Dostop ne sme biti prazen", 1001014);
//        $this->expect(preg_match('/^[RWAD]+$/', $this->dostop), 'Dostop ni prave oblike', 1001013);

        $data=  $this->obj2;
        $entR = $I->successfullyUpdate($this->restUrl, $data['id'], $data);

        $data=  $this->obj2;
        $data['dostop']='';
        $resp = $I->failToUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($resp);
//        $I->assertEquals(1001012, $resp[0]['code']);
     
        $data=  $this->obj2;
        $data['dostop']='X';
        $resp = $I->failToUpdate($this->restUrl, $data['id'], $data);
        codecept_debug($resp);
        $I->assertEquals(1001013, $resp[0]['code']);
    }

    
}
