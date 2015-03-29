<?php

use \AcceptanceTester;

class DobavnicaCest
    extends MatPoslBaseCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        //levi stoplec podatkov
        $xpath = $I->xPathNiz('select', 'glava-panel', 'dok');
        $I->selectOption($xpath, '180, DOBAVNICA');

        $I->izpolniInput('input', 'glava-panel', 'klient_text', '0441');
        $I->izpolniInput('input', 'glava-panel', 'prejemnik_text', '0441');

        $I->izpolniInput('input', 'glava-panel', 'datDog', $I->genRandStr('Dob_', 11));
        $xpath = $I->xpathNiz('input', 'glava-panel', 'datDog');
        $I->pressKey($xpath, \WebDriverKeys::TAB);

        $I->izpolniInput('input', 'glava-panel', 'valuta_text', '756');

        //desni stolpec podatkov

        $xpath = $I->xPathNiz('select', 'glava-panel', 'skladisce');
        $I->selectOption($xpath, '20, POLIZDELKI');

        $xpath = $I->xPathNiz('select', 'glava-panel', 'naslovKlienta');
        $I->selectOption($xpath, 'Privzeti naslov / ');

        $xpath = $I->xPathNiz('select', 'glava-panel', 'naslovPrejemnika');
        $I->canSeeElement($xpath);
        $I->selectOption($xpath, 'Privzeti naslov / Hauptstrasse 115');

        $xpath = $I->xPathNiz('select', 'glava-panel', 'jezik');
        $I->selectOption($xpath, 'Slovenski');

        $I->izpolniInput('input', 'glava-panel', 'kurz', '21,34');
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
        $I->izpolniInput('input', 'region-postavke', 'cenaValuta', '10,2');
        $I->izpolniInput('input', 'region-postavke', 'znesekValuta', '10,2');

        //desni stolpec
        //$I->izpolniInput('input', 'region-postavke', 'vezaNK_text', '14-574-1');
        //$I->izpolniInput('input', 'region-postavke', 'dobava_text', '6190000021');

        $I->gumb('region-postavke-toolbar', 'shrani', true);
        $I->waitForSporociloSuccess();
    }

    // tests
    public function testiranjeDodajanjaDobavnice(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja(DobavnicaPage::$URLDodaj);
    }

    public function testiranjePregledaDobavnice(AcceptanceTester $I)
    {
        $this->testiranjePregleda(DobavnicaPage::$URLPregled);
    }

    public function testiranjeUrejanjaDobavnice(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja(DobavnicaPage::$URLUredi);
    }

    public function testiranjeOdstranjevanjaDobavnice(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja(DobavnicaPage::$URL, DobavnicaPage::$URLPregled);
    }

}
