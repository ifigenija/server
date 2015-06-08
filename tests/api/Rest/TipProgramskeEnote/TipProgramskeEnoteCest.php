<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\TipProgramskeEnote;

use ApiTester;

/**
 * Description of TipProgramskeEnoteCest
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
class TipProgramskeEnoteCest
{

    private $restUrl = '/rest/tipprogramskeenote';
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
            'sifra'        => 'ZZ',
            'naziv'        => 'zz',
            'koprodukcija' => FALSE,
            'maxFaktor'    => 0.75,
            'maxVsi'       => 0.86,
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['sifra'], 'ZZ');

        // kreiramo še en zapis
    }

}
