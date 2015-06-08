<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\TipProgramskeEnote;

use ApiTester;

/**
 * Description of TipProgramskeEnoteCest
 * 
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 * relacije z drugimi entitetami (to many relacije)
 * - pri many to many relacijah testiraj : update, get (list+id), delete
 *      getlist različne variante relacij
 *      - vse
 *      - default
 * 
 *
 * @author rado
 */
class TipProgramskeEnoteCest
{

    private $restUrl             = '/rest/tipprogramskeenote';
    private $obj1;
    private $obj2;
    private $programPremieraUrl  = '/rest/programpremiera';
    private $programPonovitevUrl = '/rest/programponovitev';
    private $objProgramPremiera1;
    private $objProgramPonovitev1;

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
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'sifra'        => 'ZZ',
            'naziv'        => 'zz',
            'koprodukcija' => FALSE,
            'maxFaktor'    => 0.75,
            'maxVsi'       => 0.86,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['sifra'], 'ZZ');

        // kreiramo še en zapis
        $data       = [
            'sifra'        => 'AA',
            'naziv'        => 'aa',
            'koprodukcija' => true,
            'maxFaktor'    => 0.12,
            'maxVsi'       => 0.11,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['sifra'], 'AA');
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
        $ent['naziv'] = 'yy';

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['naziv'], 'yy');
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

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['sifra'], 'ZZ');
        $I->assertEquals($ent['naziv'], 'yy');
        $I->assertEquals($ent['koprodukcija'], FALSE);
        $I->assertEquals($ent['maxFaktor'], 0.75);
        $I->assertEquals($ent['maxVsi'], 0.86);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListVse(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl;
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
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

    /**
     *  kreiramo zapis
     * 
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecEnotPrograma(ApiTester $I)
    {
        //premiera
        $data                      = [
            'celotnaVrednost'    => 1.23,
            'zaproseno'          => 1.23,
            'lastnaSredstva'     => 1.23,
            'avtorskiHonorarji'  => 1.23,
            'tantieme'           => 1.23,
            'drugiViri'          => 1.23,
            'drugiJavni'         => 1.23,
            'obiskDoma'          => 1,
            'obiskGost'          => 1,
            'obiskZamejo'        => 1,
            'obiskInt'           => 1,
            'ponoviDoma'         => 1,
            'ponoviZamejo'       => 1,
            'ponoviGost'         => 1,
            'ponoviInt'          => 1,
            'utemeljitev'        => 'zz',
            'uprizoritev'        => NULL,
            'tipProgramskeEnote' => $this->obj2, 
            'tip'                => 'premiera',
            'dokument'           => null,
        ];
        $this->objProgramPremiera1 = $ent                       = $I->successfullyCreate($this->programPremieraUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz');

        //ponovitev 
        $data                      = [
            'celotnaVrednost'    => 1.23,
            'zaproseno'          => 1.23,
            'lastnaSredstva'     => 1.23,
            'avtorskiHonorarji'  => 1.23,
            'tantieme'           => 1.23,
            'drugiViri'          => 1.23,
            'drugiJavni'         => 1.23,
            'obiskDoma'          => 1,
            'obiskGost'          => 1,
            'obiskZamejo'        => 1,
            'obiskInt'           => 1,
            'ponoviDoma'         => 1,
            'ponoviZamejo'       => 1,
            'ponoviGost'         => 1,
            'ponoviInt'          => 1,
            'utemeljitev'        => 'zz',
            'uprizoritev'        => NULL,
            'tipProgramskeEnote' => $this->obj2, 
            'tip'                => 'ponovitev',
            'dokument'           => null,
        ];
        $this->objProgramPonovitev1 = $ent                       = $I->successfullyCreate($this->programPonovitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz');
    }

        /**
     * preberemo relacije
     * 
     * @depends createVecEnotPrograma
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZEnotamiPrograma(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "enotePrograma", "");
        $I->assertGreaterThanOrEqual(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "enotePrograma", $this->objProgramPonovitev1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));
    }

    
}
