<?php

use \AcceptanceTester;

class PrevzemnicaCest
    extends MatPoslBaseCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        //levi stoplec podatkov
        $xpath = $I->xpathNiz('select', 'glava-panel', 'dok');
        $I->selectOption($xpath, '100, PREVZEMNICA');

        $I->izpolniInput('input', 'glava-panel', 'datDog', $I->genRandStr('Prv_', 11));
        $xpath = $I->xpathNiz('input', 'glava-panel', 'datDog');
        $I->pressKey($xpath, \WebDriverKeys::TAB);

        $xpath = $I->xpathNiz('select', 'glava-panel', 'skladisce');
        $I->selectOption($xpath, '20, POLIZDELKI');

        $I->izpolniInput('input', 'glava-panel', 'klient_text', '0492');

        //desni stolpec podatkov
        $I->izpolniInput('input', 'glava-panel', 'klientDok', $I->genRandStr('Prv_', 11));

        $I->izpolniInput('input', 'glava-panel', 'datumKd', $I->genRandStr('Prv_', 11));
        $xpath = $I->xpathNiz('input', 'glava-panel', 'datumKd');
        $I->pressKey($xpath, \WebDriverKeys::TAB);

        $I->izpolniInput('input', 'glava-panel', 'valuta_text', '036');
        $I->izpolniInput('input', 'glava-panel', 'kurz', '200,00');

        $xpath = $I->xpathNiz('select', 'glava-panel', 'jezik');
        $I->selectOption($xpath, 'Angleški');
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
        //$this->izpolniInput('postavke', 'vezaND_text', '20,3');
        $I->izpolniInput('input', 'region-postavke', 'rabatOds', '20,3');
        $I->izpolniInput('input', 'region-postavke', 'izjava', 'izjava');
        $I->izpolniInput('input', 'region-postavke', 'proforma', '2,56');
        $I->izpolniInput('input', 'region-postavke', 'poreklo', 'poreklo');
        $I->izpolniInput('input', 'region-postavke', 'sarza', 'šarža');

        $I->gumb('region-postavke-toolbar', 'shrani', true);
        $I->waitForSporociloSuccess();
    }

    private function dodajStroske()
    {
        $I = $this->I;
        
        $I->gumb('region-stroski', 'dodaj', true);
        $I->gumb('region-stroski', 'prekliči', false);

        //levi stolpec
        $I->izpolniInput('input', 'region-stroski', 'storitev_text', '0004000001');
        $I->izpolniInput('input', 'region-stroski', 'klient_text', '0004000001');
        $I->izpolniInput('input', 'region-stroski', 'klientDok', '12345678');

        //desni stolpec
        $I->izpolniInput('input', 'region-stroski', 'znesek', '100,3');
        $I->izpolniInput('input', 'region-stroski', 'datumKd', '0004000001');

        $I->gumb('region-stroski', 'shrani', true);
        $I->waitForSporociloSuccess();
    }

    // tests
    public function testiranjeDodajanjaPrevzemnice(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja(PrevzemnicaPage::$URLDodaj);
        $this->dodajStroske();
    }

    public function testiranjePregledaPrevzemnice(AcceptanceTester $I)
    {
        $this->testiranjePregleda(PrevzemnicaPage::$URLPregled);
    }

    public function testiranjeUrejanjaPrevzemnice(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja(PrevzemnicaPage::$URLUredi);
    }

    public function testiranjeOdstranjevanjaPrevzemnice(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja(PrevzemnicaPage::$URL, PrevzemnicaPage::$URLPregled);
    }

}
