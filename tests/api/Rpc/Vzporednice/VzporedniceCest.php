<?php

namespace Rpc\Vzporednice;

use ApiTester;

/**
 * Plan testov:
 * 
 *      Testiranje metod VzporedniceRpcService-a
 *      - dajVzporednice
 *      - dajPrekrivanja
 * variante testov
 * - različni vhodni parametri:
 *  . več uprizoritevId  / prazna UprizoritevId
 *  . več alternacij /prazne alternacije
 * - ugotavljanje rezultatov:
 *      . v izhodu ne sme biti vhodnih uprizoritev
 *      . ali so vse izhodne uprizoritve : negostujoce, v ustrezni fazi
 *  . ali je error v pravi obliki / oz. prazen
 *      . kombinacije vzporednice / prekrivanje:
 *          .. presek uprizoritev V in P prazen
 *          .. (unije upr. V in P ) enaka vsem dopustnim upr.
 *  . ali je določena oseba v zasedenih /prostih alternacijah
 *  . ali je določena upriz. v rezultatu
 * negativni testi
 * - neveljaven id enote programa
 * - koprodukcija že obstaja
 * - itd.
 */
class VzporedniceCest
{

    private $rpcUrl         = '/rpc/koledar/vzporednice';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $uprizoritveVseNegostPlanIds;
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;
    private $lookUprizoritev4;
    private $lookUprizoritev5;
    private $lookOsebaA;
    private $lookOsebaB;
    private $lookOsebaD;
    private $lookOsebaE;
    private $lookOsebaN;
    private $lookOsebaN2;
    private $lookOsebaN3;

    public function _before(ApiTester $I)
    {
        // da testiramo vsa posamezna dovoljenja brez shortCurcuit
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    /**
     * metoda, ki se večkrat kliče zaradi preverjanja rezultatov rpc klica vzporednic
     * 
     * @param ApiTester $I
     * @param type $uprIds
     * @param type $alts
     * @param type $resp
     */
    private function kontroleRezultatov(ApiTester $I, $uprIds, $alts, $resp)
    {
        codecept_debug(__FUNCTION__);

        $uprIzhodneIds = array_column($resp['data'], "id");
        /*
         * preveri, če v izhodu ni nobene vhodne uprizoritve
         */
        $I->assertEquals(0, count(array_intersect($uprIzhodneIds, $uprIds)), "število vhodnih uprizoritev v izhodu");

        /*
         * ali vse izhodne uprizoritve podmnožica dopustnih
         */
        $subset = array_values(array_intersect($this->uprizoritveVseNegostPlanIds, $uprIzhodneIds));
        sort($subset);
        sort($uprIzhodneIds);
        $I->assertTrue($uprIzhodneIds == $subset);
    }

    /**
     * kontrole rezultatov po klicu obeh metod vzporednice in prekrivanje z istimi parametri
     * 
     * @param ApiTester $I
     * @param type $uprIdsVho
     * @param type $respV
     * @param type $respP
     */
    private function kontroleObehRezultatov(ApiTester $I, $uprIdsVho, $respV, $respP)
    {
        codecept_debug(__FUNCTION__);

        $uprIdsVzp = array_column($respV['data'], "id");
        $uprIdsPre = array_column($respP['data'], "id");
        $I->assertEquals(0, count(array_intersect($uprIdsVzp, $uprIdsPre)), "presek uprizoritev vzporednic in prekrivanj");

        $unijaUprIdsVhoVzpPre = array_keys(array_flip($uprIdsVho) + array_flip($uprIdsVzp) + array_flip($uprIdsPre));
        sort($unijaUprIdsVhoVzpPre);
//        codecept_debug($this->uprizoritveVseNegostPlanIds);
//        codecept_debug($unijaUprIdsVhoVzpPre);
        $I->assertTrue($this->uprizoritveVseNegostPlanIds == $unijaUprIdsVhoVzpPre
                , "unija  vhodnih upriz. in izhodnih vzporednic in prekrivanj enaka vsem dopustnim");
    }

    /**
     * 
     * @param type $resp
     * @param type $zasedene
     * @return type
     */
    private function osebeIds($resp, $zasedene = true)
    {
        codecept_debug(__FUNCTION__);

        $kf = array_column($resp['data'], "konfliktneFunkcije");

        $zasOsA = [];
        foreach ($kf as $ai) {
            foreach ($ai as $v) {
                array_push($zasOsA, $v);
            }
        }
        if ($zasedene) {
            $colName = "zasedeneOsebe";
        } else {
            $colName = "nezasedeneOsebe";
        }
        $zasOsA   = array_column($zasOsA, $colName);
        $zasOsebe = [];
        foreach ($zasOsA as $ai) {
            foreach ($ai as $v) {
                array_push($zasOsebe, $v);
            }
        }
        $zasOsebeIds = array_column($zasOsebe, "id");
        return $zasOsebeIds;
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);

        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0005", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);

        $this->lookUprizoritev3 = $look                   = $I->lookupEntity("uprizoritev", "0019", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebe(ApiTester $I)
    {
        $this->lookOsebaA = $look             = $I->lookupEntity("oseba", "0004", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);

        $this->lookOsebaB = $look             = $I->lookupEntity("oseba", "0008", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);

        $this->lookOsebaD = $look             = $I->lookupEntity("oseba", "0013", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);

        $this->lookOsebaE = $look             = $I->lookupEntity("oseba", "0003", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);

        $this->lookOsebaN = $look             = $I->lookupEntity("oseba", "0018", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);

        $this->lookOsebaN2 = $look              = $I->lookupEntity("oseba", "0014", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);

        $this->lookOsebaN3 = $look              = $I->lookupEntity("oseba", "0016", false);
        codecept_debug($look);
        $I->assertGuid($look['id']);
    }

    /**
     * Najdi vse uprizoritve, ki se lahko planirajo:
     *  - negostujoče
     *  - z ustreznim statusom
     * 
     * @param ApiTester $I
     */
    public function najdiVseSprejemljiveUprizoritve(ApiTester $I)
    {
        $resp      = $I->successfullyGetList($this->uprizoritevUrl . "/vse?status[]=produkcija&status[]=postprodukcija", []);
        $list      = $resp['data'];
        /**
         * ali so le negostujoče
         */
        $gostujoce = array_unique(array_column($list, "gostujoca"));
        codecept_debug($gostujoce);
        $I->assertNotContains(true, $gostujoce);
        /*
         * ali so le v dveh statusih
         */
        $faze      = array_unique(array_column($list, "faza"));
        codecept_debug($faze);
        $I->assertEquals(2, count($faze));
        $I->assertNotContains('predprodukcija-potrjen_program', $faze);
        $I->assertContains('produkcija', $faze);
        $I->assertContains('postprodukcija', $faze);
        codecept_debug($list);

        $this->uprizoritveVseNegostPlanIds = array_column($list, "id");
        sort($this->uprizoritveVseNegostPlanIds);
        codecept_debug($this->uprizoritveVseNegostPlanIds);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function dajVzporednice(ApiTester $I)
    {
        $uprIds = [ $this->lookUprizoritev1['id']
            , $this->lookUprizoritev2['id']];
        $alts   = [];
        $resp   = $I->successfullyCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIds, "alternacije" => $alts]);
        codecept_debug($resp);
        $this->kontroleRezultatov($I, $uprIds, $alts, $resp);

        $I->assertEmpty($resp['error'], 'errorja ni');
        $I->assertGreaterThanOrEqual(2, count($resp['data']), 'število uprizoritev');
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function dajPrekrivanja(ApiTester $I)
    {
        $uprIds = [ $this->lookUprizoritev1['id']
            , $this->lookUprizoritev2['id']];
        $alts   = [];
        $resp   = $I->successfullyCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIds, "alternacije" => $alts]);
        codecept_debug($resp);
        $this->kontroleRezultatov($I, $uprIds, $alts, $resp);

        $I->assertEmpty($resp['error'], 'errorja ni');
        $I->assertGreaterThanOrEqual(3, count($resp['data']), 'število uprizoritev');
    }

