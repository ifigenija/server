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
 *      - različni vhodni parametri:
 *       . več uprizoritevId  / prazna UprizoritevId
 *       . več alternacij /prazne alternacije
 *      - ugotavljanje rezultatov:
 *       . v izhodu ne sme biti vhodnih uprizoritev
 *       . ali so vse izhodne uprizoritve : negostujoce, v ustrezni fazi
 *       . ali je error v pravi obliki / oz. prazen
 *       . kombinacije vzporednice / prekrivanje:
 *          .. presek uprizoritev V in P prazen
 *          .. (unije upr. V in P ) enaka vsem dopustnim upr.
 *       . ali je določena oseba v zasedenih /prostih alternacijah
 *       . ali je določena upriz. v rezultatu
 * negativni testi
 * - neveljaven id enote programa
 * - koprodukcija že obstaja
 * - itd.
 */
class VzporedniceCest
{

    private $rpcUrl         = '/rpc/koledar/vzporednice';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $alternacijaUrl = '/rest/alternacija';
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
    private $lookAlternacijaFOO1;
    private $lookAlternacijaFOO2;
    private $lookAlternacijaFOO3;

    public function _before(ApiTester $I)
    {
// da testiramo vsa posamezna dovoljenja brez shortCurcuit
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vesna, \IfiTest\AuthPage::$vesnaPass);
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
        $I->assertTrue($uprIzhodneIds == $subset, 'subset');
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
        codecept_debug($this->uprizoritveVseNegostPlanIds);
        codecept_debug($unijaUprIdsVhoVzpPre);
        $I->assertTrue($this->uprizoritveVseNegostPlanIds == $unijaUprIdsVhoVzpPre
                , "unija  vhodnih upriz. in izhodnih vzporednic in prekrivanj enaka vsem dopustnim");
    }

    /**
     * Iz Rpc response-a  izlušči iz konfliktnih funkcij zasedene oz. proste osebe
     * 
     * @param ApiTester $I
     * @param type $resp
     * @param boolean $zasedene     
     * @return array
     */
    private function osebeIds(ApiTester $I, $resp, $zasedene = true)
    {
        codecept_debug(__FUNCTION__);

        $kf = array_column($resp['data'], "konfliktneFunkcije");

        $zasOsA = $I->subarrayValuesToArray($kf);

        if ($zasedene) {
            $colName = "zasedeneOsebe";
        } else {
            $colName = "nezasedeneOsebe";
        }
        $zasOsA      = array_column($zasOsA, $colName);
        $zasOsebe    = $I->subarrayValuesToArray($zasOsA);
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

        $this->lookUprizoritev4 = $look                   = $I->lookupEntity("uprizoritev", "0014", false);
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
     * 
     * @param ApiTester $I
     */
    public function lookupAlternacijFoo(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->alternacijaUrl . "/planirane?uprizoritev=" . $this->lookUprizoritev1['id']
                . "&datum=2016-01-01"   // datum izbran tako, da so aktivne alternacije vseh oseb (A,B, ...N3)
                , []);
        $list = $resp['data'];
        codecept_debug($list);
        $foos = [];
        $foo  = [];
        foreach ($list as $a) {
            if (!array_key_exists($a['funkcija']['id'], $foo)) {
                $foo[$a['funkcija']['id']] = [];
            }
            $foo[$a['funkcija']['id']] [] = $a['oseba']['id'];
            $foos[]                       = $foo;
            $foo                          = [];
        }
        codecept_debug($foos);

        /**
         * so vse alternacije od uprizoritve v obliki, ki je primerna za input 
         * alternacij vzporednic
         */
        $this->lookAlternacijaFOO1 = $foos;

        /**
         * še vse aktivne alternacije od druge uprizoritve
         */
        $resp = $I->successfullyGetList($this->alternacijaUrl . "/planirane?uprizoritev=" . $this->lookUprizoritev4['id']
                . "&datum=2016-01-01"   // datum izbran tako, da so aktivne alternacije vseh oseb (A,B, ...N3)
                , []);
        $list = $resp['data'];
        codecept_debug($list);
        $foos = [];
        $foo  = [];
        foreach ($list as $a) {
            if (!array_key_exists($a['funkcija']['id'], $foo)) {
                $foo[$a['funkcija']['id']] = [];
            }
            $foo[$a['funkcija']['id']] [] = $a['oseba']['id'];
            $foos[]                       = $foo;
            $foo                          = [];
        }
        codecept_debug($foos);
        /**
         * so vse alternacije od uprizoritve v obliki, ki je primerna za input 
         * alternacij vzporednic
         */
        $this->lookAlternacijaFOO2 = $foos;

        /**
         * še vse alternacije od tretje uprizoritve
         */
        $resp = $I->successfullyGetList($this->alternacijaUrl . "/planirane?uprizoritev=" . $this->lookUprizoritev3['id']
                . "&datum=2016-01-01"   // datum izbran tako, da so aktivne alternacije vseh oseb (A,B, ...N3)
                , []);
        $list = $resp['data'];
        codecept_debug($list);
        $foos = [];
        $foo  = [];
        foreach ($list as $a) {
            if (!array_key_exists($a['funkcija']['id'], $foo)) {
                $foo[$a['funkcija']['id']] = [];
            }
            $foo[$a['funkcija']['id']] [] = $a['oseba']['id'];
            $foos[]                       = $foo;
            $foo                          = [];
        }
        codecept_debug($foos);

        /**
         * so vse aktivne alternacije od uprizoritve v obliki, ki je primerna za input 
         * alternacij vzporednic
         */
        $this->lookAlternacijaFOO3 = $foos;
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
        $uprIds = [$this->lookUprizoritev1['id']
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
        $uprIds = [$this->lookUprizoritev1['id']
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
    public function dajVzporedniceInPrekrivanjaOd0002(ApiTester $I)
    {
        /**
         * vhodni parametri
         */
        $uprIdsVho = [$this->lookUprizoritev1['id']];
        $alts      = [];

        /**
         * daj vzporednice
         */
        $respV         = $I->successfullyCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respV);
        $this->kontroleRezultatov($I, $uprIdsVho, $alts, $respV);
        $I->assertEmpty($respV['error'], 'errorja ni');
        /**
         * preverimo če so nekatere osebe v konfliktnih funkcijah zasedene oz. proste
         */
        $zasOsebeIds   = $this->osebeIds($I, $respV, true);
        codecept_debug($zasOsebeIds);
        $nezasOsebeIds = $this->osebeIds($I, $respV, false);
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
        $respP         = $I->successfullyCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respP);
        $this->kontroleRezultatov($I, $uprIdsVho, $alts, $respP);
        $I->assertEmpty($respP['error'], 'errorja ni');
        /**
         * preverimo če so nekatere osebe v konfliktnih funkcijah zasedene oz. proste
         */
        $zasOsebeIds   = $this->osebeIds($I, $respP, true);
        codecept_debug($zasOsebeIds);
        $nezasOsebeIds = $this->osebeIds($I, $respP, false);
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
         * ali je uprizoritev s  funkcijami, ki imajo in tudi nimajo prostih oseb
         * med rezultati?
         */
        $uprIzhodneIds = array_column($respP['data'], "id");
        $I->assertContains($this->lookUprizoritev3['id'], $uprIzhodneIds);


        /**
         * kontrola kombinacij
         */
        $this->kontroleObehRezultatov($I, $uprIdsVho, $respV, $respP);
    }

    /**
     * vzporednice in prekrivanja 
     *  z vhodom alternacije dveh uprizoritev
     * 
     * @param ApiTester $I
     */
    public function dajVzporPrekrOdAlternacij(ApiTester $I)
    {
        /**
         * vhodni parametri
         */
        $uprIdsVho = [];
        $alts      = array_merge($this->lookAlternacijaFOO1, $this->lookAlternacijaFOO2, $this->lookAlternacijaFOO3);
        codecept_debug($alts);

        /**
         * daj vzporednice
         */
        $respV      = $I->successfullyCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
//        codecept_debug($respV);
        $this->kontroleRezultatov($I, $uprIdsVho, $alts, $respV);
        /*
         * konfliktne alternacije - oseba je zasedena v dveh ali večih uprizoritvah
         */
        $I->assertNotEmpty($respV['error'], 'error');
        codecept_debug($respV['error']);
        $tmpErrKeys = $I->subarraysKeys($respV['error']);
        codecept_debug($tmpErrKeys);
        $I->assertContains($this->lookOsebaB['label'], $I->subarraysKeys($respV['error']));

        /**
         * daj prekrivanja
         */
        $respP = $I->successfullyCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respP);
        $this->kontroleRezultatov($I, $uprIdsVho, $alts, $respP);
        /*
         * konfliktne alternacije - oseba je zasedena v dveh ali večih uprizoritvah
         */
        $I->assertNotEmpty($respP['error'], 'error');
        codecept_debug($respP['error']);

        $I->assertContains($this->lookOsebaB['label'], $I->subarraysKeys($respV['error']));

        $I->assertContains($this->lookOsebaD['label'], $I->subarraysKeys($respV['error']));

        /**
         * kontrola kombinacij
         */
        $this->kontroleObehRezultatov($I, $uprIdsVho, $respV, $respP);
    }

    /**
     * vzporednice in prekrivanja 
     *  z neveljavnim vhodom
     * 
     * @param ApiTester $I
     */
    public function dajVzporPrekrNeveljavniVhodUprizoritev(ApiTester $I)
    {
        /**
         * vhodni parametri
         */
        $uprIdsVho = ["neveljavni", "podatki"];      //neveljavno
        $alts      = [];

        /**
         * daj vzporednice
         */
        $respV = $I->failCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respV);
        $I->assertEquals(1001670, $respV['code']);


        /**
         * daj prekrivanja
         */
        $respP = $I->failCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respP);
        $I->assertEquals(1001670, $respP['code']);



        /**
         * vhodni parametri - spremenjeni
         */
        $uprIdsVho = [$this->lookOsebaA['id']];      //neveljavno - vendar upošteva, kot da je prazno
        $alts      = [];

        /**
         * daj vzporednice
         */
        $respV = $I->successfullyCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respV);
        $this->kontroleRezultatov($I, $uprIdsVho, $alts, $respV);


        /**
         * daj prekrivanja
         */
        $respP = $I->successfullyCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respP);
        $this->kontroleRezultatov($I, $uprIdsVho, $alts, $respP);

        /**
         * kontrola kombinacij
         */
