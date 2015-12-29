<?php

namespace Rpc\Vzporednice;

use ApiTester;

/**
 * Testiranje metod VzporedniceRpcService-a
 * - dajVzporednice
 * - dajPrekrivanja
 * variante testov
 * - različni vhodni parametri:
 *  . več uprizoritevId  / prazna UprizoritevId
 *  . več alternacij /prazne alternacije
 * - ugotavljanje rezultatov:
 *      . v izhodu ne sme biti vhodnih uprizoritev
 *  . ali so vse izhodne uprizoritve : negostujoce, v ustrezni fazi
 *  . ali je error v pravi obliki / oz. prazen
 *  
 * 
 * negativni testi
 * - neveljaven id enote programa
 * - koprodukcija že obstaja
 * - itd.
 */
class VzporedniceCest
{

    private $rpcUrl = '/rpc/koledar/vzporednice';
    private $lookUprizoritev1;
    private $lookUprizoritev2;
    private $lookUprizoritev3;
    private $lookUprizoritev4;
    private $lookUprizoritev5;

    public function _before(ApiTester $I)
    {
        // da testiramo vsa posamezna dovoljenja brez shortCurcuit
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupUprizoritev(ApiTester $I)
    {
        $this->lookUprizoritev1 = $look                   = $I->lookupEntity("uprizoritev", "0002", false);
        $I->assertNotEmpty($look);
        codecept_debug($look);

        $this->lookUprizoritev2 = $look                   = $I->lookupEntity("uprizoritev", "0005", false);
        $I->assertNotEmpty($look);
        codecept_debug($look);
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

        $I->assertEmpty($resp['error'], 'errorja ni');
        $I->assertGreaterThanOrEqual(2, count($resp['data']), 'število uprizoritev');
        /**
         * preveri, če v izhodu ni nobene vhodne uprizoritve
         */
        $I->assertEquals(0, count(array_intersect(array_column($resp['data'], "id"), $uprIds)), "število vhodnih uprizoritev v izhodu");
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

        $I->assertEmpty($resp['error'], 'errorja ni');
        $I->assertGreaterThanOrEqual(3, count($resp['data']), 'število uprizoritev');
        /**
         * preveri, če v izhodu ni nobene vhodne uprizoritve
         */
        $I->assertEquals(0, count(array_intersect(array_column($resp['data'], "id"), $uprIds)), "število vhodnih uprizoritev v izhodu");
    }

}
