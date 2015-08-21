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
    private $lookTipProgramskeEnote;
    private $lookUprizoritev;

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
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'celotnaVrednost' => 1.24,
//            'nasDelez'        => 4,
            'strosekOdkPred'  => 3.11,
            'stroskiOstali'  => 0.89,
            'zaproseno'       => 1.24,
//            'lastnaSredstva'  => 1.24,
//            'avtorskiHonorarji'  => 1.24,
//            'tantieme'           => 1.24,
//            'materialni'           => 1.24,
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
            'uprizoritev'     => $this->lookUprizoritev['id'],
//            'tipProgramskeEnote' => NULL,
//            'tip'                => 'gostujoci', 
            'dokument'        => null,
            'sort'            => 1,
            'imaKoprodukcije' => TRUE,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

// kreiramo še en zapis
        $data       = [
//            'celotnaVrednost' => 4.56,
//            'nasDelez'        => 22,
            'strosekOdkPred'  => 3.11,
            'stroskiOstali'  => 18.89,
            'zaproseno'       => 1.24,
//'lastnaSredstva'  => 4.56,
//            'avtorskiHonorarji'  => 4.56,
//            'tantieme'           => 4.56,
//            'materialni'           => 4.56,
//            'drugiViri'       => 4.56,
//            'vlozekGostitelja'     => 1.24,
            'uprizoritev'     => $this->lookUprizoritev['id'],
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
            'imaKoprodukcije' => FALSE,
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
        $I->assertEquals($ent['stroskiOstali'], 0.89);
        $I->assertEquals($ent['zaproseno'], 1.22, "zaprošeno");
        $I->assertEquals($ent['lastnaSredstva'], $ent['nasDelez'] - $ent['zaproseno'] - $ent['drugiJavni'] - $ent['vlozekGostitelja'], "lastna sredstva");
//        $I->assertEquals($ent['tantieme'], 1.24);
//        $I->assertEquals($ent['materialni'], 1.24);
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
        $I->assertEquals($ent['uprizoritev']['id'], $this->lookUprizoritev['id']);
//        $I->assertEquals($ent['tipProgramskeEnote'], NULL);
        $I->assertEquals($ent['dokument'], null);
        $I->assertEquals($ent['sort'], 1);
        $I->assertEquals($ent['imaKoprodukcije'], TRUE);
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
     *  kreiramo zapis s tipom programske enote
     * 
     * @depends delete
     * @depends lookuptipProgramskeEnote
     * 
     * @param ApiTester $I
     */
//    public function createSTipomProgramskeEnote(ApiTester $I)
//    {
////               $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za gostujočo", 1000431);
//        $data                        = $this->obj1;
//        $data ['tipProgramskeEnote'] = $this->lookTipProgramskeEnote['id'];
//        $resp                        = $I->failToCreate($this->restUrl, $data);
//        codecept_debug($resp);
//        $I->assertContains("required", $resp[0]['message']);
//        $I->assertEquals(1000431, $resp[0]['code']);
//    }

    /**
     * spremenim zapis za kontrolo validacije
     * 
     * @depends create
     * @param ApiTester $I
     */
//    public function updateSPrevelikimStroskomOdkupaPredstave(ApiTester $I)
//    {
//        $ent                   = $this->obj2;
//        $ent['nasDelez']       = 7;
//        $ent['strosekOdkPred'] = 7.01;    // preveliko     
//
//        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
//        codecept_debug($resp);
//        $I->assertEquals(1000433, $resp[0]['code']);
//    }

    /**
     * spremenim zapis za kontrolo zaokroževanja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateKontrolaValidacijeZaokrozevanj(ApiTester $I)
    {
        $ent                   = $this->obj2;
        $ent['strosekOdkPred'] = 15.01;      // v praksi bo že klient zaokrožil na 2 mesti
        $ent['zaproseno']      = 7.51;

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        // ali sedaj napaka pri zaprošeno?
        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        $ent['zaproseno'] = 7.52;
        $resp             = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000432, $resp[0]['code']);
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createBrezUprizoritve(ApiTester $I)
    {
//                $this->expect($this->getUprizoritev(), "Uprizoritev je obvezen podatek", 1000562);
        // brez uprizoritve
        $data       = [
            'uprizoritev'     => NULL,
            'celotnaVrednost' => 1.24,
//            'nasDelez'        => 4,
            'strosekOdkPred'  => 3.11,
            'stroskiOstali'  => 0.89,
            'zaproseno'       => 1.24,
//            'lastnaSredstva'  => 1.24,
//            'avtorskiHonorarji'  => 1.24,
//            'tantieme'           => 1.24,
//            'materialni'           => 1.24,
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
//            'tipProgramskeEnote' => NULL,
//            'tip'                => 'gostujoci', 
            'dokument'        => null,
            'sort'            => 1,
            'imaKoprodukcije' => TRUE,
        ];
        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1000434, $resp[0]['code']);
    }

}
