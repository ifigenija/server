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
    private $objProgramDela1;
    private $objProgramDela2;
    private $rpcProgramDelaUrl = '/rpc/programdela/programdela';
    private $vrstaStroskaUrl   = '/rest/vrstastroska';
    private $objVrstaStroska;

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
        $data                  = [
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
        $this->objProgramDela1 = $ent                   = $I->successfullyCreate($this->programDelaUrl, $data);
        $I->assertGuid($ent['id']);

        // še enega
        $data                  = [
            'naziv'            => 'drugi',
            'zacetek'          => '2015-02-01T00:00:00+01:00',
            'konec'            => '2016-02-01T00:00:00+0100',
            'potrjenProgram'   => false,
            'avgZasedDvoran'   => 1,
            'avgCenaVstopnice' => 1,
            'stProdVstopnic'   => 1,
            'stZaposlenih'     => 1,
            'stZaposIgralcev'  => 1,
            'avgStNastopovIgr' => 1,
        ];
        $this->objProgramDela2 = $ent                   = $I->successfullyCreate($this->programDelaUrl, $data);
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
        $resp = $I->successfullyCallRpc($this->rpcProgramDelaUrl, 'osveziTabeloC2', ["programDelaId" => $this->objProgramDela1['id']]);
        $I->assertNotEmpty($resp);
        $I->seeResponseIsJson();
        $I->assertTrue($resp, "ali uspešno");


        // še od 2. programa dela
        $resp = $I->successfullyCallRpc($this->rpcProgramDelaUrl, 'osveziTabeloC2', ["programDelaId" => $this->objProgramDela2['id']]);
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
        $I->assertEquals($ent['programDela'], $this->objProgramDela1['id']);
    }

    /**
     * @depends getListPostavkeC2
     * @param ApiTester $I
     */
    public function getListDefault(ApiTester $I)
    {
        $resp   = $I->successfullyGetList($this->restUrl, []);
        $list   = $resp['data'];
        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertGreaterThanOrEqual(66, $totRec);
        $I->assertEquals("1", $list[0]['skupina']);

        /**
         * v obrnjenem vrstnem redu
         */
        $resp = $I->successfullyGetList($this->restUrl . "?sort_by=skupina&order=DESC", []);
        $list = $resp['data'];
        codecept_debug($list);
        $I->assertEquals("T", $list[0]['skupina']);
    }

    /**
     * @depends getListPostavkeC2
     * @param ApiTester $I
     */
    public function getListPoProgramuDela(ApiTester $I)
    {
        $resp   = $I->successfullyGetList($this->restUrl . "?programDela=" . $this->objProgramDela1['id'], []);
        $list   = $resp['data'];
        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertEquals(33, $totRec);
        $I->assertEquals("1", $list[0]['skupina']);

        // še zožimo na skupino
        $resp   = $I->successfullyGetList($this->restUrl . "?programDela=" . $this->objProgramDela1['id'] . "&skupina=2", []);
        $list   = $resp['data'];
        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertEquals(6, $totRec);
        $I->assertEquals("2", $list[0]['skupina']);

        // dodatno zožimo na  podskupino
        $resp   = $I->successfullyGetList($this->restUrl . "?programDela=" . $this->objProgramDela1['id'] . "&skupina=2&podskupina=4", []);
        $list   = $resp['data'];
        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertEquals(1, $totRec);
        $I->assertEquals("2", $list[0]['skupina']);
        $I->assertEquals(4, $list[0]['podskupina']);
    }

    /**
     * odstranim vrsto stroška in preverim, če izbriše ven iz postavkaC2 po osveži
     * 
     * @depends createProgramDela
     * @param ApiTester $I
     */
    public function odstraniVrstoStroska(ApiTester $I)
    {
        $skupina    = "2";
        $podskupina = 3;
        codecept_debug($podskupina);

        /**
         * preverimo, če je postavka v tabeli c2
         */
        $resp   = $I->successfullyGetList($this->restUrl . "?programDela=" . $this->objProgramDela1['id'] . "&skupina=" . $skupina . "&podskupina=" . $podskupina, []);
        $list   = $resp['data'];
        codecept_debug($list);
        $totRec = $resp['state']['totalRecords'];
        $I->assertEquals(1, $totRec);

        /**
         * brišemo postavko iz vrste stroškov
         */
        /**
         * - najdemo vrsto stroška s skupino in podskupino
         */
        $resp   = $I->successfullyGetList($this->vrstaStroskaUrl . "?skupina=" . $skupina, []);
        $list   = $resp['data'];
        codecept_debug($list);
        $najden = FALSE;
        codecept_debug($najden);
        while (!$najden) {
            $this->objVrstaStroska = $ent                   = array_pop($list);
            $najden                = ($ent['skupina'] == $skupina && $ent['podskupina'] == $podskupina) ? true : false;
        }
        $I->successfullyDelete($this->vrstaStroskaUrl, $this->objVrstaStroska['id']);

        /**
         * osveži tabelo C2
         */
        $resp = $I->successfullyCallRpc($this->rpcProgramDelaUrl, 'osveziTabeloC2', ["programDelaId" => $this->objProgramDela1['id']]);
        $I->assertTrue($resp, "ali uspešno");
        
        /**
         * - osveži c2
         * - preveri, če je izbrisan 
         */
        $resp   = $I->successfullyGetList($this->restUrl . "?programDela=" . $this->objProgramDela1['id'] . "&skupina=" . $skupina . "&podskupina=" . $podskupina, []);
        $list   = $resp['data'];
        $I->assertEquals(0, $resp['state']['totalRecords']);
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
