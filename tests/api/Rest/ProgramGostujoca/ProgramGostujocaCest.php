<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramGostujoca;

use ApiTester;

/**
 * Description of ProgramGostujocaCest
 * 
 * 
 *         metode, ki jo podpira API
 *         - create
 *         - getlist
 *         - update
 *         - get - kontrola vseh polj te entitete
 *         - delete
 *         validate metodo za entiteto
 *         relacije z drugimi entitetami (to many relacije)
 *              -(ni) pri many to many relacijah testiraj : update, get (list+id), delete
 *         - pri one to many relacijah testiraj : get (list+id)
 *          . drugiViri
 *         getlist različne variante relacij
 *  *
 * @author rado
 */
class ProgramGostujocaCest
{

    private $restUrl     = '/rest/programgostujoca';
    private $obj1;
    private $obj2;
    private $drugiVirUrl = '/rest/drugivir';
    private $objDrugiVir1;
    private $objDrugiVir2;

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
            'celotnaVrednost' => 1.24,
            'nasDelez'        => 4,
            'strosekOdkPred'        => 3.11,
            'zaproseno'            =>1.24,
//            'lastnaSredstva'  => 1.24,
//            'avtorskiHonorarji'  => 1.24,
//            'tantieme'           => 1.24,
//            'drugiViri'       => 1.24,
//            'vlozekGostitelja'     => 1.24,
            'drugiJavni'      => 1.24,
            'obiskDoma'       => 1,
//            'obiskGost'          => 1,
//            'obiskZamejo'        => 1,
//            'obiskInt'           => 1,
            'ponoviDoma'      => 1,
//            'ponoviZamejo'       => 1,
//            'ponoviGost'         => 1,
//            'ponoviInt'          => 1,
            'uprizoritev'     => NULL,
//            'tipProgramskeEnote' => NULL,
//            'tip'                => 'gostujoci', 
            'dokument'        => null,
            'sort'            => 1,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data       = [
            'celotnaVrednost' => 4.56,
            'nasDelez'        => 4.56,
            'strosekOdkPred'        => 3.11,
            'zaproseno'            =>1.24,
//'lastnaSredstva'  => 4.56,
//            'avtorskiHonorarji'  => 4.56,
//            'tantieme'           => 4.56,
//            'drugiViri'       => 4.56,
//            'vlozekGostitelja'     => 1.24,
            'drugiJavni'      => 4.56,
            'obiskDoma'       => 4,
//            'obiskGost'          => 4,
//            'obiskZamejo'        => 4,
//            'obiskInt'           => 4,
            'ponoviDoma'      => 4,
//            'ponoviZamejo'       => 4,
//            'ponoviGost'         => 4,
//            'ponoviInt'          => 4,
//            'tipProgramskeEnote' => NULL,
            'dokument'        => null,
            'sort'            => 2,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
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
        $ent              = $this->obj1;
        $ent['zaproseno'] = 1.22;

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['zaproseno'], 1.22);
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
        $I->assertEquals($ent['celotnaVrednost'], 4);
        $I->assertEquals($ent['nasDelez'], 4);
        $I->assertEquals($ent['strosekOdkPred'], 3.11);
        $I->assertEquals($ent['zaproseno'], 1.22, "zaprošeno");
         $I->assertEquals($ent['lastnaSredstva'], $ent['nasDelez'] - $ent['zaproseno'] - $ent['drugiJavni'] - $ent['vlozekGostitelja'], "lastna sredstva");
//        $I->assertEquals($ent['tantieme'], 1.24);
//        $I->assertEquals($ent['drugiViri'], 1.24);
//        $I->assertEquals($ent['vlozekGostitelja'], 1.24);
        $I->assertEquals($ent['drugiJavni'], 1.24);
        $I->assertEquals($ent['obiskDoma'], 1);
//        $I->assertEquals($ent['obiskGost'], 1);
//        $I->assertEquals($ent['obiskZamejo'], 1);
//        $I->assertEquals($ent['obiskInt'], 1);
        $I->assertEquals($ent['ponoviDoma'], 1);
//        $I->assertEquals($ent['ponoviZamejo'], 1);
//        $I->assertEquals($ent['ponoviGost'], 1);
//        $I->assertEquals($ent['ponoviInt'], 1);
        $I->assertEquals($ent['uprizoritev'], NULL);
//        $I->assertEquals($ent['tipProgramskeEnote'], NULL);
        $I->assertEquals($ent['dokument'], null);
        $I->assertEquals($ent['sort'], 1);
        $I->assertEquals($ent['avtorskiHonorarji'], 0);
        $I->assertEquals($ent['avtorskiHonorarjiSamoz'], 0);
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
    public function createVecDrugihVirov(ApiTester $I)
    {
        $data               = [
            'znesek'        => 1.24,
            'opis'          => "zz",
            'enotaPrograma' => $this->obj2['id'],
            'mednarodni'    => FALSE,
        ];
        $this->objDrugiVir1 = $ent                = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data               = [
            'znesek'        => 1.24,
            'opis'          => "dd",
            'enotaPrograma' => $this->obj2['id'],
            'mednarodni'    => true,
        ];
        $this->objDrugiVir2 = $ent                = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * preberemo relacije
     * 
     * @depends createVecDrugihVirov
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZDrugimiViri(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "drugiViri", "");
        $I->assertGreaterThanOrEqual(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "drugiViri", $this->objDrugiVir1['id']);
        $I->assertGreaterThanOrEqual(1, count($resp));
    }

}
