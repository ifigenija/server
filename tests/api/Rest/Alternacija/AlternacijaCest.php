<?php

namespace Rest\Alternacija;

use ApiTester;

/**
 * Polnjenje drugih entiteg
 * - funkcija
 * Description of AlternacijaCest
 * metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 * relacije z drugimi entitetami
 * getlist različne variante relacij
 * - funkcija
 * - sodelovanje
 *      - oseba
 * - koprodukcija
 * - pogodba
 *
 * @author rado
 */
class AlternacijaCest
{

    private $restUrl     = '/rest/alternacija';
    private $osebaUrl    = '/rest/oseba';
    private $funkcijaUrl = '/rest/funkcija';
    private $obj;
    private $objOseba;
    private $objFunkcija;

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
     * @depends createOsebo
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'zaposlen'     => true,
            'funkcija'     => null,
            'sodelovanje'  => null,
            'oseba'        => $this->objOseba['id'],
            'koprodukcija' => null,
            'pogodba'      => null,
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['zaposlen'], true);
    }

    /**
     * preberi vse zapise od osebe
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function getListPoFunkciji(ApiTester $I)
    {
        $listUrl = $this->restUrl . "?funkcija=" . $this->objFunkcija['id'];

        $resp = $I->successfullyGetList($listUrl, []);
        $list = $resp['data'];
        codecept_debug($resp);

        $I->assertEquals(2, $resp['state']['totalRecords']);
        $I->assertNotEmpty($list);
//        $I->assertEquals("xx", $list[0]['status']);      // $$ odvisno od sortiranja
    }

    /**
     * @depends create
     * @param ApiTester $I
     */
    public function getList(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertEquals(1, $resp['state']['totalRecords']);
//        $I->assertEquals("zz", $list[0]['status']);      //glede na sort
    }

    /**
     * spremenim zapis
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function update(ApiTester $I)
    {
        $ent             = $this->obj;
        $ent['zaposlen'] = false;

        $this->obj = $entR      = $I->successfullyUpdate($this->restUrl, $ent['id'], $ent);

        $I->assertEquals($entR['zaposlen'], FALSE);
    }

    /**
     * Preberem zapis in preverim vsa polja
     * 
     * @depends create
     * @param ApiTester $I
     */
    public function read(\ApiTester $I)
    {
        $ent = $I->successfullyGet($this->restUrl, $this->obj['id']);

        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['zaposlen'], false);
        $I->assertEquals($ent['funkcija'], null);
        $I->assertEquals($ent['sodelovanje'], null);
        $I->assertEquals($ent['oseba'], $this->objOseba['id']);
        $I->assertEquals($ent['koprodukcija'], null, "napačna koprodukcija");
        $I->assertEquals($ent['pogodba'], null);
    }

    /**
     * brisanje zapisa
     * 
     * @depends create
     */
    public function delete(ApiTester $I)
    {
        $I->successfullyDelete($this->restUrl, $this->obj['id']);
        $I->failToGet($this->restUrl, $this->obj['id']);
    }

}
