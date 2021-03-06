<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\AvtorBesedila;

use ApiTester;

/**
 * Description of AvtorBesedilaCest
 *
 * 
 * @author rado
 */
class AvtorBesedilaCest
{

    private $restUrl        = '/rest/avtorbesedila';
    private $osebaUrl       = '/rest/oseba';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $obj1;
    private $obj2;
    private $lookBesedilo1;
    private $lookBesedilo2;
    private $lookOseba1;
    private $lookOseba2;
    private $lookOseba3;
    private $lookOseba4;
    private $lookUprizoritev1;

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
    public function lookupBesedilo(ApiTester $I)
    {
        $this->lookBesedilo1 = $ent                 = $I->lookupEntity("besedilo", "0001", false);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);

        $this->lookBesedilo2 = $ent                 = $I->lookupEntity("besedilo", "0002", false);
        codecept_debug($ent);
        $I->assertGuid($ent['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebo(ApiTester $I)
    {
        // poiščemo iste osebe, kot so že v alternacijah
        $this->lookOseba1 = $ent              = $I->lookupEntity("oseba", "0009", false);
        $I->assertGuid($ent['id']);

        $this->lookOseba2 = $ent              = $I->lookupEntity("oseba", "0010", false);
        $I->assertGuid($ent['id']);

        $this->lookOseba3 = $ent              = $I->lookupEntity("oseba", "0008", false);
        $I->assertGuid($ent['id']);

        $this->lookOseba4 = $ent              = $I->lookupEntity("oseba", "0012", false);
        $I->assertGuid($ent['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $ent                    = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertGuid($ent['id']);
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'tipAvtorja'  => 'aizv',
            'zaporedna'   => 77,
            'aliVNaslovu' => true,
            'besedilo'    => $this->lookBesedilo1['id'],
            'oseba'       => $this->lookOseba1['id'],
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data       = [
            'tipAvtorja'  => 'aizv',
            'zaporedna'   => 2,
            'aliVNaslovu' => true,
            'besedilo'    => $this->lookBesedilo1['id'],
            'oseba'       => $this->lookOseba2['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis z drugim besedilom
        $data       = [
            'besedilo'    => $this->lookBesedilo2['id'],
            'tipAvtorja'  => 'apri',
            'zaporedna'   => 1,
            'aliVNaslovu' => true,
            'oseba'       => $this->lookOseba2['id'],
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getList(ApiTester $I)
//    {
//        $resp    = $I->successfullyGetList($this->restUrl, []);
//        $list    = $resp['data'];
//        codecept_debug($list);
//
//        $totalRecords = $resp['state']['totalRecords'];
//        $I->assertGreaterThanOrEqual(2, $totalRecords);
//        $I->assertEquals(2, $list[0]['zaporedna']);      //glede na sort
//        $I->assertEquals(6, $list[$totalRecords - 1]['zaporedna']);      //glede na sort
//    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoBesedilu(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl . "?besedilo=" . $this->lookBesedilo1['id'], []);
        $list = $resp['data'];
        codecept_debug($list);

        $totalRecords = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(2, $totalRecords);
        $I->assertEquals(2, $list[0]['zaporedna']);      //glede na sort
        $I->assertEquals(77, $list[$totalRecords - 1]['zaporedna']);      //glede na sort
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent               = $this->obj1;
        $ent['tipAvtorja'] = 'prev';
        $ent               = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($ent['tipAvtorja'], 'prev');
    }

    /**
     * Preberem zapis
     * 
     * @param ApiTester $I
     * @depends create
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);
        codecept_debug($ent);

        $I->assertGuid($ent['id'], 'zz');
        $I->assertEquals($ent['tipAvtorja'], 'prev');
        $I->assertEquals($ent['zaporedna'], 77);
        $I->assertEquals($ent['aliVNaslovu'], true);
        $I->assertEquals($ent['besedilo']['id'], $this->lookBesedilo1['id']);
        $I->assertEquals($ent['oseba']['id'], $this->lookOseba1['id']);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateOsebo(ApiTester $I)
    {
        $polnoIme        = 'Mojculja Vidmarski';
        $ent             = $I->successfullyGet($this->osebaUrl, $this->lookOseba2['id']);
        $ent['polnoIme'] = $polnoIme;
        $ent             = $I->successfullyUpdate($this->osebaUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        // ali je popravil avtorja v uprizoritvi?
        codecept_debug($this->lookUprizoritev1, "look upr 1");
        $ent = $I->successfullyGet($this->uprizoritevUrl, $this->lookUprizoritev1['id']);
        codecept_debug($ent['avtor']);
        $I->assertTrue(strpos($ent['avtor'], $polnoIme) !== false, "update-an avtor $polnoIme v uprizoritvi");
    }

}
