<?php

namespace Rest\Alternacija;

use ApiTester;

/**
 * Description of AlternacijaCest
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
class AlternacijaCest
{

    private $restUrl = '/rest/alternacija';
    private $osebaUrl = '/rest/oseba';
    private $obj;
    private $objOseba;

    public function _before(ApiTester $I)
    {
        $I->amHttpAuthenticated(\IfiTest\AuthPage::$admin, \IfiTest\AuthPage::$adminPass);
    }

    public function _after(ApiTester $I)
    {
        
    }
    /**
     *  kreiramo  osebo
     * 
     * @param ApiTester $I
     */
    public function createOsebo(ApiTester $I)
    {
        $data = [
            'naziv'         => 'zz',
            'ime'           => 'zz',
            'priimek'       => 'zz',
            'funkcija'      => 'zz',
            'srednjeIme'    => 'zz',
            'psevdonim'     => 'zz',
            'email'         => 'x@xxx.xx',
            'datumRojstva'  => '1973-28-03T04:30:00',
            'emso'          => 'ZZ',
            'davcna'        => 'ZZ123',
            'spol'          => 'M',
            'opombe'        => 'zz',
            'drzavljanstvo' => 'zz',
            'drzavaRojstva' => 'zz',
            'krajRojstva'   => 'zz',
            'user'          => null,
        ];

        $this->objOseba = $oseba          = $I->successfullyCreate($this->osebaUrl, $data);

        $I->assertEquals('zz', $oseba['ime']);
        $I->assertNotEmpty($oseba['id']);
    }

    
    
    /**
     *  kreiramo alternacijo
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'zaposlen' => true,
            'vloga' => null ,
            'sodelovanje' => null ,
            'oseba' => $this->objOseba['id'],
            'koprodukcija' => null ,
            'pogodba     ' => null ,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['zaposlen'], true);
    }

}
