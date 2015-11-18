<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Permission;

use ApiTester;

/**
 * Description of PermissionCest
 * 
 *      metode, ki jo podpira API
 *      - getlist
 *       - create                                - ne testiramo, ker kreiramo s fixturji
 *       - update                                - ne testiramo, ker kreiramo s fixturji
 *       - get - kontrola vseh polj te entitete  - ne testiramo, ker kreiramo s fixturji
 *       - delete                                - ne testiramo, ker kreiramo s fixturji
 *      validate metodo za entiteto
 * relacije z drugimi entitetami
 * - roles M2M
 * .pri to many relacijah testiraj : update, get (list+id), delete
 * getlist različne variante relacij
 *  *
 * @author rado
 */
class PermissionCest
{

    private $restUrl = '/rest/permission';
    private $roleUrl = '/rest/role';
    private $obj;
    private $objPermission2;
    private $objRole1;
    private $objRole2;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl, []);
        $list = $resp['data'];
        codecept_debug($list);

        $this->objPermission1 = $ent                  = array_pop($list);
        $I->assertNotEmpty($ent);

        $this->objPermission2 = $ent                  = array_pop($list);
        $I->assertNotEmpty($ent);
    }

        /**
     * 
     * @param ApiTester $I
     */
    public function getListPoImenu(ApiTester $I)
    {
        //iskanje naziv
        $resp = $I->successfullyGetList($this->restUrl . "?q=" . "Drzava-", []);
        $list = $resp['data'];
        codecept_debug($list);

        $I->assertEquals(2, $resp['state']['totalRecords']);
    }

    
    /**
     * kreiramo rolo 
     * 
     * @param ApiTester $I
     */
    public function createRolo(ApiTester $I)
    {
        $data           = [
            'name'        => 'TEST4VLOGA',
            'description' => 'Testna vloga za Cest testiranje',
//            'builtIn'     => false,     //$$ rb NotEmpty validator ne dovoli false
        ];
        $this->objRole1 = $role           = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertEquals('TEST4VLOGA', $role['name']);
        $I->assertEquals('Testna vloga za Cest testiranje', $role['description']);
        $I->assertNotEmpty($role['id']);

        // kreiramo še 1 zapis
        $data           = [
            'name'        => 'TEST5VLOGA',
            'description' => 'Testna vlogica za Cest testiranje',
//            'builtIn'     => false,     //$$ rb NotEmpty validator ne dovoli false
        ];
        $this->objRole2 = $role           = $I->successfullyCreate($this->roleUrl, $data);

        $I->assertNotEmpty($role['id']);
        $I->assertEquals('TEST5VLOGA', $role['name']);
    }

    /**
     * kreiramo relacijo
     * @depends getList
     * @depends createRolo
     * 
     * @param ApiTester $I
     */
    public function ustvariRelacijoZRolo(ApiTester $I)
    {
        $resp = $I->successfullyUpdate($this->restUrl, $this->objPermission2['id'] . "/roles/" . $this->objRole1['id'], []);

        // ustvarimo še eno relacijo z 2. rolo
        $resp = $I->successfullyUpdate($this->restUrl, $this->objPermission2['id'] . "/roles/" . $this->objRole2['id'], []);
    }

    /**
     * preberemo relacij
     * @depends ustvariRelacijoZRolo
     * 
     * @param ApiTester $I
     */
    public function preberiRelacijeZRolami(ApiTester $I)
    {
        $resp = $I->successfullyGetRelation($this->restUrl, $this->objPermission2['id'], "roles", "");
        $I->assertGreaterThanOrEqual(2, count($resp));

        // get po popa id  
        $resp = $I->successfullyGetRelation($this->restUrl, $this->objPermission2['id'], "roles", $this->objRole1['id']);
        $I->assertEquals(1, count($resp));
    }


    /**
     * brisanje relacij
     * @depends ustvariRelacijoZRolo
     * 
     * @param ApiTester $I
     */
    public function deleteRelacijoZRolo(ApiTester $I)
    {
        // primer:
        // DELETE   http://ifigenija.local:8080/rest/oseba/00090000-555b-31ed-d438-f3f46c26b59e/popa/00080000-555b-31ed-7683-d4cdd224d2b5?XDEBUG_SESSION_START=netbeans-xdebug
        $resp = $I->successfullyDeleteRelation($this->restUrl, $this->objPermission2['id'], "roles", $this->objRole1['id']);

        $resp = $I->emptyGetRelation($this->restUrl, $this->objPermission2['id'], "roles", $this->objRole1['id']);
    }

}
