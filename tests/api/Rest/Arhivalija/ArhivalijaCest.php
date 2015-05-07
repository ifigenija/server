<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Arhivalija;

use ApiTester;

/**
 * Description of ArhivalijaCest
 * metode, ki jo podpira API
 * - create
 * - getlist
 * - update
 * - get - kontrola vseh polj te entitete
 * - delete
 * validate metodo za entiteto
 * relacije z drugimi entitetami
 * - dogodek 
 * - uprizoritev 
 *
 * @author rado
 */
class ArhivalijaCest
{

    private $restUrl = '/rest/arhivalija';
    private $obj;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'oznakaDatuma'      => 'zz',
            'datum'             => 'zz',
            'fizicnaOblika'     => 'zz',
            'izvorDigitalizata' => 'zz',
            'povzetek'          => 'zz',
            'opombe'            => 'zz',
            'lokacijaOriginala' => 'zz',
            'objavljeno'        => 'zz',
            'naslov'            => 'zz',
            'avtorstvo'         => 'zz',
//            'dogodek'           => null,
//            'uprizoritev'       => null,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naslov'], 'zz');
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl, []);
        $list = $resp['data'];

        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
        $I->assertNotEmpty($this->id);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent           = $this->obj;
        $ent['naslov'] = 'xx';

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($ent['naslov'], 'xx');
    }

    /**
     * Preberem zapis
     * 
     * @param ApiTester $I
     * @depends create
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertEquals($ent['oznakaDatuma'], 'zz');
        $I->assertEquals($ent['datum'], 'zz');
        $I->assertEquals($ent['fizicnaOblika'], 'zz');
        $I->assertEquals($ent['izvorDigitalizata'], 'zz');
        $I->assertEquals($ent['povzetek'], 'zz');
        $I->assertEquals($ent['opombe'], 'zz');
        $I->assertEquals($ent['lokacijaOriginala'], 'zz');
        $I->assertEquals($ent['objavljeno'], 'zz');
        $I->assertEquals($ent['naslov'], 'xx');
        $I->assertEquals($ent['avtorstvo'], 'zz');
        $I->assertEquals($ent['dogodek'], null);
        $I->assertEquals($ent['uprizoritev'], null);
    }

    /**
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
