<?php

namespace Rest\Funkcija;

use ApiTester;

/**
 * Description of FunkcijaCest

 * metode, ki jo podpira API
 * - create
 * - getlist
 * - update
 * - get - kontrola vseh polj te entitete
 * - delete
 * validate metodo za entiteto
 * relacije z drugimi entitetami
 *
 * @author rado
 */
class FunkcijaCest
{

    private $restUrl = '/rest/funkcija';
    private $obj;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'podrocje'    => 1,
            'naziv'       => 'zz',
            'velikost'    => 'zz',
            'pomembna'    => true,
            'sort'        => 2,
            'uprizoritev' => null, //$$ zacaasno izključi
            'privzeti'    => null,
            'tipVloge'    => null,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertNotEmpty($ent['id']);
    }

    /**
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $resp = $I->successfullyGetList($this->restUrl, []);
        $list = $resp['data'];

        $I->assertNotEmpty($list);
        $this->id = array_pop($list)['id'];
        $I->assertNotEmpty($this->id);
    }

}
