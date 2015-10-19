<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\TerminStoritve;

use ApiTester;

/**
 * Description of AvtorizacijeTerminStoritveCest
 * 
 * dostop do terminov storitve. Naslanjamo se na testne fixturje
 * Za narediti:
 * - zavrnitve dostopa
 *   . navaden user 
 *   . user, ki ima le TerminStoritve-write  dostop  
 *   . user, ki je tehnični vodja, pa bi rad popravljal ostale zapise
 *   .  user, ki je sicer vodja ekipe (inšpecient), vendar termin storitve ni vezan na neko uprizoritev $$
 * - omogočanje dostopa
 *   . tehničnemu vodji dostop do ur tehničnega osebja dotične uprizoritve
 *   . inšpicientu dostop do ur vsega osebja v dotični uprizoritvi
 *   . uporabniku s posebnim dovoljenem "TerminStoritve-vse" do vsega
 *      . tudi do tistih , kjer ni uprizoritve   
 *      . do vseh ki so v uprizoritvi
 * 
 * @author rado
 */
class AvtorizacijeTerminStoritveCest
{

    private $restUrl              = '/rest/terminstoritve';
    private $alternacijaUrl       = '/rest/alternacija';
    private $lookupAlternacijaUrl = '/lookup/alternacija';
    private $obj1;
    private $obj2Teh;
    private $obj3dez;
    private $obj4gost;
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
     * @param ApiTester $I
     */
    public function createVloge(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
        $data = [
            'name'        => 'TERMINSTORITVE',
            'description' => 'Testna vloga za urejanje TerminStoritve',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('TERMINSTORITVE', $role['name']);
        $I->assertNotEmpty($role['id']);

        // 2. vloga
        $data = [
            'name'        => 'TERMINVSE',
            'description' => 'Testna vloga za urejanje vsega v terminu storitve',
        ];
        $role = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('TERMINVSE', $role['name']);
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

        //1. vlogi read
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TERMINSTORITVE",
            'permname' => 'TerminStoritve-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // 2. vloga, dodatmo  -vse in -write
        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TERMINVSE",
            'permname' => 'TerminStoritve-write',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcRoleUrl, 'grant', [
            'rolename' => "TERMINVSE",
            'permname' => 'TerminStoritve-vse',
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
            'username' => \IfiTest\AuthPage::$tona,
            'rolename' => 'TERMINSTORITVE',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$ivo,
            'rolename' => 'TERMINSTORITVE',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$tatjana,
            'rolename' => 'TERMINVSE',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // ima vlogo, vendar nima zapisov v terminstoritve
        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$joze,
            'rolename' => 'TERMINSTORITVE',
        ]);
        $I->assertNotEmpty($res);
        $I->assertTrue($res);

        // ima ifi-all vlogo
        $res = $I->successfullyCallRpc($this->rpcUserUrl, 'grant', [
            'username' => \IfiTest\AuthPage::$ali,
            'rolename' => 'ifi-all',
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
    public function lookupAlternacije(ApiTester $I)
    {
        // igralec
        $resp                   = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0001', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija1 = $resp['data'][0];

        // tehnik
        // še en zapis alternacije, katerega funkcija.podrocje=tehnik  (glede na fixturje)
        $resp                      = $I->successfullyGetList($this->lookupAlternacijaUrl . '?ident=0005', []);
        $I->assertNotEmpty($resp);
        codecept_debug($resp);
        $I->assertTrue(array_key_exists('data', $resp), "ima data");
        $I->assertTrue(array_key_exists('label', $resp['data'][0]), "ima labelo");
        $I->assertTrue(array_key_exists('totalRecords', $resp['state']), "ima total records");
        $I->assertEquals(1, $resp['state']['totalRecords'], "total records");
        $this->lookAlternacija2Teh = $resp['data'][0];
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
        codecept_debug($list);
        //        $I->assertNotEmpty($list);
        // poiščemo termina storitve - najprej za ne-tehnika:
        $key        = array_search($this->lookAlternacija1['id'], array_column($list, 'alternacija'));
        $this->obj1 = $ent        = $list[$key];
        codecept_debug($ent);

        // poiščemo termina za tehnika
        $key           = array_search($this->lookAlternacija2Teh['id'], array_column($list, 'alternacija'));
        $this->obj2Teh = $ent           = $list[$key];
        codecept_debug($ent);

        // poiščemo termina brez alternacije
        $key           = array_search(true, array_column($list, 'dezurni'));
        $this->obj3dez = $ent           = $list[$key];
        codecept_debug($ent);

        // poiščemo termin gost
        $key            = array_search(true, array_column($list, 'gost'));
        $this->obj4gost = $ent            = $list[$key];
        codecept_debug($ent);
    }

    /**
     * @param ApiTester $I
     */
    public function updateZAnonymous(ApiTester $I)
    {
        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 1;
        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);

        $ent                   = $this->obj2Teh;
        $ent['planiranoTraja'] = 1;
        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);

        $ent                   = $this->obj3dez;
        $ent['planiranoTraja'] = 1;
        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
    }

    /**
     * @param ApiTester $I
     */
    public function updateZAdmin(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);

        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 3;
        $resp                  = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);

