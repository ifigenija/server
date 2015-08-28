<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\TerminStoritve;

use ApiTester;

/**
 * Description of ZaDebugCest
 * 
 * začasno zaradi debugiranja
 * 
 * 
 * @author rado
 */
class ZaDebugCest
{

    private $restUrl              = '/rest/terminstoritve';
    private $alternacijaUrl       = '/rest/alternacija';
    private $lookupAlternacijaUrl = '/lookup/alternacija';
    private $obj1;
    private $obj2Teh;
    private $lookAlternacija1;
    private $lookAlternacija2Teh;
    private $roleUrl              = '/rest/role';
    private $rpcRoleUrl           = '/rpc/aaa/role';
    private $rpcUserUrl           = '/rpc/aaa/user';

    public function _before(ApiTester $I)
    {
        
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function getListTerminovStoritev(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $resp       = $I->successfullyGetList($this->restUrl, []);
        $list       = $resp['data'];
        // poiščemo termina storitve - najprej za ne-tehnika:
        $key        = array_search($this->lookAlternacija1['id'], array_column($list, 'alternacija'));
        $this->obj1 = $ent        = $list[$key];
    }

    /**
     * @param ApiTester $I
     */
    public function updateZAdmin(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $ent                   = $this->obj1;
        codecept_debug($ent);
        $ent['planiranoTraja'] = 3;
        $resp                  = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
    }

    /**
     * @param ApiTester $I
     */
    public function updateZIfiAll(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$ali, \IfiTest\AuthPage::$aliPass);

        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 3;
        $resp                  = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
    }

}
