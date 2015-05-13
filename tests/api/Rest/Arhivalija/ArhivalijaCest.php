<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Arhivalija;

use ApiTester;

/**
 * Description of ArhivalijaCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto
 * relacije z drugimi entitetami
 * - dogodek 
 *      - uprizoritev 
 * getlist različne variante relacij
 * - vse
 * - uprizoritev
 *
 * @author rado
 */
class ArhivalijaCest
{

    private $restUrl        = '/rest/arhivalija';
    private $besediloUrl    = '/rest/besedilo';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $obj;
    private $objBesedilo;
    private $objUprizoritev;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  kreiramo besedilo
     * 
     * @param ApiTester $I
     */
    public function createBesedilo(ApiTester $I)
    {
        $data              = [
            'naslov'          => 'zz',
            'avtor'           => 'zz',
            'podnaslov'       => 'zz',
            'jezik'           => 'zz',
            'naslovIzvirnika' => 'zz',
            'datumPrejema'    => 'zz',
            'moskeVloge'      => 1,
            'zenskeVloge'     => 2,
            'prevajalec'      => 'zz',
            'povzetekVsebine' => 'zz',
        ];
        $this->objBesedilo = $ent               = $I->successfullyCreate($this->besediloUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naslov'], 'zz');
    }

    /**
     *  kreiramo zapis
     * 
     * @depends createBesedilo
     * @param ApiTester $I
     */
    public function createUprizoritev(ApiTester $I)
    {
        $data                 = [
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
            'kratkiNaslov'     => 'zz',
            'besedilo'         => $this->objBesedilo['id'],
            'zvrstUprizoritve' => null,
            'zvrstSurs'        => null,
        ];
        $this->objUprizoritev = $ent                  = $I->successfullyCreate($this->uprizoritevUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'zz');
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @depends createUprizoritev
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'oznakaDatuma'      => 'zz',
            'datum'             => '2019-02-01T00:00:00+0100',
            'fizicnaOblika'     => 'zz',
            'izvorDigitalizata' => 'zz',
            'povzetek'          => 'zz',
            'opombe'            => 'zz',
            'lokacijaOriginala' => 'zz',
            'objavljeno'        => 'zz',
            'naslov'            => 'zz',
            'avtorstvo'         => 'zz',
            'dogodek'           => null,
            'uprizoritev'       => $this->objUprizoritev['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naslov'], 'zz');
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data      = [
            'oznakaDatuma'      => 'aa',
            'datum'             => '2016-02-01T00:00:00+0100',
            'fizicnaOblika'     => 'aa',
            'izvorDigitalizata' => 'aa',
            'povzetek'          => 'aa',
            'opombe'            => 'aa',
            'lokacijaOriginala' => 'aa',
            'objavljeno'        => 'aa',
            'naslov'            => 'aa',
            'avtorstvo'         => 'aa',
            'dogodek'           => null,
            'uprizoritev'       => $this->objUprizoritev['id'],
        ];
        $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naslov'], 'aa');
        $I->assertNotEmpty($ent['id']);
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
        $I->assertEquals($ent['datum'], "2019-02-01T00:00:00+0100");
        $I->assertEquals($ent['fizicnaOblika'], 'zz');
        $I->assertEquals($ent['izvorDigitalizata'], 'zz');
        $I->assertEquals($ent['povzetek'], 'zz');
        $I->assertEquals($ent['opombe'], 'zz');
        $I->assertEquals($ent['lokacijaOriginala'], 'zz');
        $I->assertEquals($ent['objavljeno'], 'zz');
        $I->assertEquals($ent['naslov'], 'xx');
        $I->assertEquals($ent['avtorstvo'], 'zz');
        $I->assertEquals($ent['dogodek'], null);
        $I->assertEquals($ent['uprizoritev'], $this->objUprizoritev['id']);
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoUprizoritvi(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?uprizoritev=" . $this->objUprizoritev['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("aa", $list[0]['naslov']);      //  odvisno od sortiranja
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
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

    /**
     * test validacije
     * 
     * @param ApiTester $I
     */
    public function createArhivalijoBrezUprizoritveAliDogodka(ApiTester $I)
    {
//        $this->expect($this->uprizoritev || $this->dogodek, "Uprizoritev ali dogodek pri arhivaliji sta obvezna", 1000350);
//        $this->expect(!($this->uprizoritev && $this->dogodek), "Arhivalija ima  lahko samo ali uprizoritev ali oseba - ne oba hkrati", 1000351);

        $data = [
            'oznakaDatuma'      => 'zz',
            'datum'             => '2019-02-01T00:00:00+0100',
            'fizicnaOblika'     => 'zz',
            'izvorDigitalizata' => 'zz',
            'povzetek'          => 'zz',
            'opombe'            => 'zz',
            'lokacijaOriginala' => 'zz',
            'objavljeno'        => 'zz',
            'naslov'            => 'zz',
            'avtorstvo'         => 'zz',
            'dogodek'           => null,
            'uprizoritev'       => null,
        ];

        // test validacije - obstajati mora ali uprizoritev ali dogodek
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertNotEmpty($resp);
        // testiramo na enako številko napake kot je v validaciji
        $I->assertEquals(1000350, $resp[0]['code']);
    }

}