        //drug zapis 
        $ent                   = $this->obj2Teh;
        $ent['planiranoTraja'] = 3;
        $resp                  = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);

        // zapis brez alternacije / uprizoritve
        $ent                   = $this->obj3dez;
        $ent['planiranoTraja'] = 1;
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

        //drug zapis 
        $ent                   = $this->obj2Teh;
        $ent['planiranoTraja'] = 3;
        $resp                  = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);

        // zapis brez alternacije / uprizoritve
        $ent                   = $this->obj3dez;
        $ent['planiranoTraja'] = 1;
        $resp                  = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
    }

    /**
     * @param ApiTester $I
     */
    public function updateZIfiReadall(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$berta, \IfiTest\AuthPage::$bertaPass);

        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 3;
        $I->failToUpdate($this->restUrl, $ent['id'], $ent);

        //drug zapis 
        $ent                   = $this->obj2Teh;
        $ent['planiranoTraja'] = 3;
        $I->failToUpdate($this->restUrl, $ent['id'], $ent);

        // zapis brez alternacije / uprizoritve
        $ent                   = $this->obj3dez;
        $ent['planiranoTraja'] = 1;
        $I->failToUpdate($this->restUrl, $ent['id'], $ent);
    }

    /**
     * @param ApiTester $I
     */
    public function updateZDovoljenjemTerminStoritveVse(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$tatjana, \IfiTest\AuthPage::$tatjanaPass);

        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 3;
        $resp                  = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);

        //drug zapis 
        $ent                   = $this->obj2Teh;
        $ent['planiranoTraja'] = 3;
        $resp                  = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);

        // zapis brez alternacije / uprizoritve
        $ent                   = $this->obj3dez;
        $ent['planiranoTraja'] = 1;
        $resp                  = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
    }

    /**
     * @param ApiTester $I
     */
    public function updateZInspicientom(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$ivo, \IfiTest\AuthPage::$ivoPass);

        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 4;
        $resp                  = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);

        //drug zapis 
        $ent                   = $this->obj2Teh;
        $ent['planiranoTraja'] = 3;
        $resp                  = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);

        $ent                   = $this->obj3dez;
        $ent['planiranoTraja'] = 3;
//        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        /**
         *  inšpicient lahko ažurira vse TS , če obstaja uprizoritev
         */
        $resp                  = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);
    }

    /**
     * @param ApiTester $I
     */
    public function updateSTehVodjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$tona, \IfiTest\AuthPage::$tonaPass);

        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 5;
        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);

        //drug zapis  tehnik
        $ent                   = $this->obj2Teh;
        $ent['planiranoTraja'] = 3;
        $resp                  = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);

        $ent                   = $this->obj3dez;
        $ent['planiranoTraja'] = 3;
        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
    }

    /**
     * @param ApiTester $I
     */
    public function updateZInspicientomBrezZapisov(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$joze, \IfiTest\AuthPage::$jozePass);

        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 7;
        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);

        //drug zapis 
        $ent                   = $this->obj2Teh;
        $ent['planiranoTraja'] = 7;
        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);

        $ent                   = $this->obj3dez;
        $ent['planiranoTraja'] = 7;
        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
    }

    /**
     * @param ApiTester $I
     */
    public function updateZNavadnimUserjem(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$irena, \IfiTest\AuthPage::$irenaPass);

        $ent                   = $this->obj1;
        $ent['planiranoTraja'] = 6;
        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
        $I->assertNotEmpty($resp);

        //drug zapis 
        $ent                   = $this->obj2Teh;
        $ent['planiranoTraja'] = 6;
        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);

        $ent                   = $this->obj3dez;
        $ent['planiranoTraja'] = 6;
        $resp                  = $I->failToUpdate($this->restUrl, $ent['id'], $ent);
    }

}
