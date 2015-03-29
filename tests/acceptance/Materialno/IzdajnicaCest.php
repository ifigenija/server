<?php

use \AcceptanceTester;

class IzdajnicaCest
extends MatPoslBaseCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        //levi stoplec podatkov
        $xpath = $I->xPathNiz('select', 'glava-panel', 'dok');
        $I->selectOption($xpath, '120, IZDAJNICA MATERIALA');

        $I->izpolniInput('input', 'glava-panel', 'nalog_text', '14-574-1');

        $xpath = $I->xPathNiz('select', 'glava-panel', 'jezik');
        $I->selectOption($xpath, 'Nemški');

        //desni stolpec podatkov

        $I->izpolniInput('input', 'glava-panel', 'datDog', $I->genRandStr('Prv_', 11));
        $xpath = $I->xpathNiz('input', 'glava-panel', 'datDog');
        $I->pressKey($xpath, \WebDriverKeys::TAB);

        $xpath = $I->xPathNiz('select', 'glava-panel', 'skladisce');
        $I->selectOption($xpath, '20, POLIZDELKI');
    }

    protected function dodajPostavke(AcceptanceTester $I)
    {
        $I->gumb('region-postavke-toolbar', 'dodaj', true);
        $I->gumb('region-postavke-toolbar', 'prekliči', false);

        //levi stolpec
        $I->izpolniInput('input', 'region-postavke', 'maticna_text', '0004000001');

        $xpath = $I->xpathNiz('select', 'region-postavke', 'skladisce');
        $I->selectOption($xpath, '30, GOTOVI IZDELKI');

        $I->izpolniInput('input', 'region-postavke', 'kolicina', '10,2');

        //desni stolpec
        $I->izpolniInput('input', 'region-postavke', 'vezaNalog_text', '14-574-1');
        //$I->izpolniInput('input', 'region-postavke', 'vezaRazpis_text', 'izjava');
        //$I->izpolniInput('input', 'region-postavke', 'vezaIzd_text', '2,56');
        $I->izpolniInput('input', 'region-postavke', 'polizdelek_text', '0004000001');
        $I->izpolniInput('input', 'region-postavke', 'delavec_text', '6190000021');

        $I->gumb('region-postavke-toolbar', 'shrani', true);
        $I->waitForSporociloSuccess();
    }

    // tests
    public function testiranjeDodajanjaIzdajnice(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja(IzdajnicaPage::$URLDodaj);
    }

    public function testiranjePregledaIzdajnice(AcceptanceTester $I)
    {
        $this->testiranjePregleda(IzdajnicaPage::$URLPregled);
    }

    public function testiranjeUrejanjaIzdajnice(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja(IzdajnicaPage::$URLUredi);
    }

    public function testiranjeOdstranjevanjaIzdajnice(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja(IzdajnicaPage::$URL, IzdajnicaPage::$URLPregled);
    }

}
