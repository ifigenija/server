<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramRazno;

use ApiTester;

/**
 * Description of ProgramRazno
 * 
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update  - ne delam, ker ima le 2 polji
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami (to many relacije)
 *           -(ni) pri many to many relacijah testiraj : update, get (list+id), delete
 * - pri one to many relacijah testiraj : get (list+id)
 *       . drugiViri
 *   . programskaEnotaSklopa
 *      getlist različne variante relacij
 * 
 *
 * @author rado
 */
class ProgramRaznoCest
{

    private $restUrl                  = '/rest/programrazno';
    private $obj1;
    private $obj2;
    private $popaUrl                  = '/rest/popa';
    private $lookPopa1;
    private $drugiVirUrl              = '/rest/drugivir';
    private $objDrugiVir1;
    private $objDrugiVir2;
    private $programskaEnotaSklopaUrl = '/rest/programskaenotasklopa';
    private $objPESklopa1;
    private $objPESklopa2;
    private $objPESklopa3;
    private $objPESklopa4;

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
    public function lookupPopa(ApiTester $I)
    {
        $this->lookPopa1 = $ent             = $I->lookupEntity("popa", "0988", false);
        $I->assertNotEmpty($ent);

        $this->lookPopa2 = $ent             = $I->lookupEntity("popa", "0986", false);
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
            'dokument'        => NULL,
            'naziv'           => 'zz',
//            'stPE'            => 1,
//            'obiskDoma'       => 1,
            'stZaposlenih'    => 1,
            'stHonorarnihZun'    => 1,
            'zaproseno'       => 0,
//            'celotnaVrednost' => 1.24,
//            'nasDelez'        => 4,
//            'lastnaSredstva'  => 1.24,
//            'drugiViri'       => 1.24,
            'drugiJavni'      => 1.24,
            'sort'            => 1,
            'imaKoprodukcije' => true,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naziv'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'dokument'        => NULL,
            'naziv'           => 'aa',
//            'naslovPE'        => 'aa',
//            'avtorPE'         => 'aa',
//            'obsegPE'         => 'aa',
//            'mesecPE'         => 'aa',
//            'vrednostPE'      => 2.23,
//            'stPE'            => 2,
//            'obiskDoma'       => 2,
            'stZaposlenih'    => 2,
            'stHonorarnihZun'    => 2,
            'zaproseno'       => 0,
//            'celotnaVrednost' => 2.23,
//            'nasDelez'        => 2.23,
//            'lastnaSredstva'  => 2.23,
//            'drugiViri'       => 2.23,
            'drugiJavni'      => 2.23,
            'sort'            => 2,
            'imaKoprodukcije' => false,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naziv'], 'aa');
    }

