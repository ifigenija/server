<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramIzjemni;

use ApiTester;

/**
 * Description of ProgramIzjemniCest
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
 *                -(ni) pri many to many relacijah testiraj : update, get (list+id), delete
 *           - pri one to many relacijah testiraj : get (list+id)
 *            . drugiViri
 *           getlist različne variante relacij
 * 
 *
 * @author rado
 */
class ProgramIzjemniCest
{

    private $restUrl               = '/rest/programizjemni';
    private $obj1;
    private $obj2;
    private $uprizoritevUrl        = '/rest/uprizoritev';
    private $lookUprizoritev;
    private $tipProgramskeEnoteUrl = '/rest/tipprogramskeenote';
    private $lookTipProgramskeEnote;
    private $drugiVirUrl           = '/rest/drugivir';
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
            'naziv'                  => "zz",
//            'celotnaVrednost'   => 1.24,
//            'nasDelez'               => 5,
            'zaproseno'              => 1.24,
//            'lastnaSredstva'    => 1.24,
            'avtorskiHonorarji'      => 1.24,
            'avtorskiHonorarjiSamoz' => 1.24,
            'tantieme'               => 1.24,
            'materialni'             => 1.24,
            'avtorskePravice'        => 1.24,
//            'drugiViri'            => 1.24,
//            'vlozekGostitelja'     => 1.24,
            'drugiJavni'             => 1.24,
            'obiskDoma'              => 1,
            'obiskGost'              => 1,
            'obiskZamejo'            => 1,
            'obiskInt'               => 1,
            'ponoviDoma'             => 1,
            'ponoviZamejo'           => 1,
            'ponoviGost'             => 1,
            'ponoviInt'              => 1,
//            'uprizoritev'          => NULL,
//            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote['id'],
            'dokument'               => null,
            'sort'                   => 1,
            'imaKoprodukcije'        => true,
            'stZaposlenih'           => 1,
//            'stDrugih'             => 1,
            'stHonorarnih'           => 1,
            'stHonorarnihIgr'        => 1,
            'stHonorarnihIgrTujJZ'   => 1,
            'stHonorarnihIgrSamoz'   => 1,
            'trajanje'               => "avgust-oktober",
            'prizorisce'             => "samostan",
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data       = [
            'naziv'                  => "zz",
//            'celotnaVrednost'   => 4.56,
//            'nasDelez'               => 19,
            'zaproseno'              => 4.56,
//            'lastnaSredstva'    => 4.56,
            'avtorskiHonorarji'      => 4.56,
            'avtorskiHonorarjiSamoz' => 4.56,
            'tantieme'               => 4.56,
            'materialni'             => 4.56,
            'avtorskePravice'        => 4.56,
//            'drugiViri'            => 4.56,
//            'vlozekGostitelja'     => 1.24,
            'drugiJavni'             => 4.56,
            'obiskDoma'              => 4,
            'obiskGost'              => 4,
            'obiskZamejo'            => 4,
            'obiskInt'               => 4,
            'ponoviDoma'             => 4,
            'ponoviZamejo'           => 4,
            'ponoviGost'             => 4,
            'ponoviInt'              => 4,
//            'uprizoritev'          => NULL,
//            'tipProgramskeEnote'   => $this->lookTipProgramskeEnote['id'],
            'dokument'               => null,
            'sort'                   => 2,
            'imaKoprodukcije'        => false,
            'stZaposlenih'           => 2,
//            'stDrugih'             => 2,
            'stHonorarnih'           => 2,
            'stHonorarnihIgr'        => 2,
            'stHonorarnihIgrTujJZ'   => 2,
            'stHonorarnihIgrSamoz'   => 2,
            'trajanje'               => "avgust-oktober",
            'prizorisce'             => "samostan",
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

        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertEquals($ent['celotnaVrednost'], 4.96);
        $I->assertEquals($ent['nasDelez'], 4.96);
        $I->assertEquals($ent['zaproseno'], 1.22, "zaprošeno");
        $I->assertEquals($ent['vlozekGostitelja'], 0);
        $I->assertEquals($ent['lastnaSredstva'], $ent['nasDelez'] - $ent['zaproseno'] - $ent['drugiJavni'] - $ent['vlozekGostitelja'], "lastna sredstva");
        $I->assertEquals($ent['avtorskiHonorarji'], 1.24);
        $I->assertEquals($ent['avtorskiHonorarjiSamoz'], 1.24);
        $I->assertEquals($ent['tantieme'], 1.24);
        $I->assertEquals($ent['materialni'], 1.24);
        $I->assertEquals($ent['avtorskePravice'], 1.24);
//        $I->assertEquals($ent['vlozekGostitelja'], 1.24);
        $I->assertEquals($ent['drugiJavni'], 1.24);
        $I->assertEquals($ent['obiskDoma'], 1);
        $I->assertEquals($ent['obiskGost'], 1);
        $I->assertEquals($ent['obiskZamejo'], 1);
        $I->assertEquals($ent['obiskInt'], 1);
        $I->assertEquals($ent['ponoviDoma'], 1);
        $I->assertEquals($ent['ponoviZamejo'], 1);
        $I->assertEquals($ent['ponoviGost'], 1);
        $I->assertEquals($ent['ponoviInt'], 1);
//        $I->assertEquals($ent['uprizoritev'], NULL);
//        $I->assertEquals($ent['tipProgramskeEnote'], $this->lookTipProgramskeEnote['id']);

        $I->assertEquals($ent['dokument'], null);
        $I->assertEquals($ent['sort'], 1, "sort");
        $I->assertEquals($ent['imaKoprodukcije'], true);
        $I->assertEquals($ent['stZaposlenih'], 1);
//        $I->assertEquals($ent['stDrugih'], 1);
        $I->assertEquals($ent['stHonorarnih'], 1, "št. honorarnih");
        $I->assertEquals($ent['stHonorarnihIgr'], 1);
        $I->assertEquals($ent['stHonorarnihIgrTujJZ'], 1);
        $I->assertEquals($ent['stHonorarnihIgrSamoz'], 1);
        $I->assertEquals($ent['trajanje'], "avgust-oktober");
        $I->assertEquals($ent['prizorisce'], "samostan");
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
//    public function getListVse(ApiTester $I)
//    {
//        $listUrl = $this->restUrl . "/vse";
//        codecept_debug($listUrl);
//        $resp    = $I->successfullyGetList($listUrl, []);
//        $list    = $resp['data'];
//
//        $I->assertNotEmpty($list);
//        $I->assertGreaterThanOrEqual(2, $resp['state']['totalRecords']);
//    }

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
     * spremenim zapis za kontrolo zaokroževanja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateKontrolaValidacijeZaokrozevanj(ApiTester $I)
    {
        $ent                      = $this->obj2;
        $ent['avtorskiHonorarji'] = 10;      // v praksi bo že klient zaokrožil na 2 mesti
        $ent['tantieme']          = 8.01;
        $ent['avtorskePravice']   = 0;
        $ent['materialni']        = 0;
        $ent['zaproseno']         = 18.01;

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        // ali sedaj napaka pri zaprošeno?
        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        $ent['zaproseno'] = 18.02;
        $resp             = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000544, $resp[0]['code']);
    }

    /**
     * test validate
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateBrezNaziva(ApiTester $I)
    {
        $ent          = $this->obj2;
        $ent['naziv'] = '';

        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        codecept_debug($resp);
        $I->assertEquals(1000545, $resp[0]['code']);
    }

}
