<?php

namespace Rest\Funkcija;

use ApiTester;

/**
 * Description of FunkcijaCest

 * 
 * metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 * relacije z drugimi entitetami
 * - alternacije
 *      - uprizoritev 
 * - privzeta alternacija
 * - tipFunkcije    
 * 
 * getlist različne variante relacij
 *      - vse
 *      - uprizoritev
 * - tipFunkcije    $$ rb - v katerem view-ju bo to?
 * 
 * @author rado
 */
class FunkcijaCest
{

    private $restUrl        = '/rest/funkcija';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $besediloUrl    = '/rest/besedilo';
    private $obj;
    private $objUprizoritev;
    private $objBesedilo;

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
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'podrocje'    => 1,
            'naziv'       => 'zz',
            'velikost'    => 'zz',
            'pomembna'    => true,
            'sort'        => 2,
            'uprizoritev' => $this->objUprizoritev['id'],
            'privzeti'    => null,
            'tipFunkcije'    => null,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data = [
            'podrocje'    => 3,
            'naziv'       => 'aa',
            'velikost'    => 'aa',
            'pomembna'    => true,
            'sort'        => 4,
            'uprizoritev' => $this->objUprizoritev['id'],
            'privzeti'    => null,
            'tipFunkcije'    => null,
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naziv'], 'aa');
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * 
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
        $this->id = array_pop($list)['id'];
        $I->assertNotEmpty($this->id);
        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertEquals("aa", $list[0]['naziv']);      //glede na sort
    }

    /**
     * preberi vse zapise od uprizoritve
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
        $I->assertEquals("aa", $list[0]['naziv']);      // odvisno od sortiranja
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent             = $this->obj;
        $ent['velikost'] = 'yy';

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['velikost'], 'yy');
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
        codecept_debug($ent);
        
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['podrocje'], 1);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertEquals($ent['velikost'], 'yy', "velikost funkcije");
        $I->assertEquals($ent['pomembna'], true);
        $I->assertEquals($ent['sort'], 2);
        $I->assertEquals($ent['uprizoritev'], $this->objUprizoritev['id']);
        $I->assertEquals($ent['privzeti'], null, "privzeti");
        $I->assertEquals($ent['tipFunkcije'], null, "tip funkcije");

        $I->assertTrue(isset($ent['alternacije']));

        $I->assertEquals(0, count($ent['alternacije']));
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
