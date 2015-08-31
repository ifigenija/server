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
    private $lookOseba;
    private $lookPopa;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }
    /**
     * inicializira bazo  glede na DumpFunctional.sql
     * 
     * 
     * @param ApiTester $I
     */
    public function initBaze(ApiTester $I)
    {
        $I->initDB();
    }


        /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebo(ApiTester $I)
    {
        $this->lookOseba=$ent = $I->lookupEntity("oseba", "0006",false);
        $I->assertNotEmpty($ent);
    }
    
    /**
     * 
     * @param ApiTester $I
     */
    public function lookupPopa(ApiTester $I)
    {
        $this->lookPopa=$ent = $I->lookupEntity("popa", "0988",false);
        $I->assertNotEmpty($ent);
    }

    
    /**
     *  Ustvari osebo
     * 
     * @param ApiTester $I
     */
//    public function createOseba(ApiTester $I)
//    {
//        $data           = [
//            'naziv'       => 'zz',
//            'ime'         => 'zz',
//            'priimek'     => 'zz',
//            'email'       => 'x@xxx.xx',
//            'krajRojstva' => 'zz',
//        ];
//        $this->objOseba = $oseba          = $I->successfullyCreate($this->osebaUrl, $data);
//        $I->assertEquals('zz', $oseba['ime']);
//        $I->assertNotEmpty($oseba['id']);
//    }

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
     * kreiramo vsaj en zapis
     * 
     * @depends lookupOsebo
     * @depends lookupPopa
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'vrsta'    => 'mobilna', 
            'stevilka' => '12-34',
            'privzeta' => true,
            'oseba'    => $this->lookOseba['id'],
        ];
        $this->obj = $tel       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($tel['stevilka'], '12-34');
        $I->assertNotEmpty($tel['id']);

        // še en zapis
        $data = [
            'vrsta'    => 'domaca', 
            'stevilka' => '567',
            'privzeta' => true,
            'popa'     => $this->lookPopa['id'],
//            'oseba'    => null,
        ];
        $tel  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($tel['id']);
        $I->assertEquals($tel['stevilka'], '567');

        // še en zapis
        $data = [
            'vrsta'    => 'fiksna',
            'stevilka' => '012',
            'privzeta' => true,
            'popa'     => $this->lookPopa['id'],
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
     * @param ApiTester $I
     */
    public function getListPoOsebi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?oseba=" . $this->lookOseba['id'];
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
     * @param ApiTester $I
     */
    public function getListPoPopa(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?popa=" . $this->lookPopa['id'];
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];
        codecept_debug($resp);
        
        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals('012', $list[0]['stevilka']);  
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
//        $I->assertEquals(3, $resp['state']['totalRecords']);
//        $I->assertEquals("012", $list[0]['stevilka']);     //glede na sort
//    }

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
        $I->assertEquals($tel['oseba'], $this->lookOseba['id']);
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
            'vrsta'    => 'mobilna',
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
