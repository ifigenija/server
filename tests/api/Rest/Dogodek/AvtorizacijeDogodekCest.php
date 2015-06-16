<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Dogodek;

use ApiTester;

/**
 * Description of AvtorizacijeDogodekCest
 * 
 * dostop do terminov storitve. Naslanjamo se na testne fixturje
 * Za narediti:
 * - zavrnitve dostopa
 *   . navaden user za dogodek s statusom, ko dogodek še ni odobren
 * - omogočanje dostopa
 *   . planerju oz. direktorju za vse
 *   . navadnemu userju za dogodek s statusom, ko je že odobren
 * 
 * @author rado
 */
class AvtorizacijeDogodekCest
{

    private $restUrl    = '/rest/dogodek';
    private $obj1;
    private $obj2odobren;
    private $lookAlternacija1;
    private $lookAlternacija2Teh;
    private $roleUrl    = '/rest/role';
    private $rpcRoleUrl = '/rpc/aaa/role';
    private $rpcUserUrl = '/rpc/aaa/user';

    public function _before(ApiTester $I)
    {
        
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * @param ApiTester $I
     */
    public function createVloge(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $data = [
            'name'        => 'TEST-PLANER',
            'description' => 'Testna vloga za vpogled vseh dogodkov, tudi še neodobrenih',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('TEST-PLANER', $role['name']);
        $I->assertNotEmpty($role['id']);

        // 2. vloga
        $data = [
            'name'        => 'TEST-NAVADEN',
            'description' => 'Testna vloga za navadnega uporabnika z read dostopom do Dogodkov',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('TEST-NAVADEN', $role['name']);
        $I->assertNotEmpty($role['id']);
    }

    /**
     * Doda dovoljenja vlogam
     * 
     * @depends createVloge
     * @param ApiTester $I
     */
    public function grantPermissioneVlogam(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        //1. vlogi read in read vse
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST-PLANER",
            'permname' => 'Dogodek-readVse',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST-PLANER",
            'permname' => 'Dogodek-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);


        // 2. vloga, dodamo le -read
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TEST-NAVADEN",
            'permname' => 'Dogodek-read',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * @depends grantPermissioneVlogam
     * @param ApiTester $I
     */
    public function grantRoleUporabnikom(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$petra,
            'rolename' => 'TEST-PLANER',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$irena,
            'rolename' => 'TEST-NAVADEN',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        //še ifi-readall
        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$berta,
            'rolename' => 'ifi-readall',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);
    }

    /**
     * 
     * @param ApiTester $I
     */
    public function getListDogodkov(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $resp = $I->successfullyGetList($this->restUrl . "/vse", []);
        $list = $resp['data'];
        $I->assertNotEmpty($list);

        // poiščemo še neodobren dogodek
        $key        = array_search(2, array_column($list, 'status'));
        $this->obj1 = $ent        = $list[$key];

        // poiščemo odobren dogodek
        $key               = array_search(7, array_column($list, 'status'));
        $this->obj2odobren = $ent               = $list[$key];
    }

    /**
     * @param ApiTester $I
     */
    public function getZAnonymous(ApiTester $I)
    {
        $ent  = $this->obj1;
        $resp = $I->failToGet($this->restUrl, $ent['id']);

        $ent  = $this->obj2odobren;
        $resp = $I->failToGet($this->restUrl, $ent['id']);
    }

    /**
     * @param ApiTester $I
     */
    public function getZAdmin(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $ent  = $this->obj1;
        $resp = $I->successfullyGet($this->restUrl, $ent['id']);
        $I->assertNotEmpty($resp);

        //drug zapis 
        $ent  = $this->obj2odobren;
        $resp = $I->successfullyGet($this->restUrl, $ent['id']);
        $I->assertNotEmpty($resp);
    }

    /**
     * @param ApiTester $I
     */
    public function getZIfiReadall(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$berta, \IfiTest\AuthPage::$bertaPass);

        $ent  = $this->obj1;
        $resp = $I->successfullyGet($this->restUrl, $ent['id']);
        $I->assertNotEmpty($resp);

        //drug zapis 
        $ent  = $this->obj2odobren;
        $resp = $I->successfullyGet($this->restUrl, $ent['id']);
        $I->assertNotEmpty($resp);
    }

    /**
     * @param ApiTester $I
     */
    public function getSPlanerko(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$petra, \IfiTest\AuthPage::$petraPass);

        $ent  = $this->obj1;
        $resp = $I->successfullyGet($this->restUrl, $ent['id']);
        $I->assertNotEmpty($resp);

        //drug zapis 
        $ent  = $this->obj2odobren;
        $resp = $I->successfullyGet($this->restUrl, $ent['id']);
        $I->assertNotEmpty($resp);
    }

    /**
     * @param ApiTester $I
     */
    public function getZNavadnimUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$irena, \IfiTest\AuthPage::$irenaPass);

        $ent  = $this->obj1;
        $resp = $I->failToGet($this->restUrl, $ent['id']);

        //drug zapis 
        $ent  = $this->obj2odobren;
        $resp = $I->successfullyGet($this->restUrl, $ent['id']);
        $I->assertNotEmpty($resp);
    }

}
