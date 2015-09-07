<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramskaEnotaSklopa;

use ApiTester;

/**
 * Description of ProgramskaEnotaSklopaCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami (to many relacije) 
 *      - pri many to many relacijah testiraj : update, get (list+id), delete
 *      - pri one to many relacijah testiraj : get (list+id)  -> potreben test pri ProgramRazno
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * clone  -> vključiti test pri programdela
 * zaklepanje -> vključiti test pri programdela
 * 
 * @author rado
 */
class ProgramskaEnotaSklopaCest
{

    private $restUrl         = '/rest/programskaenotasklopa';
    private $obj1;
    private $obj2;
    private $programRaznoUrl = '/rest/programrazno';
    private $objProgramRazno1;
    private $objProgramRazno2;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * najde enoto programa
     * 
     * @param ApiTester $I
     */
    public function getListProgramRazno(ApiTester $I)
    {
        $resp                   = $I->successfullyGetList($this->programRaznoUrl, []);
        $list                   = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objProgramRazno1 = $drzava                 = array_pop($list);
        $I->assertNotEmpty($drzava);
        $this->objProgramRazno2 = $drzava                 = array_pop($list);
        $I->assertNotEmpty($drzava);
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
            'naslovPE'     => 'zz',
            'avtorPE'      => 'zz',
            'obsegPE'      => 'zz',
            'mesecPE'      => 'zz',
            'vrednostPE'   => 100.11,
            'programRazno' => $this->objProgramRazno1['id']
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['naslovPE'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'naslovPE'     => 'aa',
            'avtorPE'      => 'aa',
            'obsegPE'      => 'aa',
            'mesecPE'      => 'aa',
            'vrednostPE'   => 200.22,
            'programRazno' => $this->objProgramRazno1['id']
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['naslovPE'], 'aa');
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
        $ent['avtorPE'] = 'uu';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['avtorPE'], 'uu');
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
        $I->assertEquals($ent['naslovPE'], 'zz');
        $I->assertEquals($ent['avtorPE'], 'uu');
        $I->assertEquals($ent['obsegPE'], 'zz');
        $I->assertEquals($ent['mesecPE'], 'zz');
        $I->assertEquals($ent['vrednostPE'], 100.11);
        $I->assertEquals($ent['programRazno'], $this->objProgramRazno1['id']);
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
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl;
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $totRec);
        $I->assertEquals("aa", $list[0]['naslovPE']);
        $I->assertEquals("zz", $list[$totRec - 1]['naslovPE']);
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
    public function updateZNegativnimZneskom(ApiTester $I)
    {
        //        $this->expect($this->vrednostPE > 0, "Vrednost mora biti pozitivno število", 1000651);
        // prva validacija
        $ent               = $this->obj2;
        $ent['vrednostPE'] = -100;

        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000651, $resp[0]['code'], "negativni znesek");

        // še ena validacija
        //        $this->expect($this->naslovPE, "Nima naslova PE. Naslov programske enote je obvezen podatek", 1000650);
        $ent             = $this->obj2;
        $ent['naslovPE'] = '';

        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
//        $I->assertEquals(1000650, $resp[0]['code'], "prazen naslovPE");   // ker že doctrine prej najde da je value required
    }

    /**
     * test zaokroževanja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateZaZaokrozevanje(ApiTester $I)
    {
        $data               = $this->obj2;
        $data['vrednostPE'] = 0.98765;

        $ent = $I->successfullyUpdate($this->restUrl, $data['id'], $data);
        $I->assertGuid($ent['id']);
        // testiramo, ali je zaokrožil na 2 decimalki
        $I->assertEquals(0.99, $ent['vrednostPE'], "zaokrožena vrednost");

        // test string zaokroževanja
        $data               = $this->obj2;
        $data['vrednostPE'] = -0.009;

        $resp = $I->failToUpdate($this->restUrl, $data['id'], $data);
        $I->assertEquals(1000651, $resp[0]['code']);
    }

}
