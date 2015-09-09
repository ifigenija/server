<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\PostavkaCDve;

use ApiTester;

/**
 * Description of PostavkaCDveCest
 * metode, ki jo podpira API
 *  .create  (ni predvideno)
 *  .getlist
 *  .update
 *  .get - kontrola vseh polj te entitete
 *  .delete
 * validate metodo za entiteto
 * relacije z drugimi entitetami (to many relacije)
 *  .pri many to many relacijah testiraj : update, get (list+id), delete
 *  .pri one to many relacijah testiraj : get (list+id)
 * getlist različne variante odobrenih relacij
 *  .default list
 *  .po filtrih
 *  .sortiranja (po polju, ASC/DESC)
 *
 * @author rado
 */
class PostavkaCDveCest
{

    private $restUrl           = '/rest/postavkacdve';
    private $obj1;
    private $obj2;
    private $programDelaUrl    = '/rest/programdela';
    private $objProgramDela;
    private $rpcProgramDelaUrl = '/rpc/programdela/programdela';

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  kreiramo program dela
     * 
     * @param ApiTester $I
     */
    public function createProgramDela(ApiTester $I)
    {
        $data                 = [
            'naziv'            => 'zz',
            'zacetek'          => '2015-02-01T00:00:00+01:00',
            'konec'            => '2016-02-01T00:00:00+0100',
            'potrjenProgram'   => false,
            'avgZasedDvoran'   => 7.89,
            'avgCenaVstopnice' => 7.89,
            'stProdVstopnic'   => 7,
            'stZaposlenih'     => 7,
            'stZaposIgralcev'  => 7,
            'avgStNastopovIgr' => 7.89,
        ];
        $this->objProgramDela = $ent                  = $I->successfullyCreate($this->programDelaUrl, $data);
        $I->assertGuid($ent['id']);
    }

    /**
     * osvežim/kreiram tabelo C2 
     * 
     * @depends createProgramDela
     * @param ApiTester $I
     */
    public function osveziTabeloC2(ApiTester $I)
    {
        codecept_debug($this->rpcProgramDelaUrl);
        
        // pričakujemo, da bo zgeneriral/osvežil postavke C2 za dotičen program dela
        $resp = $I->successfullyCallRpc($this->rpcProgramDelaUrl, 'osveziTabeloC2', ["programDelaId" => $this->objProgramDela['id']]);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertTrue($resp, "ali uspešno");

        /**
         * kontrole
         *   - katere postavke so vse zgenerirane
         *   - vrednosti ? polj
         */
    }

    /**
     * najdemo postavko c2
     * 
     * @depends osveziTabeloC2
     * @param ApiTester $I
     */
    public function getListPostavkeC2(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl, []);
        $list = $resp['data'];
        $I->assertNotEmpty($list);

        /**
         * preberemo postavko tabele C2,, ki ni  glava 
         */
        $glava = TRUE;
        while ($glava) {
            $this->obj1 = $ent        = array_pop($list);
            $glava      = ($ent['podskupina'] === 0) ? true : false;
        }
        codecept_debug($ent);
    }

    /**
     * spremenim zapis
     * 
     * @depends getListPostavkeC2
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent                    = $I->successfullyGet($this->restUrl, $this->obj1['id']);
        $ent['vrFestivali']     = 1.22;
        $ent['vrGostovanjaInt'] = 2.33;
        $ent['vrOstalo']        = 3.44;
        $this->obj1             = $ent                    = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertGuid($ent['id']);
        $I->assertEquals($ent['vrFestivali'], 1.22);
        $I->assertEquals($ent['vrGostovanjaInt'], 2.33);
        $I->assertEquals($ent['vrOstalo'], 3.44);
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends update
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj1['id']);

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['vrFestivali'], 1.22);
        $I->assertEquals($ent['vrGostovanjaInt'], 2.33);
        $I->assertEquals($ent['vrOstalo'], 3.44);
        $I->assertEquals($ent['programDela'], $this->objProgramDela['id']);
    }

    /**
     * @depends getListPostavkeC2
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $listUrl = $this->restUrl;
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(999, $totRec);
        $I->assertEquals(999, $list[0]['skupina']);
        $I->assertEquals(999, $list[$totRec - 1]['skupina']);
    }

    /**
     * brisanje zapisa
     * 
     * @depends getListPostavkeC2
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj1['id']);
        $I->failToGet($this->restUrl, $this->obj1['id']);
    }

}
