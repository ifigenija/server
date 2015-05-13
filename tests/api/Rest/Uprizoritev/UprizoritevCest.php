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
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 * relacije z drugimi entitetami
 *      - besedilo
 * - koprodukcije     
 * - vloge            
 * - arhiv            
 * - rekviziti        
 * - vaje             
 * - predstave        
 * - gostujoce        
 * - zvrstUprizoritve 
 * - zvrstSurs        
 * getlist različne variante relacij
 *      - vse
 *      - besedilo
 *
 * @author rado
 */
class UprizoritevCest
{

    private $restUrl     = '/rest/uprizoritev';
    private $besediloUrl = '/rest/besedilo';
    private $obj;
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
            'kratkiNaslov'     => 'zz',
            'besedilo'         => $this->objBesedilo['id'],
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
            'datumPremiere'    => '2010-02-01T00:00:00+0100',
            'stOdmorov'        => 3,
            'avtor'            => 'aa',
            'gostujoca'        => true,
            'trajanje'         => 4,
            'opis'             => 'aa',
            'arhIdent'         => 'aa',
            'arhOpomba'        => 'aa',
            'datumZakljucka'   => '2019-02-01T00:00:00+0100',
            'sloAvtor'         => true,
            'kratkiNaslov'     => 'aa',
            'besedilo'         => $this->objBesedilo['id'],
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
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoBesedilu(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?besedilo=" . $this->objBesedilo['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
        $I->assertEquals("aa", $list[0]['opis']);      // $$ odvisno od sortiranja
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
        codecept_debug($ent);

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
        $I->assertEquals($ent['kratkiNaslov'], 'zz');
        $I->assertEquals($ent['besedilo'], $this->objBesedilo['id']);
        $I->assertEquals($ent['zvrstUprizoritve'], null);
        $I->assertEquals($ent['zvrstSurs'], null);

        $I->assertTrue(isset($ent['koprodukcije']));
        $I->assertTrue(isset($ent['funkcije']));
        $I->assertTrue(isset($ent['arhiv']));
        $I->assertTrue(isset($ent['rekviziti']));
        $I->assertTrue(isset($ent['vaje']));
        $I->assertTrue(isset($ent['predstave']));
        $I->assertTrue(isset($ent['gostujoce']));

        $I->assertEquals(0, count($ent['koprodukcije']));
        $I->assertEquals(0, count($ent['funkcije']));
        $I->assertEquals(0, count($ent['arhiv']));
        $I->assertEquals(0, count($ent['rekviziti']));
        $I->assertEquals(0, count($ent['vaje']));
        $I->assertEquals(0, count($ent['predstave']));
        $I->assertEquals(0, count($ent['gostujoce']));
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
