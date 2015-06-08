<?php

/*
 *  Licenca GPLv3
 */

namespace Rest\ProgramPremiera;

use ApiTester;

/**
 * Description of ProgramPremieraCest
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
class ProgramPremieraCest
{

    private $restUrl = '/rest/programpremiera';
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
            'celotnaVrednost'    => 1.23,
            'zaproseno'          => 1.23,
            'lastnaSredstva'     => 1.23,
            'avtorskiHonorarji'  => 1.23,
            'tantieme'           => 1.23,
            'drugiViri'          => 1.23,
            'drugiJavni'         => 1.23,
            'obiskDoma'          => 1,
            'obiskGost'          => 1,
            'obiskZamejo'        => 1,
            'obiskInt'           => 1,
            'ponoviDoma'         => 1,
            'ponoviZamejo'       => 1,
            'ponoviGost'         => 1,
            'ponoviInt'          => 1,
            'utemeljitev'        => 'zz',
            'uprizoritev'        => NULL,
            'tipProgramskeEnote' => NULL,
            'tip'                => 'premiera', //$$ ali to polje potrebujemo?
            'dokument'           => null, 
        ];
        $this->obj1 = $ent        = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['utemeljitev'], 'zz');

        // kreiramo še en zapis
    }

}