    /**
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function createVecProgramskihEnotSklopa(ApiTester $I)
    {
        $data               = [
            'naslovPE'     => 'zz',
            'avtorPE'      => 'zz',
            'obsegPE'      => 'zz',
            'mesecPE'      => 'zz',
            'vrednostPE'   => 1,
            'obiskDoma'   => 40,
            'programRazno' => $this->obj1['id']
        ];
        $this->objPESklopa3 = $ent                = $I->successfullyCreate($this->programskaEnotaSklopaUrl, $data);
        $I->assertGuid($ent['id']);

        // kreiramo še en zapis
        $data               = [
            'naslovPE'     => 'aa',
            'avtorPE'      => 'aa',
            'obsegPE'      => 'aa',
            'mesecPE'      => 'aa',
            'vrednostPE'   => 3,
            'obiskDoma'   => 30,
            'programRazno' => $this->obj1['id']
        ];
        $this->objPESklopa4 = $ent                = $I->successfullyCreate($this->programskaEnotaSklopaUrl, $data);
        $I->assertGuid($ent['id']);
        $data               = [
            'naslovPE'     => 'zz',
            'avtorPE'      => 'zz',
            'obsegPE'      => 'zz',
            'mesecPE'      => 'zz',
            'vrednostPE'   => 1,
            'obiskDoma'   => 30,
            'programRazno' => $this->obj2['id']
        ];
        $this->objPESklopa1 = $ent                = $I->successfullyCreate($this->programskaEnotaSklopaUrl, $data);
        $I->assertGuid($ent['id']);

        $data               = [
            'naslovPE'     => 'aa',
            'avtorPE'      => 'aa',
            'obsegPE'      => 'aa',
            'mesecPE'      => 'aa',
            'vrednostPE'   => 3,
            'obiskDoma'   => 30,
            'programRazno' => $this->obj2['id']
        ];
        $this->objPESklopa2 = $ent                = $I->successfullyCreate($this->programskaEnotaSklopaUrl, $data);
        $I->assertGuid($ent['id']);
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
//        $ent['obiskDoma'] = 33;
        $ent['zaproseno'] = 1.22;

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

//        $I->assertEquals($entR['obiskDoma'], 33);
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
        $I->assertEquals($ent['dokument'], NULL);
        $I->assertEquals($ent['naziv'], 'zz');
//        $I->assertEquals($ent['naslovPE'], 'zz');
//        $I->assertEquals($ent['avtorPE'], 'zz');
//        $I->assertEquals($ent['obsegPE'], 'zz');
//        $I->assertEquals($ent['mesecPE'], 'zz');
//        $I->assertEquals($ent['vrednostPE'], 1.24);
        $I->assertEquals($ent['stPE'], 2);
        $I->assertEquals($ent['obiskDoma'], 70);
        $I->assertEquals($ent['stZaposlenih'], 1);
        $I->assertEquals($ent['stHonorarnihZun'], 1);
        $I->assertEquals($ent['celotnaVrednost'], 4);
        $I->assertEquals($ent['nasDelez'], 4, "naš delež kot setštevek vrednostiPE");
        $I->assertEquals($ent['lastnaSredstva'], $ent['nasDelez'] - $ent['zaproseno'] - $ent['drugiJavni'] - $ent['vlozekGostitelja'], "lastna sredstva");
        $I->assertEquals($ent['zaproseno'], 1.22, "zaprošeno");
//        $I->assertEquals($ent['drugiViri'], 1.24);
        $I->assertEquals($ent['drugiJavni'], 1.24);
        $I->assertEquals($ent['sort'], 1, 'sort');
        $I->assertEquals($ent['avtorskiHonorarji'], 0);
        $I->assertEquals($ent['avtorskiHonorarjiSamoz'], 0);
        $I->assertEquals($ent['imaKoprodukcije'], TRUE);
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
     * preberemo relacije
     * 
     * @depends createVecDrugihVirov
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeSProgramskimiEnotamiSklopa(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "programskeEnoteSklopa", "");
        $I->assertGreaterThanOrEqual(2, count($resp));

        $resp = $I->successfullyGetRelation($this->restUrl, $this->obj2['id'], "programskeEnoteSklopa", $this->objPESklopa1['id']);
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

        // najprej povečamo nasDelez:
        $data               = [
            'naslovPE'     => 'uk',
            'avtorPE'      => 'uk',
            'obsegPE'      => 'uk',
            'mesecPE'      => 'uk',
            'vrednostPE'   => 14.01,
            'obiskDoma'   => 22,
            'programRazno' => $this->obj2['id']
        ];
        $ent                = $I->successfullyCreate($this->programskaEnotaSklopaUrl, $data);
        $I->assertGuid($ent['id']);
        $ent                = $I->successfullyGet($this->restUrl, $this->obj2['id']);
        $I->assertEquals(18.01, $ent['nasDelez']);
//        $ent['nasDelez']  = 18.01;      // v praksi bo že klient zaokrožil na 2 mesti

        // probamo, če bo zaprošeno dovolj malo:
        $ent['zaproseno'] = 12.61;
        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        // ali sedaj napaka pri zaprošeno?
        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        $ent['zaproseno'] = 12.62;
        $resp             = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1000554, $resp[0]['code']);
    }

}
