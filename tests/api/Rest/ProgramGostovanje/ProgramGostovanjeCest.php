<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramGostovanje;

use ApiTester;

/**
 * Description of ProgramGostovanjeCest
 * 
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
class ProgramGostovanjeCest
{

    private $restUrl        = '/rest/programgostovanje';
    private $obj1;
    private $obj2;
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $lookUprizoritev;
    private $popaUrl        = '/rest/popa';
    private $lookPopa1;
    private $drugiVirUrl    = '/rest/drugivir';
    private $objDrugiVir1;
    private $objDrugiVir2;
    private $drzavaUrl      = '/rest/drzava';
    private $objDrzava1;
    private $objDrzava2;

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
    public function lookupPopa(ApiTester $I)
    {
        $this->lookPopa1 = $ent             = $I->lookupEntity("popa", "0988", false);
        $I->assertNotEmpty($ent);

        $this->lookPopa2 = $ent             = $I->lookupEntity("popa", "0986", false);
    }

    /**
     * najde državo
     * 
     * @param ApiTester $I
     */
    public function getListDrzava(ApiTester $I)
    {
        $resp             = $I->successfullyGetList($this->drzavaUrl, []);
        $list             = $resp['data'];
        $I->assertNotEmpty($list);
        $this->objDrzava1 = $drzava           = array_pop($list);
        $I->assertNotEmpty($drzava);
    }

    /**
     * @depends lookupUprizoritev
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'dokument'           => NULL,
            'uprizoritev'        => $this->lookUprizoritev['id'],
            'krajGostovanja'     => 'zz',
            'drzavaGostovanja'   => $this->objDrzava1['id'],
            'ustanova'           => 'zz',
            'datumGostovanja'    => '2011-02-01T00:00:00+0100',
            'ponoviInt'          => 9,
            'obiskInt'           => 9,
            'zaprosenProcent'    => 100,
//            'zaproseno'            =>9.12,
            'celotnaVrednost'    => 9.12,
            'nasDelez'           => 9.12,
            'transportniStroski' => 9.12,
            'avtorskiHonorarji'  => 9.12,
            'vlozekGostitelja'   => 9.12,
            'lastnaSredstva'     => 9.12,
//            'drugiViri'          => 9.12,
            'drugiJavni'         => 9.12,
            'gostitelj'          => $this->lookPopa1['id'],
            'sort'               => 1,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['krajGostovanja'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'dokument'           => NULL,
            'uprizoritev'        => NULL,
            'krajGostovanja'     => 'aa',
            'drzavaGostovanja'   => $this->objDrzava1['id'],
            'ustanova'           => 'aa',
            'datumGostovanja'    => '2011-02-01T00:00:00+0100',
            'ponoviInt'          => 3,
            'obiskInt'           => 3,
            'zaprosenProcent'    => 100,
//            'zaproseno'            =>3.12,
            'celotnaVrednost'    => 3.12,
            'nasDelez'           => 3.12,
            'transportniStroski' => 3.12,
            'avtorskiHonorarji'  => 3.12,
            'vlozekGostitelja'   => 3.12,
            'lastnaSredstva'     => 3.12,
//            'drugiViri'          => 3.12,
            'drugiJavni'         => 3.12,
            'gostitelj'          => null,
            'sort'               => 2,
        ];
        $this->obj2 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['krajGostovanja'], 'aa');
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent                     = $this->obj1;
        $ent['vlozekGostitelja'] = 2.34;

        $this->obj1 = $entR       = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['vlozekGostitelja'], 2.34);
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
        $I->assertEquals($ent['uprizoritev']['id'], $this->lookUprizoritev['id']);
        $I->assertEquals($ent['krajGostovanja'], 'zz');
        $I->assertEquals($ent['drzavaGostovanja'], $this->objDrzava1['id']);
        $I->assertEquals($ent['ustanova'], 'zz');
        $I->assertEquals($ent['datumGostovanja'], '2011-02-01T00:00:00+0100');
        $I->assertEquals($ent['ponoviInt'], 9);
        $I->assertEquals($ent['obiskInt'], 9);
        $I->assertEquals($ent['zaprosenProcent'], 100.00);
        $I->assertEquals($ent['zaproseno'], 9.12, "izračunano zaprošeno");
        $I->assertEquals($ent['celotnaVrednost'], 9.12);
        $I->assertEquals($ent['nasDelez'], 9.12);
        $I->assertEquals($ent['transportniStroski'], 9.12);
        $I->assertEquals($ent['avtorskiHonorarji'], 9.12);
        $I->assertEquals($ent['vlozekGostitelja'], 2.34);
        $I->assertEquals($ent['lastnaSredstva'], 9.12);
//        $I->assertEquals($ent['drugiViri'], 9.12);
        $I->assertEquals($ent['drugiJavni'], 9.12);
        $I->assertEquals($ent['dokument'], NULL);
        $I->assertEquals($ent['gostitelj']['id'], $this->lookPopa1['id']);
        $I->assertEquals($ent['sort'], 1);
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
            'znesek'        => 1.23,
            'opis'          => "zz",
            'enotaPrograma' => $this->obj2['id'],
            'mednarodni'    => FALSE,
        ];
        $this->objDrugiVir1 = $ent                = $I->successfullyCreate($this->drugiVirUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo še en zapis
        $data               = [
            'znesek'        => 1.23,
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
