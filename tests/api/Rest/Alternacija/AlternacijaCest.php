<?php

namespace Rest\Alternacija;

use ApiTester;

/**
 * Description of AlternacijaCest
 * 
 *      metode, ki jo podpira API
 *      - create
 *      - getlist
 *      - update
 *      - get - kontrola vseh polj te entitete
 *      - delete
 *      validate metodo za entiteto - je ni
 *      relacije z drugimi entitetami
 *      - funkcija
 *      - sodelovanje (zaposlitev)
 *      - oseba
 *      - koprodukcija
 *      - pogodba
 *      getlist različne variante relacij
 *      - vse
 *      - funkcija
 *
 * @author rado
 */
class AlternacijaCest
{

    private $restUrl        = '/rest/alternacija';
    private $osebaUrl       = '/rest/oseba';
    private $funkcijaUrl    = '/rest/funkcija';
    private $uprizoritevUrl = '/rest/uprizoritev';
    private $zaposlitevUrl = '/rest/zaposlitev';
    private $produkcijskaHisaUrl = '/rest/produkcijskahisa';
    private $koprodukcijaUrl = '/rest/produkcijadelitev';
    private $pogodbaUrl = '/rest/pogodba';
    private $obj;
    private $objOseba;
    private $objFunkcija;
    private $objUprizoritev;
    private $objZaposlitev;
    private $objProdukcijskaHisa;
    private $objKoprodukcija;
    private $objPogodba ;

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
     * 
     * @param ApiTester $I
     */
    public function createUprizoritev(ApiTester $I)
    {
        $data                 = [
            'faza'             => 'zz',
            'naslov'           => 'zz',
            'podnaslov'        => 'zz',
            'delovniNaslov'    => 'zz',
            'datumPremiere'    => '2010-02-01T00:00:00+0100',
            'stOdmorov'        => 1,
            'avtor'            => 'zz',
            'gostujoca'        => true,
            'trajanje'         => 2,
            'opis'             => 'zz',
            'arhIdent'         => 'zz',
            'arhOpomba'        => 'zz',
            'datumZakljucka'   => '2019-02-01T00:00:00+0100',
            'sloAvtor'         => true,
            'kratkiNaslov'     => 'zz',
//            'besedilo'         => $this->objBesedilo['id'],
            'besedilo'         => NULL,
            'zvrstUprizoritve' => null,
            'zvrstSurs'        => null,
        ];
        $this->objUprizoritev = $ent                  = $I->successfullyCreate($this->uprizoritevUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['opis'], 'zz');
    }

    /**
     *  napolnimo vsaj en zapis
     * 
     * @param ApiTester $I
     */
    public function createFunkcijo(ApiTester $I)
    {
        $data              = [
            'podrocje'    => 1,
            'naziv'       => 'zz',
            'velikost'    => 'zz',
            'pomembna'    => true,
            'sort'        => 2,
            'uprizoritev' => $this->objUprizoritev['id'],
            'privzeti'    => null,
            'tipFunkcije' => null,
        ];
        $this->objFunkcija = $ent               = $I->successfullyCreate($this->funkcijaUrl, $data);
        $I->assertEquals($ent['naziv'], 'zz');
        $I->assertNotEmpty($ent['id']);
    }

        /**
     *  kreiramo zapis
     * 
     * @depends createOsebo
     * 
     * @param ApiTester $I
     */
    public function createZaposlitev(ApiTester $I)
    {
        $data      = [
            'status'              => 'zz',
            'zacetek'             => '2010-02-01T00:00:00+0100',
            'konec'               => '2010-02-01T00:00:00+0100',
            'tip'                 => 1,
            'delovnaObveza'       => 2,
            'malica'              => 'zz',
            'izmenskoDelo'        => true,
            'individualnaPogodba' => true,
            'jeZaposlenVdrugemJz' => TRUE,
            'jeNastopajoci'       => TRUE,
            'oseba'               => null, 
        ];
        $this->objZaposlitev = $ent       = $I->successfullyCreate($this->zaposlitevUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['status'], 'zz');

    }

    
        /**
     *  kreiramo zapis
     * 
     * @param ApiTester $I
     */
    public function createProdukcijskaHisa(ApiTester $I)
    {
        $data                      = [
            'status' => 'zz',
            'popa'   => null,
        ];
        $this->objProdukcijskaHisa = $ent                       = $I->successfullyCreate($this->produkcijskaHisaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        $I->assertEquals($ent['status'], 'zz');
    }

        /**
     *  kreiramo zapis
     * 
     * @depends createProdukcijskaHisa
     * @depends createUprizoritev
     * 
     * @param ApiTester $I
     */
    public function createKoprodukcijo(ApiTester $I)
    {
        $data      = [
            'odstotekFinanciranja' => 1.23,
            'vrstaKoproducenta'    => 'zz',
            'uprizoritev'          => $this->objUprizoritev,
            'koproducent'          => $this->objProdukcijskaHisa,
        ];
        $this->objKoprodukcija = $ent       = $I->successfullyCreate($this->koprodukcijaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['vrstaKoproducenta'], 'zz');
    }

        /**
     *  kreiramo pogodbo
     * 
     * @param ApiTester $I
     */
    public function createPogodbo(ApiTester $I)
    {
        $data      = [
            'sifra'             => 'ZZ123',
            'vrednostVaje'      => 33.33,
            'vrednostPredstave' => 44.44,
            'vrednostUre'       => 22.22,
            'aktivna'           => false,
            'opis'              => 'zz',
            'oseba'             => $this->objOseba['id'],
            'popa'              => null,
            'trr'               => null,
        ];
        $this->objPogodba = $ent       = $I->successfullyCreate($this->pogodbaUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['sifra'], 'ZZ123');

    }

    
    /**
     *  kreiramo zapis
     * 
     * @depends createOsebo
     * @depends createFunkcijo
     * @depends createZaposlitev
     * @depends createKoprodukcijo
     * @depends createPogodbo
     * 
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data      = [
            'zaposlen'     => true,
            'funkcija'     => $this->objFunkcija['id'],
            'sodelovanje'  => $this->objZaposlitev['id'],
            'oseba'        => $this->objOseba['id'],
            'koprodukcija' => $this->objKoprodukcija['id'],
            'pogodba'      => $this->objPogodba['id'],
        ];
        $this->obj = $ent       = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
        codecept_debug($ent);
        $I->assertEquals($ent['zaposlen'], true);
        
        // kreiram še en zapis
        $data      = [
            'zaposlen'     => true,
            'funkcija'     => $this->objFunkcija['id'],
            'sodelovanje'  => null,
            'oseba'        => $this->objOseba['id'],
            'koprodukcija' => $this->objKoprodukcija['id'],
            'pogodba'      => null,
        ];
        $ent       = $I->successfullyCreate($this->restUrl, $data);
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
    public function getListVse(ApiTester $I)
    {
        $listUrl = $this->restUrl . "/vse";
        codecept_debug($listUrl);
        $resp    = $I->successfullyGetList($listUrl, []);
        $list    = $resp['data'];

        $I->assertNotEmpty($list);
        $I->assertEquals(2, $resp['state']['totalRecords']);
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
        $I->assertEquals($ent['funkcija'], $this->objFunkcija['id']);
        $I->assertEquals($ent['sodelovanje'], $this->objZaposlitev['id']);
        $I->assertEquals($ent['oseba'], $this->objOseba['id']);
        $I->assertEquals($ent['koprodukcija'], $this->objKoprodukcija['id'], "napačna koprodukcija");
        $I->assertEquals($ent['pogodba'], $this->objPogodba['id']);
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
