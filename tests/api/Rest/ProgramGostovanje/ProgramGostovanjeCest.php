<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramGostovanje;

use ApiTester;

/**
 * Description of ProgramGostovanjeCest
 * 
 * 
 * metode, ki jo podpira API
 * - create
 * - getlist
 * - update
 * - get - kontrola vseh polj te entitete
 * - delete
 * validate metodo za entiteto
 * relacije z drugimi entitetami (to many relacije)
 * - pri many to many relacijah testiraj : update, get (list+id), delete
 * getlist različne variante relacij
 * 
 *
 * @author rado
 */
class ProgramGostovanjeCest
{

    private $restUrl = '/rest/programgostovanje';
    private $obj1;
    private $obj2;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }

    /**
     *  kreiramo zapis
     * 
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data       = [
            'transportniStroski' => 1.23,
            'odkup'              => 1.23,
            'dokument'           => null,
            'gostitelj'          => null,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['transportniStroski'], 1.23);

        // kreiramo še en zapis
    }

}
