<?php

use \AcceptanceTester;

class PrevrednotenjeCest
extends MatPoslBaseCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        //levi stoplec podatkov
        $xpath = $I->xPathNiz('select', 'glava-panel', 'dok');
        $I->selectOption($xpath, '160, MEDSKLADIŠČNICA');

        $xpath = $I->xPathNiz('select', 'glava-panel', 'skladisce');
        $I->selectOption($xpath, '10, SUROVINE11111');

        $xpath = $I->xPathNiz('select', 'glava-panel', 'sklv');
        $I->selectOption($xpath, '20, POLIZDELKI');

        //desni stolpec podatkov

        $I->izpolniInput('input', 'glava-panel', 'datDog', $I->genRandStr('Prm_', 11));
        $xpath = $I->xpathNiz('input', 'glava-panel', 'datDog');
        $I->pressKey($xpath, \WebDriverKeys::TAB);

        $xpath = $I->xPathNiz('select', 'glava-panel', 'jezik');
        $I->selectOption($xpath, 'Angleški');
    }

    protected function dodajPostavke(AcceptanceTester $I)
    {
        $I->gumb('region-postavke-toolbar', 'dodaj', true);
        $I->gumb('region-postavke-toolbar', 'prekliči', false);

        //levi stolpec
        $I->izpolniInput('input', 'region-postavke', 'maticna_text', '0004000001');

        //desni stolpec
        $I->izpolniInput('input', 'region-postavke', 'kolicina', '10,2');

        $I->gumb('region-postavke-toolbar', 'shrani', true);
        $I->waitForSporociloSuccess();
    }

    // tests
    public function testiranjeDodajanjaPrevrednotenja(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja(PrevrednotenjePage::$URLDodaj);
    }

    public function testiranjePregledaPrevrednotenja(AcceptanceTester $I)
    {
        $this->testiranjePregleda(PrevrednotenjePage::$URLPregled);
    }

    public function testiranjeUrejanjaPrevrednotenja(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja(PrevrednotenjePage::$URLUredi);
    }

    public function testiranjeOdstranjevanjaPrevrednotenja(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja(PrevrednotenjePage::$URL, PrevrednotenjePage::$URLPregled);
    }

}
