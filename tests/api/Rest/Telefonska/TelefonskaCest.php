<?php

namespace Rest\Telefonska;

use ApiTester;

/**
 * Priprava ostalih entitet
 *      - create oseba
 * 
 *      - create
 *      - list 
 *      - update
 *      - read 
 *      - delete
 *      - validacija 
 * 
 */
class TelefonskaCest
{

    private $restUrl   = '/rest/telefonska';
    private $osebaUrl  = '/rest/oseba';
    private $drzavaUrl = '/rest/drzava';
    private $popaUrl   = '/rest/popa';
    private $id        = '00000000-0000-0000-0000-000000000000';
    private $obj;
    private $objOseba;
    private $objDrzava;
    private $objPopa;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  Ustvari osebo
     * 
     * @param ApiTester $I
     */
    public function createOseba(ApiTester $I)
    {
        $data           = [
            'naziv'       => 'zz',
            'ime'         => 'zz',
            'priimek'     => 'zz',
            'email'       => 'x@xxx.xx',
            'krajRojstva' => 'zz',
        ];
        $this->objOseba = $oseba          = $I->successfullyCreate($this->osebaUrl, $data);
        $I->assertEquals('zz', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);
    }

    /**
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
     * kreiram poslovnega partnerja
     * 
     * @depends getListDrzava
     * @param ApiTester $I
     */
    public function createPopa(ApiTester $I)
    {
        $data          = [
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
        $this->objPopa = $popa          = $I->successfullyCreate($this->popaUrl, $data);

//        codecept_debug($popa);
        $I->assertNotEmpty($popa['id']);
        $I->assertEquals('ZZ12', $popa['sifra']);
    }

    /**
     * kreiramo vsaj en zapis
     * 
     * @depends createOseba
     * @depends createPopa
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'vrsta'    => 'mobilna', //$$ rb - popraviti opcije, kasneje M namesto mobilni
            'stevilka' => '12-34',
            'privzeta' => true,
            'oseba'    => $this->objOseba['id'],
        ];
        $this->obj = $tel       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($tel['stevilka'], '12-34');
        $I->assertNotEmpty($tel['id']);

        // še en zapis
        $data = [
            'vrsta'    => 'domaca', //$$ rb - popraviti opcije, kasneje M namesto mobilni
            'stevilka' => '567',
            'privzeta' => true,
            'popa'     => $this->objPopa['id'],
//            'oseba'    => null,
        ];
        $tel  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($tel['id']);
        $I->assertEquals($tel['stevilka'], '567');

        // še en zapis
        $data = [
            'vrsta'    => 'fiksna', //$$ rb - popraviti opcije, kasneje M namesto mobilni
            'stevilka' => '012',
            'privzeta' => true,
            'popa'     => $this->objPopa['id'],
//            'oseba'    => null,
        ];
        $tel  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($tel['id']);
        $I->assertEquals($tel['stevilka'], '012');
    }

    /**
     * preberi vse naslove od osebe
     * 
     * @depends create
     * @depends createOseba
     * @param ApiTester $I
     */
    public function getListPoOsebi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?oseba=" . $this->objOseba['id'];
        codecept_debug($listUrl);

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];

        $I->assertEquals(1, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals('12-34', $list[0]['stevilka']);
    }

    /**
     * preberi vse naslove od poslovnega partnerja
     * 
     * @depends create
     * @depends createPopa
     * @param ApiTester $I
     */
    public function getListPoPopa(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?popa=" . $this->objPopa['id'];
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals('567', $list[0]['stevilka']);  //$$ rb tu je lahko drugačen rezultat, ker sort pri Criteria še ne deluje ok
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
        $I->assertEquals(3, $resp['state']['totalRecords']);
        $I->assertEquals("012", $list[0]['stevilka']);     //glede na sort
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent             = $this->obj;
        $ent['stevilka'] = '772-222';
        codecept_debug($ent);

        
        // $$ ne deluje, ker je popa hidden
        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals($ent['stevilka'], '772-222');
    }

    /**
     * prebere telefonsko in preveri vsa polja
     * 
     * @depends update
     * @param ApiTester $I
     */
    public function read(ApiTester $I)
    {
        $tel = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals($tel['vrsta'], 'mobilna');
        $I->assertEquals($tel['stevilka'], '772-222');
        $I->assertEquals($tel['privzeta'], true);
        $I->assertEquals($tel['oseba'], $this->objOseba['id']);
        $I->assertEquals($tel['popa'], null);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $tel = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

    /**
     * kreiramo telefonsko, test validacije
     * 
     * @param ApiTester $I
     */
    public function createTelefonskeBrezOsebeAliPopa(ApiTester $I)
    {

        $data = [
            'vrsta'    => 'mobilna', //$$ rb - popraviti opcije, kasneje M namesto mobilni
            'stevilka' => '12-34',
            'privzeta' => true,
        ];
        // test validacije - obstajati mora ali oseba ali popa
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000460, $resp[0]['code']);
    }

}
