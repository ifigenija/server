<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramPonovitevPremiere;

use ApiTester;

/**
 * Description of ProgramPonovitevPremiereCest
 * 
 * 
 *           metode, ki jo podpira API
 *           - create
 *           - getlist
 *           - update
 *           - get - kontrola vseh polj te entitete
 *           - delete
 *           validate metodo za entiteto
 *           relacije z drugimi entitetami (to many relacije)
 *           - pri many to many relacijah testiraj : update, get (list+id), delete
 *           getlist različne variante relacij
 * 
 *
 * @author rado
 */
class ProgramPonovitevPremiereCest
{

    private $restUrl               = '/rest/programponovitevpremiere';
    private $obj1;
    private $obj2;
    private $uprizoritevUrl        = '/rest/uprizoritev';
    private $lookUprizoritev;
    private $tipProgramskeEnoteUrl = '/rest/tipprogramskeenote';
    private $lookTipProgramskeEnote;

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
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev = $look                  = $I->lookupEntity("uprizoritev", "0001", false);
        $I->assertNotEmpty($look);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookuptipProgramskeEnote(ApiTester $I)
    {
        $this->lookTipProgramskeEnote = $look                         = $I->lookupEntity("tipProgramskeEnote", "01", false);
        $I->assertNotEmpty($look);
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
            'tipProgramskeEnote' => $this->lookTipProgramskeEnote['id'],
            'dokument'           => null,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'celotnaVrednost'    => 4.56,
            'zaproseno'          => 4.56,
            'lastnaSredstva'     => 4.56,
            'avtorskiHonorarji'  => 4.56,
            'tantieme'           => 4.56,
            'drugiViri'          => 4.56,
            'drugiJavni'         => 4.56,
            'obiskDoma'          => 4,
            'obiskGost'          => 4,
            'obiskZamejo'        => 4,
            'obiskInt'           => 4,
            'ponoviDoma'         => 4,
            'ponoviZamejo'       => 4,
            'ponoviGost'         => 4,
            'ponoviInt'          => 4,
            'utemeljitev'        => 'aa',
            'uprizoritev'        => NULL,
            'tipProgramskeEnote' => $this->lookTipProgramskeEnote['id'],
            'dokument'           => null,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'aa');
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent                       = $this->obj1;
        $ent['zaproseno']          = 2.34;

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['zaproseno'], 2.34);
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
        $I->assertEquals($ent['celotnaVrednost'], 1.23);
        $I->assertEquals($ent['zaproseno'], 2.34);
        $I->assertEquals($ent['lastnaSredstva'], 1.23);
        $I->assertEquals($ent['avtorskiHonorarji'], 1.23);
        $I->assertEquals($ent['tantieme'], 1.23);
        $I->assertEquals($ent['drugiViri'], 1.23);
        $I->assertEquals($ent['drugiJavni'], 1.23);
        $I->assertEquals($ent['obiskDoma'], 1);
        $I->assertEquals($ent['obiskGost'], 1);
        $I->assertEquals($ent['obiskZamejo'], 1);
        $I->assertEquals($ent['obiskInt'], 1);
        $I->assertEquals($ent['ponoviDoma'], 1);
        $I->assertEquals($ent['ponoviZamejo'], 1);
        $I->assertEquals($ent['ponoviGost'], 1);
        $I->assertEquals($ent['ponoviInt'], 1);
        $I->assertEquals($ent['utemeljitev'], 'zz');
        $I->assertEquals($ent['uprizoritev'], NULL);
        $I->assertEquals($ent['tipProgramskeEnote'], $this->lookTipProgramskeEnote['id']);
        $I->assertEquals($ent['dokument'], null);
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

}
