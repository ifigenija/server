<?php

namespace Rest\PostniNaslov;

use ApiTester;

/**
 * Priprava ostalih relacij, ki so pogoj za kreiranje
 *      - create oseba
 * - create popa
 * akcije z entiteto PostniNaslov
 * - create naslov osebe
 * - create naslov popa
 * validacija
 * - create naslov oseba+popa 
 * - create naslov prazen naziv
 * 
 * - list 
 * - update
 * - update .drzava
 * -read, preveri vsa polja
 * - delete 
 * 
 */
class PostniNaslovCest
{

    private $restUrl  = '/rest/postninaslov';
    private $osebaUrl = '/rest/oseba';
    private $popaUrl  = '/rest/popa';
    private $id       = '00000000-0000-0000-0000-000000000000';
    private $obj;
    private $objOseba;
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
     * Ustvarimo poslovnega partnerja   $$ rb to be implemented
     * 
     * @param ApiTester $I
     */
//    public function createPopa(ApiTester $I)  //$$rb to be implemented
//    {
//        
//    }

    /**
     *  napolnimo vsaj en zapis
     *
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
//            'popa'       => null,
            'oseba'      => $this->objOseba['id'],
            'naziv'      => 'zz',
            'nazivDva'   => 'zz',
            'ulica'      => 'zz',
            'ulicaDva'   => 'zz',
            'posta'      => 'zz',
            'postaNaziv' => 'zz',
            'pokrajina'  => 'zz',
            'drzava'     => 'zz',
            'jeeu '      => 'zz',
            'privzeti '  => 'zz',
        ];
        $this->obj = $pnaslov   = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals('zz', $pnaslov['nazivDva']);
        $I->assertNotEmpty($pnaslov['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $list     = $I->successfullyGetList($this->restUrl, []);
        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $pnaslov          = $this->obj;
        $pnaslov['naziv'] = 'tralala';

        $pnaslov = $I->successfullyUpdate($this->restUrl, $pnaslov['id'], $pnaslov);

        $I->assertEquals('tralala', $pnaslov['naziv']);
    }

    /**
     * Preberi zapis in preveri vsa polja
     * 
     * @param ApiTester $I
     */
    public function read(ApiTester $I)
    {
        $pnaslov = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals(null, $pnaslov['popa']);
        $I->assertEquals($this->objOseba['id'], $pnaslov['oseba']);
        $I->assertEquals('tralala', $pnaslov['naziv']);
        $I->assertEquals('zz', $pnaslov['nazivDva']);
        $I->assertEquals('zz', $pnaslov['ulica']);
        $I->assertEquals('zz', $pnaslov['ulicaDva']);
        $I->assertEquals('zz', $pnaslov['posta']);
        $I->assertEquals('zz', $pnaslov['postaNaziv']);
        $I->assertEquals('zz', $pnaslov['pokrajina']);
        $I->assertEquals('zz', $pnaslov['drzava']);
        $I->assertEquals('zz', $pnaslov['jeeu ']);
        $I->assertEquals('zz', $pnaslov['privzeti ']);
    }

    // tests
    public function delete(ApiTester $I)
    {
        $pnaslov = $I->successfullyDelete($this->restUrl, $this->obj['id']);

        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