    /**
     * daj vzporednice in prekrivanja z istimi vhodnimi parametri
     * 
     * 
     * @param ApiTester $I
     */
    public function dajVzpPre(ApiTester $I)
    {
        /**
         * vhodni parametri
         */
        $uprIdsVho = [ $this->lookUprizoritev1['id']];
        $alts      = [];

        /**
         * daj vzporednice
         */
        $respV = $I->successfullyCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respV);
        $this->kontroleRezultatov($I, $uprIdsVho, $alts, $respV);
        $I->assertEmpty($respV['error'], 'errorja ni');
        /**
         * preverimo če so nekatere osebe v konfliktnih funkcijah zasedene oz. proste
         */
        $zasOsebeIds   = $this->osebeIds($respV, true);
        codecept_debug($zasOsebeIds);
        $nezasOsebeIds = $this->osebeIds($respV, false);
        codecept_debug($nezasOsebeIds);
        $I->assertContains($this->lookOsebaD['id'], $zasOsebeIds);
        $I->assertNotContains($this->lookOsebaD['id'], $nezasOsebeIds);
        $I->assertContains($this->lookOsebaE['id'], $zasOsebeIds);
        $I->assertNotContains($this->lookOsebaE['id'], $nezasOsebeIds);
        $I->assertNotContains($this->lookOsebaN['id'], $zasOsebeIds);
        $I->assertContains($this->lookOsebaN['id'], $nezasOsebeIds);
        $I->assertNotContains($this->lookOsebaN2['id'], $zasOsebeIds);
        $I->assertContains($this->lookOsebaN2['id'], $nezasOsebeIds);
        $I->assertNotContains($this->lookOsebaN3['id'], $zasOsebeIds);
        $I->assertContains($this->lookOsebaN3['id'], $nezasOsebeIds);

        /**
         * daj prekrivanja
         */
        $respP = $I->successfullyCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respP);
        $this->kontroleRezultatov($I, $uprIdsVho, $alts, $respP);
        $I->assertEmpty($respP['error'], 'errorja ni');
        /**
         * preverimo če so nekatere osebe v konfliktnih funkcijah zasedene oz. proste
         */
        $zasOsebeIds   = $this->osebeIds($respP, true);
        codecept_debug($zasOsebeIds);
        $nezasOsebeIds = $this->osebeIds($respP, false);
        codecept_debug($nezasOsebeIds);
        $I->assertContains($this->lookOsebaD['id'], $zasOsebeIds);
        $I->assertNotContains($this->lookOsebaD['id'], $nezasOsebeIds);
        $I->assertContains($this->lookOsebaE['id'], $zasOsebeIds);
        $I->assertNotContains($this->lookOsebaE['id'], $nezasOsebeIds);
        $I->assertNotContains($this->lookOsebaN['id'], $zasOsebeIds);
        $I->assertContains($this->lookOsebaN['id'], $nezasOsebeIds);
        $I->assertNotContains($this->lookOsebaN2['id'], $zasOsebeIds);
        $I->assertNotContains($this->lookOsebaN2['id'], $nezasOsebeIds);
        $I->assertNotContains($this->lookOsebaN3['id'], $zasOsebeIds);
        $I->assertNotContains($this->lookOsebaN3['id'], $nezasOsebeIds);
        
        

        /**
         * kontrola kombinacij
         */
        $this->kontroleObehRezultatov($I, $uprIdsVho, $respV, $respP);
    }

}
