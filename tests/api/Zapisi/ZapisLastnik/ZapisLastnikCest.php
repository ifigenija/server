<?php

/*
 *  Licenca GPLv3
 */

namespace Zapisi\ZapisLastnik;

use ApiTester;

/**
 * Description of ZapisLastnikCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 * getlist različne variante relacij
 *      - vse
 * - default
 *  . po zapisu
 *          . po lastniku 
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami (to many relacije)
 *      - pri many to many relacijah testiraj : update, get (list+id), delete
 *      - pri one to many relacijah testiraj : get (list+id)
 * 
 * @author rado
 */
class ZapisLastnikCest
{

    private $restUrl            = '/rest/zapislastnik/default';
    private $obj1;
    private $obj2;
    private $programPremieraUrl = '/rest/programpremiera';
    private $objProgramPremiera1;
    private $objProgramPremiera2;
    private $objProgramPremiera3;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;

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
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0001", false);
        codecept_debug($look);

        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        codecept_debug($look);

        $this->lookUprizoritev3 = $look                   = $I->lookupEntity("uprizoritev", "0003", false);
        codecept_debug($look);
    }

    /**
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data = [
            'lastnik'       => $this->lookUprizoritev1['id'],
            'classLastnika' => 'Uprizoritev',
            'zapis'         => null,
        ];

        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data       = [
            'lastnik'       => $this->lookUprizoritev2['id'],
            'classLastnika' => 'Uprizoritev',
            'zapis'         => null,
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
        $ent            = $this->obj1;
        $ent['lastnik'] = $this->lookUprizoritev3['id'];

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['lastnik'], $this->lookUprizoritev3['id']);
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
        $I->assertEquals($ent['lastnik'], $this->lookUprizoritev3['id']);
        $I->assertEquals($ent['classLastnika'], "Uprizoritev");
        $I->assertEquals($ent['zapis'], null);
//        $I->assertEquals($ent['upor'], \Page\AuthPage::$admin);       //$$ to bo še za implementirati
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl, []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);

        $resp = $I->successfullyGetList($this->restUrl . "?lastnik=" . $this->lookUprizoritev3['id'], []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertNotEmpty($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
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
