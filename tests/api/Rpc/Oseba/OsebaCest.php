<?php

namespace Rpc\Oseba;

use ApiTester;

/**
 * Testiranje rpc metode v OsebaRpcService
 * - delaProstDan
 *  . različni datumi
 *  . validacije
 *  . avtorizacije
 */
class OsebaCest
{

    private $rpcUrl   = '/rpc/app/oseba';
    private $objOseba1;
    private $objOseba2;
    private $osebaUrl = '/rest/oseba';

    public function _before(ApiTester $I)
    {
// da testiramo vsa posamezna dovoljenja brez shortCurcuit
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$vesna, \IfiTest\AuthPage::$vesnaPass);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupOsebo(ApiTester $I)
    {
        $ent             = $I->lookupEntity("oseba", "0001", false);
        $I->assertGuid($ent['id']);
        $this->objOseba1 = $ent             = $I->successfullyGet($this->osebaUrl, $ent['id']);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);

        $ent             = $I->lookupEntity("oseba", "0019", false);
        $I->assertGuid($ent['id']);
        $this->objOseba2 = $ent             = $I->successfullyGet($this->osebaUrl, $ent['id']);
        $I->assertGuid($ent['id']);
        codecept_debug($ent);
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function podobneOsebe(ApiTester $I)
    {
        /**
         * le en s takim priimkom, sebe ne sme najti
         */
        $resp    = $I->successfullyCallRpc($this->rpcUrl, 'podobneOsebe', ["oseba" => [
                'id'      =>  $this->objOseba2['id'],
                'ime'     => mb_strtolower($this->objOseba2['ime']),
                'priimek' => mb_strtolower($this->objOseba2['priimek']),
            ]]
        );
        codecept_debug($resp);
        $I->assertEquals(0, count($resp), "ni najden");

        /**
         * id=null 
         */
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'podobneOsebe', ["oseba" => [
                'id'      => null, // to je razlika
                'ime'     => mb_strtolower($this->objOseba2['ime']),
                'priimek' => mb_strtolower($this->objOseba2['priimek']),
            ]]
        );
        codecept_debug($resp);
        $I->assertGreaterThanOrEqual(1, count($resp), "število najdenih oseb");

        /**
         * po stringih
         */
        $resp = $I->successfullyCallRpc($this->rpcUrl, 'podobneOsebe', ["oseba" => [
                'id'      => null, // to je razlika
                'ime'     => 'Anabel',
                'priimek' => 'novAK',   // lower/upper case ni pomemben
            ]]
        );
        codecept_debug($resp);
        $I->assertGreaterThanOrEqual(2, count($resp), "število najdenih oseb");
    }

    /**
     * 
     * @param ApiTester $I 
     */
    public function podobneOsebeBrezPriimkaAliDrugihObveznihPolj(ApiTester $I)
    {
        // brez priimka
        $resp = $I->failCallRpc($this->rpcUrl, 'podobneOsebe', ["oseba" => [
                'id'  => null,
                'ime' => 'Franci',
            ]]
        );
        codecept_debug($resp);
        $I->assertEquals(1001121, $resp['code']);

        // brez imena
        $resp = $I->failCallRpc($this->rpcUrl, 'podobneOsebe', ["oseba" => [
                'id'      => null,
                'priimek' => 'Bezjak',
            ]]
        );
        codecept_debug($resp);
        $I->assertEquals(1001122, $resp['code']);

        // brez id
        $resp = $I->failCallRpc($this->rpcUrl, 'podobneOsebe', ["oseba" => [
                'priimek' => 'Bezjak',
                'ime'     => 'Franci',
            ]]
        );
        codecept_debug($resp);
        $I->assertEquals(1001123, $resp['code']);
    }

}
