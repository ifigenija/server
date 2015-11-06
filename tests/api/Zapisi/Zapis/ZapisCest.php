<?php

/*
 *  Licenca GPLv3
 */

namespace Zapisi\Zapis;

use ApiTester;

/**
 * Description of DrugiVirCest
 * 
 * metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      getlist različne variante relacij
 *      - vse
 *      - default
 *        . po lastniku 
 * validate metodo za entiteto
 * relacije z drugimi entitetami (to many relacije)
 * - pri many to many relacijah testiraj : update, get (list+id), delete
 *  . vsebujoceMape
 * - pri one to many relacijah testiraj : get (list+id)
 *  . lastniki
 * 
 * @author rado
 */
class ZapisCest
{

    private $restUrl            = '/rest/zapis/default';
    private $restUrlClear       = '/rest/zapis';
    private $restUrlVse         = '/rest/zapis/vse';
    private $zapisLastnikUrl    = '/rest/zapislastnik/default';
    private $obj1;
    private $obj2;
    private $objZapisLastnik1;
    private $objZapisLastnik2;
    private $objZapisLastnik3;
    private $programPremieraUrl = '/rest/programpremiera';
    private $objProgramPremiera1;
    private $objProgramPremiera2;
    private $objProgramPremiera3;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  kreiramo zapis lastnika
     * 
     * 
     * @param ApiTester $I
     */
    public function createZapisLastnik(ApiTester $I)
    {
        $data                   = [
            'lastnik'       => \Page\SifrantPage::$dokument_ponudba_1,
            'classLastnika' => 'DokumentPonudba',
            'zapis'         => null,
        ];
        $this->objZapisLastnik1 = $ent                    = $I->successfullyCreate($this->zapisLastnikUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data                   = [
            'lastnik'       => \Page\SifrantPage::$dokument_ponudba_2,
            'classLastnika' => 'DokumentPonudba',
            'zapis'         => null,
        ];
        $this->objZapisLastnik2 = $ent                    = $I->successfullyCreate($this->zapisLastnikUrl, $data);
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
            'tip'         => 'komentar',
            'vrsta'       => null,
            'datoteka'    => null,
            'subject'     => 'zz',
            'title'       => 'zz',
            'description' => 'zz',
            'coverage'    => 'zz',
            'language'    => 'zz',
            'publisher'   => 'zz',
            'relation'    => 'zz',
            'rights'      => 'zz',
            'source'      => 'zz',
            'standard'    => 'zz',
            'lokacija'    => 'zz',
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl . '?lastnik=' . $this->objZapisLastnik1['id'], $data);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data       = [
            'tip'         => 'komentar',
            'vrsta'       => null,
            'datoteka'    => null,
            'subject'     => 'bb',
            'title'       => 'bb',
            'description' => 'bb',
            'coverage'    => 'bb',
            'language'    => 'bb',
            'publisher'   => 'bb',
            'relation'    => 'bb',
            'rights'      => 'bb',
            'source'      => 'bb',
            'standard'    => 'bb',
            'lokacija'    => 'bb',
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl . '?lastnik=' . $this->objZapisLastnik2['id'], $data);
        codecept_debug($ent);
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
        $ent['subject'] = "uu";

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['subject'], 'uu');
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
        $I->assertEquals($ent['tip'], 'komentar');
        $I->assertEquals($ent['vrsta'], null);
        $I->assertEquals($ent['datoteka'], null);
        $I->assertNotEmpty($ent['identifier']);
        $I->assertEquals($ent['subject'], 'uu');
        $I->assertEquals($ent['title'], 'zz');
        $I->assertEquals($ent['description'], 'zz');
        $I->assertEquals($ent['coverage'], 'zz');
        $I->assertEquals($ent['language'], 'zz');
        $I->assertEquals($ent['publisher'], 'zz');
        $I->assertEquals($ent['relation'], 'zz', 'relation');
        $I->assertEquals($ent['rights'], 'zz');
        $I->assertEquals($ent['source'], 'zz');
        $I->assertEquals($ent['standard'], 'zz');
        $I->assertEquals($ent['lokacija'], 'zz');
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
//        codecept_debug($list);
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl . "?lastnik=" . $this->objZapisLastnik2['lastnik'], []);
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

    /**
     *  kreiramo zapise za relacije
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecLastnikovZapisa(ApiTester $I)
    {
        $data                   = [
            'lastnik'       => \Page\SifrantPage::$dokument_ponudba_3,
            'classLastnika' => 'DokumentPonudba',
            'zapis'         => $this->obj2['id'],
        ];
        $this->objZapisLastnik3 = $ent                    = $I->successfullyCreate($this->zapisLastnikUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecLastnikovZapisa
     * 
     * @param ApiTester $I
     */
//    public function preberiRelacijeZLastnikiZapisov(ApiTester $I)
//    {
//        $resp = $I->successfullyGetRelation($this->restUrlClear, $this->obj2['id'], "lastniki", "");
//        $I->assertGreaterThanOrEqual(2, count($resp));
//
//        $resp = $I->successfullyGetRelation($this->restUrlClear, $this->obj2['id'], "lastniki", $this->objZapisLastnik3['id']);
//        $I->assertGreaterThanOrEqual(1, count($resp));
//    }

    /**
     *  brišemo zapis in preverimo, ali je zbrisal tudi lastnika
     * 
     * @depends createVecLastnikovZapisa
     * 
     * @param ApiTester $I
     */
    public function deleteZapisAliBriseLastnika(ApiTester $I)
    {
        // najprej preverim, če lastnik obstaja pred brisanjem
        $I->successfullyGet($this->zapisLastnikUrl, $this->objZapisLastnik3['id']);

        //brišemo zapis - pričakujemo, da bo tudi lasnika izbrisal
        $I->successfullyDelete($this->restUrl, $this->obj2['id']);
        $I->failToGet($this->restUrl, $this->obj2['id']);
        $I->failToGet($this->zapisLastnikUrl, $this->objZapisLastnik3['id']);
    }

}
