<?php

/*
 *  Licenca GPLv3
 */

/**
 * Testiram pripravo fixturjev
 * 
 * Tipi funkcij iz SLOGI-ja (Slovenskega gledališkega inštituta:
 * - Igralci in animatorji
 * - Baletniki in plesalci
 * - Avtorji 
 * - Režiserji
 * - Scenografi
 * - Kostumografi
 * - Oblikovalci maske
 * - Avtorji glasbe
 * - Oblikovalci svetlobe
 * - Koreografi
 * - Dramaturgi
 * - Lektorji
 * - Prevajalci
 * - Oblikovalci videa
 * - Intermedijski ustvarjalci
 * 
 *
 * @author rado
 */
class TestZaFixtureCest
{

    private $restUrl = '/rest/tipfunkcije';
    private $obj;

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
     * @param ApiTester $I
     */
    public function create(ApiTester $I)
    {
        $data = [
            'ime'               => 'Igralec ali animator',
            'opis'              => 'Igralci in animatorji',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Igralka ali animatorka',
            'podrocje'          => 'igralec',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Baletnik ali plesalec',
            'opis'              => 'Baletniki in plesalci',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Baletnica ali plesalka',
            'podrocje'          => 'igralec',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Avtor',
            'opis'              => 'Avtorji',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Avtorka',
            'podrocje'          => 'umetnik',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Režiser',
            'opis'              => 'Režiserji',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Režiserka',
            'podrocje'          => 'umetnik',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Scenograf',
            'opis'              => 'Scenografi',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Scenografka',
            'podrocje'          => 'tehnik',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Kostumograf',
            'opis'              => 'Kostumografi',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Kostumografinja',
            'podrocje'          => 'tehnik',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Oblikovalec maske',
            'opis'              => 'Oblikovalci maske',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Oblikovalka maske',
            'podrocje'          => 'tehnik',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Avtor glasbe',
            'opis'              => 'Avtorji glasbe',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Avtorica glasbe',
            'podrocje'          => 'umetnik',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Oblikovalec svetlobe',
            'opis'              => 'Oblikovalci svetlobe',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Oblikovalka svetlobe',
            'podrocje'          => 'tehnik',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Koreograf',
            'opis'              => 'Koreografi',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Koreografinja',
            'podrocje'          => 'umetnik',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Dramaturg',
            'opis'              => 'Dramaturgi',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Dramaturginja',
            'podrocje'          => 'umetnik',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Lektorj',
            'opis'              => 'Lektorji',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Lektorica',
            'podrocje'          => 'umetnik',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Prevajalec',
            'opis'              => 'Prevajalci',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Prevajalka',
            'podrocje'          => 'umetnik',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Oblikovalec videa',
            'opis'              => 'Oblikovalci videa',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Oblikovalka videa',
            'podrocje'          => 'umetnik',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);

        // kreiramo naslednji zapis
        $data = [
            'ime'               => 'Intermedijski ustvarjalec',
            'opis'              => 'Intermedijski ustvarjalci',
            'dovoliPrekrivanje' => TRUE,
            'maxPrekrivanj'     => 1,
            'imeZenski'         => 'Intermedijska ustvarjalka',
            'podrocje'          => 'umetnik',
        ];
        $ent  = $I->successfullyCreate($this->restUrl, $data);
        $I->assertNotEmpty($ent['id']);
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
        $I->assertEquals(15, $resp['state']['totalRecords']);
    }

}
