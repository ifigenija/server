<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Permission;

use ApiTester;

/**
 * Description of AvtorizacijeCest
 * 
 * Avtorizacije- test, ali velja :
 *      - rest (update,delete) je dovoljen re za ne builtin zapise
 *      - uporabnik brez ustreznega dovoljenja Aaa-* nima omogočenega dostopa
 * - usvarjanje/brisanje relacij le z ne builtin rolami
 * - možno mora biti dodajanje built in dovoljenja neki vlogi
 * 
 * @author rado
 */
class AvtorizacijeCest
{

    private $restUrl = '/rest/permission';
    private $roleUrl = '/rest/role';
    private $obj1;
    private $obj2;
    private $objRole1;
    private $objRole2;
    private $objPermission1;
    private $objPermission2;

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
    public function lookupPermission(ApiTester $I)
    {
        /**
         * poiščemo built in dovoljenja
         */
        $look                 = $I->lookupEntity("permission", "Trr-read", false);
        $this->objPermission1 = $ent                  = $I->successfullyGet($this->restUrl, $look['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['builtIn'], true);

        $look                 = $I->lookupEntity("permission", "Trr-write", false);
        $this->objPermission2 = $ent                  = $I->successfullyGet($this->restUrl, $look['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['builtIn'], true);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function lookupRole(ApiTester $I)
    {
        /**
         * poiščemo built in vloge
         */
        $look            = $I->lookupEntity("role", "tajnicaXY", false);
        $this->objRole1= $ent             = $I->successfullyGet($this->roleUrl, $look['id']);
        codecept_debug($ent);
//        $I->assertEquals($ent['builtIn'], true); // $$ zaenkrat ne vrača tega podatka
    }

    /**
     * spremenim zapis
     * ne sme uspeti za built in dovoljenja
     * 
     * @depends lookupPermission
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent  = $this->objPermission1;
        $I->assertEquals($ent['builtIn'], true); // za vsak slučaj ponovno preverimo
        $resp = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertEquals(1001400, $resp[0]['code']);
    }

    /**
     * brisanje ne sme uspeti za builtin dovoljenja
     * 
     * @depends lookupPermission
     * @param ApiTester $I
     * 
     * @param ApiTester $I
     */
    public function delete(ApiTester $I)
    {
        $resp = $I->failToDelete($this->restUrl, $this->objPermission1['id']);
        $I->assertEquals(1001401, $resp[0]['code']);
    }

    /**
     * kreiranje dovoljenja
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'description' => 'dovoljenje testni Avto',
            'name'        => 'TEST-AVTO',
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);

        /**
         * uporabnik brez dovoljenj
         * ne more kreirati dovoljenja
         */
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$breznik, \IfiTest\AuthPage::$breznikPass);
        $data = [
            'description' => 'breznikov',
            'name'        => 'TEST breznikov',
        ];
        $resp = $I->failToCreate($this->restUrl, $data);
        $I->assertEquals(1000008, $resp[0]['code']);

    }

    /**
     * ne sme pustiti kreiranje relacije z vgrajeno vlogo
     * 
     * @depends lookupRole
     * @depends create
     * 
     * @param ApiTester $I
     */
    public function ustvariRelacijoZRolo(ApiTester $I)
    {
        $resp = $I->failToUpdate($this->restUrl, $this->objPermission1['id'] . "/roles/" . $this->objRole1['id'], []);
        $I->assertEquals(1001400, $resp[0]['code']);

        $I->assertTrue(false, '$$ začasno');
    }
    
}
