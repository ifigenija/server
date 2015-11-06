<?php

/*
 *  Licenca GPLv3
 */

namespace module\Zapisi\Mapa;

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

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\Page\AuthPage::$admin, \Page\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
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
            'lastnik'     => \Page\SifrantPage::$user_admin,
            'javniDostop' => 'R',
            'parent'      => \Page\SifrantPage::$mapa_prva,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data       = [
            'ime'         => 'bb',
            'komentar'    => 'bb',
            'lastnik'     => \Page\SifrantPage::$user_joza,
            'javniDostop' => 'R',
            'parent'      => \Page\SifrantPage::$mapa_prva,
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

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['komentar'], 'uu');
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
        $I->assertEquals($ent['ime'], 'aa');
        $I->assertEquals($ent['komentar'], 'uu');
        $I->assertEquals($ent['lastnik'], \Page\SifrantPage::$user_admin);
        $I->assertEquals($ent['javniDostop'], 'R', "javni dostop");
        $I->assertEquals($ent['parent'], \Page\SifrantPage::$mapa_prva);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListVse(ApiTester $I)
    {
        $listUrl = $this->restUrlVse;
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl . "?parent=" . \Page\SifrantPage::$mapa_prva, []);
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

}
