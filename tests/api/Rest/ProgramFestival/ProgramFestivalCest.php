<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramFestival;

use ApiTester;

/**
 * Description of ProgramFestivalCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update  
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto
 *      relacije z drugimi entitetami (to many relacije)
 *           -(ni) pri many to many relacijah testiraj : update, get (list+id), delete
 *      - pri one to many relacijah testiraj : get (list+id)
 *       . drugiViri
 *      getlist različne variante relacij
 *      - vse
 *      - default
 *
 * @author rado
 */
class ProgramFestivalCest
{

    private $restUrl     = '/rest/programfestival';
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
            'programDela'             => null,
            'naziv'                   => 'zz',
            'zvrst'                   => 'zz',
            'stPredstav'              => 1,
            'stOkroglihMiz'           => 1,
            'stPredstavitev'          => 1,
            'stDelavnic'              => 1,
            'stDrugiDogodki'          => 1,
            'opredelitevDrugiDogodki' => 'zz',
            'stProdukcij'             => 1,
            'obiskDoma'               => 1,
            'casPriprave'             => 'zz',
            'casIzvedbe'              => 'zz',
            'prizorisca'              => 'zz',
            'umetVodja'               => 'zz',
            'programskoTelo'          => 'zz',
            'soorganizatorji'         => 'zz',
            'stTujihSelektorjev'      => 1,
            'stZaposlenih'            => 1,
            'stHonorarnih'            => 1,
//            'celotnaVrednost'         => 1.24,
            'nasDelez'                => 4,
            'zaproseno'               => 1.24,
//            'lastnaSredstva'          => 1.24,
//            'drugiViri'               => 1.24,
            'drugiJavni'              => 1.24,
            'sort'                    => 1,
            'imaKoprodukcije'                    => TRUE,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naziv'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'programDela'             => null,
            'naziv'                   => 'aa',
            'zvrst'                   => 'aa',
            'stPredstav'              => 2,
            'stOkroglihMiz'           => 2,
            'stPredstavitev'          => 2,
            'stDelavnic'              => 2,
            'stDrugiDogodki'          => 2,
            'opredelitevDrugiDogodki' => 'aa',
            'stProdukcij'             => 2,
            'obiskDoma'               => 2,
            'casPriprave'             => 'aa',
            'casIzvedbe'              => 'aa',
            'prizorisca'              => 'aa',
            'umetVodja'               => 'aa',
            'programskoTelo'          => 'aa',
            'soorganizatorji'         => 'aa',
            'stTujihSelektorjev'      => 2,
            'stZaposlenih'            => 2,
            'stHonorarnih'            => 2,
//            'zaproseno'            =>1.23,
            'nasDelez'                => 2.24,
            'zaproseno'               => 1.11,
//            'lastnaSredstva'          => 2.24,
//            'drugiViri'               => 2.24,
            'drugiJavni'              => 2.24,
            'sort'                    => 2,
            'imaKoprodukcije'                    => FALSE,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['naziv'], 'aa');
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
        $I->assertEquals($ent['programDela'], null);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertEquals($ent['zvrst'], 'zz');
        $I->assertEquals($ent['stPredstav'], 1);
        $I->assertEquals($ent['stOkroglihMiz'], 1);
        $I->assertEquals($ent['stPredstavitev'], 1);
        $I->assertEquals($ent['stDelavnic'], 1);
        $I->assertEquals($ent['stDrugiDogodki'], 1);
        $I->assertEquals($ent['opredelitevDrugiDogodki'], 'zz');
        $I->assertEquals($ent['stProdukcij'], 1);
        $I->assertEquals($ent['obiskDoma'], 1);
        $I->assertEquals($ent['casPriprave'], 'zz');
        $I->assertEquals($ent['casIzvedbe'], 'zz');
        $I->assertEquals($ent['prizorisca'], 'zz');
        $I->assertEquals($ent['umetVodja'], 'zz');
        $I->assertEquals($ent['programskoTelo'], 'zz');
        $I->assertEquals($ent['soorganizatorji'], 'zz');
        $I->assertEquals($ent['stTujihSelektorjev'], 1);
        $I->assertEquals($ent['stZaposlenih'], 1);
        $I->assertEquals($ent['stHonorarnih'], 1);
        $I->assertEquals($ent['zaproseno'], 1.22, "zaprošeno");
        $I->assertEquals($ent['celotnaVrednost'], 4);
        $I->assertEquals($ent['nasDelez'], 4);
        $I->assertEquals($ent['lastnaSredstva'], $ent['nasDelez'] - $ent['zaproseno'] - $ent['drugiJavni'] - $ent['vlozekGostitelja'], "lastna sredstva");
//        $I->assertEquals($ent['drugiViri'], 1.24);
        $I->assertEquals($ent['drugiJavni'], 1.24);
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

}
