<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\StrosekUprizoritve;

use ApiTester;

/**
 * Description of StrosekUprizoritveCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 * na drugi strani  
 *      - uprizoritevCest, 
 *  -popacest $$
 *      relacije z drugimi entitetam - ni to many relacij
 *      getlist različne variante relacij
 *      - vse
 *      - uprizoritev
 *
 * @author rado
 */
class StrosekUprizoritveCest
{

    private $restUrl         = '/rest/strosekuprizoritve';
    private $popaUrl         = '/rest/popa';
    private $uprizoritevUrl  = '/rest/uprizoritev';
    private $obj1;
    private $obj2;
    private $lookPopa;
    private $vrstaStroskaUrl = '/rest/vrstastroska';
    private $objVrstaStroska1;
    private $objVrstaStroska2;
    private $objVrstaStroska3;
    private $objVrstaStroska4;
    private $objVrstaStroskaGlava;
    private $lookUprizoritev;

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
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev = $look                  = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
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
     * najde enoto programa
     * 
     * @param ApiTester $I
     */
    public function getListVrstaStroska(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->vrstaStroskaUrl, []);
        $list = $resp['data'];
        $I->assertNotEmpty($list);

        /**
         * preberemo vrsto stroška, ki ni  glava 
         */
        $glava = TRUE;
        while ($glava) {
            $this->objVrstaStroska1 = $vrstaStroska           = array_pop($list);
            $glava                  = ($vrstaStroska['podskupina'] === 0) ? true : false;
        }
        codecept_debug($vrstaStroska);
        /**
         * preberemo še eno glavo
         */
        $glava = false;
        while (!$glava) {
            $this->objVrstaStroskaGlava = $vrstaStroska               = array_pop($list);
            $glava                      = ($vrstaStroska['podskupina'] === 0) ? true : false;
        }
        codecept_debug($vrstaStroska);
    }

    /**
     *  kreiramo zapis
     * 
     * @depends lookupPopa
     * @depends lookupUprizoritev
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'naziv'        => 'zz',
            'vrednostDo'   => 1.23,
            'vrednostNa'   => 4.56,
            'opis'         => 'zz',
            'tipstroska'   => 'materialni',
            'vrstaStroska' => $this->objVrstaStroska1['id'],
            'sort'         => 1,
            'uprizoritev'  => $this->lookUprizoritev['id'],
            'popa'         => $this->lookPopa['id'],
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'naziv'        => 'aa',
            'vrednostDo'   => 2.34,
            'vrednostNa'   => 5.67,
            'opis'         => 'aa',
            'tipstroska'   => 'avtorprav',
            'vrstaStroska' => NULL,
            'sort'         => 2,
            'uprizoritev'  => $this->lookUprizoritev['id'],
            'popa'         => $this->lookPopa['id'],
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
    public function getListPoUprizoritvi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->lookUprizoritev['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
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
        $ent         = $this->obj1;
        $ent['opis'] = 'yy';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['opis'], 'yy');
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

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['opis'], 'yy');
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertEquals($ent['vrednostDo'], 1.23);
        $I->assertEquals($ent['vrednostNa'], 4.56);
        $I->assertEquals($ent['sort'], 1);
        $I->assertEquals($ent['tipstroska'], 'materialni', "tip stroška");
        $I->assertEquals($ent['vrstaStroska'], $this->objVrstaStroska1['id'], "vrsta stroška");
        $I->assertEquals($ent['uprizoritev'], $this->lookUprizoritev['id'], "uprizoritev");
        $I->assertEquals($ent['popa'], $this->lookPopa['id']);
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
     * test validacije
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZaValidacijo(ApiTester $I)
    {
//        if ($this->tipstroska == 'materialni') {
//            $this->expect($this->vrstaStroska, "Pri materialnih stroških vrsta stroška obvezen podatek", 1000370);
//            $this->expect($this->vrstaStroska->getPodskupina() !== 0, "Vrsta stroška ne sme biti naslov skupine", 1000371);
//        } else {
//            $this->vrstaStroska = NULL;
//        }


        $ent                 = $this->obj2;
        $ent['tipstroska']   = 'materialni';
        
        /**
         * ali glava
         */
        $ent['vrstaStroska'] = $this->objVrstaStroskaGlava['id'];
        $resp                = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
        $I->assertEquals(1000371, $resp[0]['code'], "ne sme biti glava vrste stroška");
        
        /**
         * ali brez vrste str.
         */
        $ent['vrstaStroska'] = null;
        $resp                = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
        $I->assertEquals(1000370, $resp[0]['code'], "ne sme biti glava vrste stroška");
       
        /**
         * ali brez vrste str.
         */
        $ent['tipstroska']   = 'avtorprav';
        $ent['vrstaStroska'] = $this->objVrstaStroska1['id'];
        $ent                = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
        $I->assertEquals(null, $ent['vrstaStroska'], "ali postavil vrsto stroška na NULL");
    }

}
