<?php

/*
 *  Licenca GPLv3
 */

namespace Zapisi\Datoteka;

use ApiTester;

/**
 * Description of DatotekaCest
 * 
 * 
 * @author rado
 */
class DatotekaCest
{

    private $restUrl    = '/rest/datoteka/default';
    private $restUrlVse = '/rest/datoteka/vse';
    private $obj1;
    private $obj2;
    private $lookUser1;
    private $lookUser2;
    private $lookUser3;

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
        $this->lookUser2 = $ent             = $I->lookupEntity("user", \IfiTest\AuthPage::$irena, false);
        $I->assertGuid($ent['id']);
        
        $this->lookUser3 = $ent             = $I->lookupEntity("user", \IfiTest\AuthPage::$breznik, false);
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
            'filename' => 'aa',
            'owner'    => $this->lookUser2['id'],
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent          = $this->obj1;
        $ent['owner'] = $this->lookUser3['id'];

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['owner']['id'], $ent['owner'] );
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
        $I->assertEquals($ent['filename'], 'aa');
        $I->assertEquals($ent['owner']['id'], $this->lookUser3['id']);
    }

    /**
     * get list je nalašč disablean
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp = $I->failToGetList($this->restUrl, []);
        codecept_debug($resp);
        $I->assertEquals('list disabled', $resp[0]['message']);
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