//        $this->kontroleObehRezultatov($I, $uprIdsVho, $respV, $respP);  // to ne uspe, ker vhodna uprizoritev ni uprizoritev
    }

    /**
     * vzporednice in prekrivanja 
     *  z neveljavnim vhodom
     * 
     * @param ApiTester $I
     */
    public function dajVzporPrekrNeveljavniVhodAlternacij(ApiTester $I)
    {
        /**
         * vhodni parametri
         */
        $uprIdsVho = [];
        $alts      = ["neveljavni", "podatki"];      //neveljavno
        /**
         * daj vzporednice
         */
        $respV     = $I->failCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respV);
        $I->assertEquals(1001676, $respV['code']);
        /**
         * daj prekrivanja
         */
        $respP     = $I->failCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respP);
        $I->assertEquals(1001676, $respP['code']);

        /**
         * spremenjeni vhodni parametri
         */
        $uprIdsVho = [];
        $alts      = ["neveljavni" => [], "podatki" => []];      //neveljavno
        codecept_debug($alts);

        /**
         * daj vzporednice
         */
        $respV = $I->failCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respV);
        $I->assertEquals(1001676, $respV['code']);
        /**
         * daj prekrivanja
         */
        $respP = $I->failCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respP);
        $I->assertEquals(1001676, $respP['code']);

        /**
         * spremenjeni vhodni parametri
         */
        $uprIdsVho = [];
        $alts      = [["neveljavni" => []], ["podatki" => []]];      //neveljavno
        codecept_debug($alts);
        /**
         * daj vzporednice
         */
        $respV     = $I->failCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respV);
        $I->assertEquals(1001674, $respV['code']);
        /**
         * daj prekrivanja
         */
        $respP     = $I->failCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respP);
        $I->assertEquals(1001674, $respP['code']);

        /**
         * spremenjeni vhodni parametri
         */
        $uprIdsVho = [];
        $alts      = [[$this->lookOsebaB['id'] => ["neveljavno"]]];      //neveljavno
        codecept_debug($alts);
        /**
         * daj vzporednice
         */
        $respV     = $I->failCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respV);
        $I->assertEquals(1001675, $respV['code']);
        /**
         * daj prekrivanja
         */
        $respP     = $I->failCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);
        codecept_debug($respP);
        $I->assertEquals(1001675, $respP['code']);
    }

    /**
     * dnimanične vzporednice (prisoten začetek in konec)
     * 
     * @param ApiTester $I
     */
    public function dajDinamicneVzporPrekr(ApiTester $I)
    {
        /**
         * vhodni parametri
         */
        $uprIdsVho     = [$this->lookUprizoritev1['id']];
        $alts          = [];
        $zacetek       = "2015-03-15T23:10:00+0100";
        $konec         = "2015-06-26T09:11:00+0200";    // osebaN je zasedena v tem času
        /**
         * daj vzporednice
         */
        $respV         = $I->successfullyCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respV);
        $this->kontroleRezultatov($I, $uprIdsVho, $alts, $respV);
        $I->assertEmpty($respV['error'], 'errorja ni');
        /**
         * preverimo če so nekatere osebe v konfliktnih funkcijah zasedene oz. proste
         */
        $zasOsebeIds   = $this->osebeIds($I, $respV, true);
        codecept_debug($zasOsebeIds);
        $nezasOsebeIds = $this->osebeIds($I, $respV, false);
        codecept_debug($nezasOsebeIds);
        $I->assertContains($this->lookOsebaN['id'], $zasOsebeIds);
        $I->assertNotContains($this->lookOsebaN['id'], $nezasOsebeIds);



        /**
         * daj prekrivanja
         */
        /**
         * daj prekrivanja
         */
        $respP         = $I->successfullyCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respP);
        $this->kontroleRezultatov($I, $uprIdsVho, $alts, $respP);
        codecept_debug($respP['error']);
        $zasOsebeIds   = $this->osebeIds($I, $respV, true);
        codecept_debug($zasOsebeIds);
        $nezasOsebeIds = $this->osebeIds($I, $respV, false);
        codecept_debug($nezasOsebeIds);
        $I->assertContains($this->lookOsebaN['id'], $zasOsebeIds);
        $I->assertNotContains($this->lookOsebaN['id'], $nezasOsebeIds);

        /**
         * kontrola kombinacij
         */
        $this->kontroleObehRezultatov($I, $uprIdsVho, $respV, $respP);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function dajVzporPrekrNeveljavniVhodInterval(ApiTester $I)
    {
        /**
         * vhodni parametri
         */
        $uprIdsVho = [];
        $alts      = [];

        /**
         * parametra za interval sta zaenkrat ok
         */
        $zacetek = "2016-04-20T10:00:00+0200";
        $konec   = "2016-04-20T14:00:00+0200";
        /**
         * daj vzporednice
         */
        $respV   = $I->successfullyCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        /**
         * daj prekrivanja
         */
        $respP   = $I->successfullyCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije" => $alts]);


        /**
         * spremenjeni vhodni parametri
         * prvi prazen, drugi poln
         */
        $zacetek = "";
        $konec   = "2016-04-20T14:00:00+0200";
        /**
         * daj vzporednice
         */
        $respV   = $I->failCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respV);
        $I->assertEquals(1001673, $respV['code']);
        /**
         * daj prekrivanja
         */
        $respP   = $I->failCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respP);
        $I->assertEquals(1001673, $respP['code']);


        /**
         * spremenjeni vhodni parametri
         * prvi poln, drugi prazen
         */
        $zacetek = "2016-04-20T14:00:00+0200";
        $konec   = "";
        /**
         * daj vzporednice
         */
        $respV   = $I->failCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respV);
        $I->assertEquals(1001673, $respV['code']);
        /**
         * daj prekrivanja
         */
        $respP   = $I->failCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respP);
        $I->assertEquals(1001673, $respP['code']);

        /**
         * spremenjeni vhodni parametri
         * prvi neveljavni datum
         */
        $zacetek = "2016-04-20T10:00:00+NEVELJAVNI0200";    // neveljavni
        $konec   = "2016-04-20T14:00:00+0200";
        /**
         * daj vzporednice
         */
        $respV   = $I->failCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respV);
        $I->assertEquals(1001671, $respV['code']);
        /**
         * daj prekrivanja
         */
        $respP   = $I->failCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respP);
        $I->assertEquals(1001671, $respP['code']);

        /**
         * spremenjeni vhodni parametri
         * drugi neveljavni datum
         */
        $zacetek = "2016-04-20T14:00:00+0200";
        $konec   = "2016-04-20T10:00:00+NEVELJAVNI0200";    // neveljavni
        /**
         * daj vzporednice
         */
        $respV   = $I->failCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respV);
        $I->assertEquals(1001672, $respV['code']);
        /**
         * daj prekrivanja
         */
        $respP   = $I->failCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respP);
        $I->assertEquals(1001672, $respP['code']);


        /**
         * spremenjeni vhodni parametri
         * konec pred začetkom
         */
        $zacetek = "2016-04-20T14:00:00+0200";
        $konec   = "2016-04-20T10:00:00+0200";  //< od zacetek
        /**
         * daj vzporednice
         */
        $respV   = $I->failCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respV);
        $I->assertEquals(1001677, $respV['code']);
        /**
         * daj prekrivanja
         */
        $respP   = $I->failCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respP);
        $I->assertEquals(1001677, $respP['code']);


        /**
         * spremenjeni vhodni parametri
         * konec pred začetkom  - datuma sta v različnih time zone-ah
         */
        $zacetek = "2016-04-20T10:00:00+0200";
        $konec   = "2016-04-20T14:00:00+1000";  //< od zacetek -različna cona
        /**
         * daj vzporednice
         */
        $respV   = $I->failCallRpc($this->rpcUrl, 'dajVzporednice', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respV);
        $I->assertEquals(1001677, $respV['code']);
        /**
         * daj prekrivanja
         */
        $respP   = $I->failCallRpc($this->rpcUrl, 'dajPrekrivanja', ["uprizoritveIds" => $uprIdsVho, "alternacije"    => $alts
            , "zacetek"        => $zacetek, "konec"          => $konec]);
        codecept_debug($respP);
        $I->assertEquals(1001677, $respP['code']);
    }

}
