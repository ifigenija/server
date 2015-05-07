<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\Rekvizit;

use ApiTester;

/**
 * Description of RekviziterstvoCest
 *
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
class RekviziterstvoCest
{

    private $restUrl     = '/rest/rekviziterstvo';
    private $rekvizitUrl = '/rest/rekvizit';
    private $obj;
    private $objRekvizit;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  kreiramo rekvizit
     * 
     * @param ApiTester $I
     */
    public function createRekvizit(ApiTester $I)
    {
        $data      = [
            'ime'   => 'zz',
            'vrsta' => 'zz',
        ];
        $this->objRekvizit = $ent       = $I->successfullyCreate($this->rekvizitUrl, $data);
        $I->assertNotEmpty($ent['id']);
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'namenUporabe'   => true,
            'opisPostavitve' => 'zz',
            'rekvizit'       => $this->objRekvizit['id'],
            'uprizoritev'    => null,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['opisPostavitve'], 'zz');
    }

}
