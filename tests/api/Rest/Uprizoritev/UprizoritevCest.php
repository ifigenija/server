<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Funkcija;

use ApiTester;

/**
 * Description of UprizoritevCest
 * 
 * metode, ki jo podpira API
 * - create
 * - getlist
 * - update
 * - get - kontrola vseh polj te entitete
 * - delete
 * validate metodo za entiteto
 * relacije z drugimi entitetami
 *
 * @author rado
 */
class UprizoritevCest
{

    private $restUrl = '/rest/uprizoritev';
    private $obj;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'faza'             => 'zz',
            'naslov'           => 'zz',
            'podnaslov'        => 'zz',
            'delovniNaslov'    => 'zz',
            'datumPremiere'    => '2010-02-01T00:00:00+0100',
            'stOdmorov'        => 1,
            'avtor'            => 'zz',
            'gostujoca'        => true,
            'trajanje'         => 2,
            'opis'             => 'zz',
            'arhIdent'         => 'zz',
            'arhOpomba'        => 'zz',
            'datumZakljucka'   => '2019-02-01T00:00:00+0100',
            'sloAvtor'         => true,
            'besedilo'         => null,
            'zvrstUprizoritve' => null,
            'zvrstSurs'        => null,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'zz');

        // kreiram še en zapis
        $data = [
            'faza'             => 'aa',
            'naslov'           => 'aa',
            'podnaslov'        => 'aa',
            'delovniNaslov'    => 'aa',
            'datumPremiere'    => '2011-02-01T00:00:00+0100',
            'stOdmorov'        => 3,
            'avtor'            => 'aa',
            'gostujoca'        => true,
            'trajanje'         => 4,
            'opis'             => 'aa',
            'arhIdent'         => 'aa',
            'arhOpomba'        => 'aa',
            'datumZakljucka'   => '2020-02-01T00:00:00+0100',
            'sloAvtor'         => true,
            'besedilo'         => null,
            'zvrstUprizoritve' => null,
            'zvrstSurs'        => null,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'aa');
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
        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertEquals("aa", $list[0]['naslov']);      //glede na sort
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent         = $this->obj;
        $ent['opis'] = 'yy';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

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
        $ent = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['faza'], 'zz');
        $I->assertEquals($ent['naslov'], 'zz');
        $I->assertEquals($ent['podnaslov'], 'zz');
        $I->assertEquals($ent['delovniNaslov'], 'zz');
        $I->assertEquals($ent['datumPremiere'], '2010-02-01T00:00:00+0100');
        $I->assertEquals($ent['stOdmorov'], 1);
        $I->assertEquals($ent['avtor'], 'zz');
        $I->assertEquals($ent['gostujoca'], true);
        $I->assertEquals($ent['trajanje'], 2);
        $I->assertEquals($ent['opis'], 'yy');
        $I->assertEquals($ent['arhIdent'], 'zz');
        $I->assertEquals($ent['arhOpomba'], 'zz');
        $I->assertEquals($ent['datumZakljucka'], '2019-02-01T00:00:00+0100');
        $I->assertEquals($ent['sloAvtor'], true);
        $I->assertEquals($ent['besedilo'], null);
        $I->assertEquals($ent['zvrstUprizoritve'], null);
        $I->assertEquals($ent['zvrstSurs'], null);
    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
