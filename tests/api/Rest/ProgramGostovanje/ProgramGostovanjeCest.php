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
            'dokument'               => NULL,
            'uprizoritev'            => $this->lookUprizoritev['id'],
            'krajGostovanja'         => 'zz',
            'drzavaGostovanja'       => $this->objDrzava1['id'],
            'ustanova'               => 'zz',
            'datumGostovanja'        => '2011-02-01T00:00:00+0100',
            'ponoviInt'              => 9,
            'ponoviKoprInt'          => 9,
            'obiskInt'               => 9,
            'obiskKoprInt'           => 9,
            'zaproseno'              => 9.12,
//            'celotnaVrednost'    => 9.12,
            'nasDelez'               => 79.12,
            'transportniStroski'     => 9.12,
            'dnevPrvZad'             => 9.12,
            'tantieme'               => 9.12,
            'materialni'             => 9.12,
//            'avtorskePravice'        => 9.12,
            'avtorskiHonorarji'      => 9.12,
            'avtorskiHonorarjiSamoz' => 9.12,
            'vlozekGostitelja'       => 9.12,
//            'lastnaSredstva'     => 9.12,
//            'drugiViri'          => 9.12,
            'drugiJavni'             => 9.12,
            'gostitelj'              => $this->lookPopa1['id'],
            'sort'                   => 1,
            'imaKoprodukcije'        => true,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['krajGostovanja'], 'zz');

        // kreiramo še en zapis
        $data       = [
            'dokument'               => NULL,
            'uprizoritev'            => $this->lookUprizoritev['id'],
            'krajGostovanja'         => 'aa',
            'drzavaGostovanja'       => $this->objDrzava1['id'],
            'ustanova'               => 'aa',
            'datumGostovanja'        => '2011-02-01T00:00:00+0100',
            'ponoviInt'              => 3,
            'ponoviKoprInt'          => 3,
            'obiskInt'               => 3,
            'obiskKoprInt'           => 3,
            'zaproseno'              => 3.12,
//            'celotnaVrednost'    => 3.12,
            'nasDelez'               => 19,
            'transportniStroski'     => 3.12,
            'dnevPrvZad'             => 3.12,
            'tantieme'               => 3.12,
            'materialni'             => 3.12,
//            'avtorskePravice'        => 3.12,
            'avtorskiHonorarji'      => 3.12,
            'avtorskiHonorarjiSamoz' => 3.12,
            'vlozekGostitelja'       => 3.12,
//            'lastnaSredstva'     => 3.12,
//            'drugiViri'          => 3.12,
            'drugiJavni'             => 3.12,
            'gostitelj'              => $this->lookPopa1['id'],
            'sort'                   => 2,
            'imaKoprodukcije'        => FALSE,
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
        $I->assertEquals($ent['ponoviKoprInt'], 9);
        $I->assertEquals($ent['obiskInt'], 9);
        $I->assertEquals($ent['obiskKoprInt'], 9);
        $I->assertEquals($ent['zaproseno'], 9.12, "izračunano zaprošeno");
        $I->assertEquals($ent['celotnaVrednost'], 45.6);
        $I->assertEquals($ent['nasDelez'], 45.6);
        $I->assertEquals($ent['transportniStroski'], 9.12);
        $I->assertEquals($ent['dnevPrvZad'], 9.12);
        $I->assertEquals($ent['tantieme'], 9.12);
        $I->assertEquals($ent['materialni'], 9.12);
        $I->assertEquals($ent['avtorskePravice'], 0);
        $I->assertEquals($ent['avtorskiHonorarji'], 9.12);
        $I->assertEquals($ent['avtorskiHonorarjiSamoz'], 9.12);
        $I->assertEquals($ent['vlozekGostitelja'], 2.34);
        $I->assertEquals($ent['lastnaSredstva'], $ent['nasDelez'] - $ent['zaproseno'] - $ent['drugiJavni'] - $ent['vlozekGostitelja'], "lastna sredstva");
        $I->assertEquals($ent['celotnaVrednostMat'], 0);

//        $I->assertEquals($ent['drugiViri'], 9.12);
        $I->assertEquals($ent['drugiJavni'], 9.12);
        $I->assertEquals($ent['dokument'], NULL);
        $I->assertEquals($ent['gostitelj']['id'], $this->lookPopa1['id']);
        $I->assertEquals($ent['sort'], 1);
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

    /**
     * spremenim zapis za kontrolo zaokroževanja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function updateKontrolaValidacijeZaokrozevanj(ApiTester $I)
    {
        $ent                           = $this->obj2;
        $ent['avtorskiHonorarji']      = $ent['avtorskiHonorarjiSamoz'] = 1;      // v praksi bo že klient zaokrožil na 2 mesti
        $ent['tantieme']               = 1;      // v praksi bo že klient zaokrožil na 2 mesti
//        $ent['avtorskePravice']    = 2.01;      // v praksi bo že klient zaokrožil na 2 mesti
        $ent['transportniStroski']     = 2;      // v praksi bo že klient zaokrožil na 2 mesti
        $ent['dnevPrvZad']             = 3;      // v praksi bo že klient zaokrožil na 2 mesti
        $ent['zaproseno']              = 5.60;   // 60% avt hon + transp. str. +dnevnice za prvi in zadnji dan

        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        // ali sedaj napaka pri zaprošeno?
        $ent = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        $ent['zaproseno'] = 5.61;
        $resp             = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1001304, $resp[0]['code']);
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
        $data = [
            'uprizoritev'            => NULL,
            'dokument'               => NULL,
            'krajGostovanja'         => 'zz',
            'drzavaGostovanja'       => $this->objDrzava1['id'],
            'ustanova'               => 'zz',
            'datumGostovanja'        => '2011-02-01T00:00:00+0100',
            'ponoviInt'              => 9,
            'ponoviKoprInt'          => 9,
            'obiskInt'               => 9,
            'obiskKoprInt'           => 9,
            'zaproseno'              => 9.12,
//            'celotnaVrednost'    => 9.12,
            'nasDelez'               => 79.12,
            'transportniStroski'     => 9.12,
            'dnevPrvZad'             => 9.12,
            'tantieme'               => 9.12,
            'materialni'             => 9.12,
//            'avtorskePravice'        => 9.12,
            'avtorskiHonorarji'      => 9.12,
            'avtorskiHonorarjiSamoz' => 9.12,
            'vlozekGostitelja'       => 9.12,
//            'lastnaSredstva'     => 9.12,
//            'drugiViri'          => 9.12,
            'drugiJavni'             => 9.12,
            'gostitelj'              => $this->lookPopa1['id'],
            'sort'                   => 1,
            'imaKoprodukcije'        => true,
        ];
        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1001303, $resp[0]['code']);
    }

    /**
     * test validate
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createBrezGostitelja(ApiTester $I)
    {
//        $this->expect($this->getGostitelj(), "Gostitelj je obvezen podatek", 1001304);
        // brez gostitelja
        $data = [
            'gostitelj'              => NULL,
            'uprizoritev'            => $this->lookUprizoritev['id'],
            'dokument'               => NULL,
            'krajGostovanja'         => 'zz',
            'drzavaGostovanja'       => $this->objDrzava1['id'],
            'ustanova'               => 'zz',
            'datumGostovanja'        => '2011-02-01T00:00:00+0100',
            'ponoviInt'              => 9,
            'ponoviKoprInt'          => 9,
            'obiskInt'               => 9,
            'obiskKoprInt'           => 9,
            'zaproseno'              => 9.12,
//            'celotnaVrednost'    => 9.12,
            'nasDelez'               => 79.12,
            'transportniStroski'     => 9.12,
            'dnevPrvZad'             => 9.12,
            'tantieme'               => 9.12,
            'materialni'             => 9.12,
//            'avtorskePravice'        => 9.12,
            'avtorskiHonorarji'      => 9.12,
            'avtorskiHonorarjiSamoz' => 9.12,
            'vlozekGostitelja'       => 9.12,
//            'lastnaSredstva'     => 9.12,
//            'drugiViri'          => 9.12,
            'drugiJavni'             => 9.12,
            'sort'                   => 1,
            'imaKoprodukcije'        => true,
        ];
        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1001304, $resp[0]['code']);
    }

    /**
     * test validate
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function createBrezDrzaveGostovanja(ApiTester $I)
    {
//        $this->expect($this->getDrzavaGostovanja(), "Država gostovanjaje obvezen podatek", 1001305);
// brez države gostovanja
        $data = [
            'drzavaGostovanja'       => NULL,
            'gostitelj'              => $this->lookPopa1['id'],
            'uprizoritev'            => $this->lookUprizoritev['id'],
            'dokument'               => NULL,
            'krajGostovanja'         => 'zz',
            'ustanova'               => 'zz',
            'datumGostovanja'        => '2011-02-01T00:00:00+0100',
            'ponoviInt'              => 9,
            'ponoviKoprInt'          => 9,
            'obiskInt'               => 9,
            'obiskKoprInt'           => 9,
            'zaproseno'              => 9.12,
//            'celotnaVrednost'    => 9.12,
            'nasDelez'               => 79.12,
            'transportniStroski'     => 9.12,
            'dnevPrvZad'             => 9.12,
            'tantieme'               => 9.12,
            'materialni'             => 9.12,
//            'avtorskePravice'        => 9.12,
            'avtorskiHonorarji'      => 9.12,
            'avtorskiHonorarjiSamoz' => 9.12,
            'vlozekGostitelja'       => 9.12,
//            'lastnaSredstva'     => 9.12,
//            'drugiViri'          => 9.12,
            'drugiJavni'             => 9.12,
            'sort'                   => 1,
            'imaKoprodukcije'        => true,
        ];
        $resp = $I->failToCreate($this->restUrl, $data);
        codecept_debug($resp);
        $I->assertEquals(1001305, $resp[0]['code']);
    }

}
