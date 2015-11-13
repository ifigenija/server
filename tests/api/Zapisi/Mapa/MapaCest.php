<?php

/*
 *  Licenca GPLv3
 */

namespace Zapisi\Mapa;

use ApiTester;

/**
 * Description of MapaCest
 * 
 *      metode, ki jo podpira API
 *       .create
 *       .getlist
 *       .update
 *       .get - kontrola vseh polj te entitete
 *       .delete
 *      validate metodo za entiteto
 * relacije z drugimi entitetami (to many relacije)
 * .pri many to many relacijah testiraj : update, get (list+id), delete
 * .pri one to many relacijah testiraj : get (list+id)
 *      getlist različne variante relacij
 *       .vse
 *       .default
 * 
 * @author rado
 */
class MapaCest
{

    private $restUrl    = '/rest/mapa/default';
    private $restUrlVse = '/rest/mapa/vse';
    private $obj1;
    private $obj2;
    private $lookMapa1;
    private $lookMapa2;
    private $lookUser1;
    private $lookUser2;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUser(ApiTester $I)
    {
        /**
         * isti kot v _before
         */
        $this->lookUser1 = $ent             = $I->lookupEntity("user", \IfiTest\AuthPage::$admin, false);
        $I->assertGuid($ent['id']);
        
        $this->lookUser2 = $ent             = $I->lookupEntity("user", \IfiTest\AuthPage::$breznik, false);
        $I->assertGuid($ent['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupMapa(ApiTester $I)
    {
        $this->lookMapa1 = $ent             = $I->lookupEntity("mapa", "Prva mapa", false);
        $I->assertGuid($ent['id']);
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
            'ime'         => 'aa',
            'komentar'    => 'aa',
            'javniDostop' => 'R',
            'parent'      => $this->lookMapa1['id'],
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data       = [
            'ime'         => 'bb',
            'komentar'    => 'bb',
//            'javniDostop' => 'W',
            'javniDostop' => '',
            'parent'      => $this->lookMapa1['id'],
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
        $ent             = $this->obj1;
        $ent['komentar'] = 'uu';
        $ent['lastnik'] = $this->lookUser2['id'];

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['komentar'],$ent['komentar']);
        $I->assertEquals($entR['lastnik'],$ent['lastnik']);
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
        codecept_debug($ent);

        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['ime'], 'aa');
        $I->assertEquals($ent['komentar'], 'uu');
        $I->assertEquals($ent['lastnik'], $this->lookUser2['id']); 
        $I->assertEquals($ent['javniDostop'], 'R', "javni dostop");
        $I->assertEquals($ent['parent'], $this->lookMapa1['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl . "?parent=" . $this->lookMapa1['id'], []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj2['id']);
        $I->failToGet($this->restUrl, $this->obj2['id']);
    }

}
