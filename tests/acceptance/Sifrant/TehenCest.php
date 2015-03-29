<?php

use \AcceptanceTester;

class TehenCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        $id = uniqid();
        $name = 'Tehen_' . $id;

        $I->fillToOneEditor(TehenPage::$klasifikacija, '0');
        $I->checkOption(TehenPage::$aktivna); //css
        $I->fillField(TehenPage::$maticnaSifra, $name);
        $I->fillField(TehenPage::$naziv, $name);
        $I->fillField(TehenPage::$pomozniNaziv, $name);
        $I->fillToOneEditor(TehenPage::$podKlasifikacija, '0');
        $I->fillField(TehenPage::$kratkiNaziv, $name);
        $I->selectOption(TehenPage::$skupina, 'Stružnice');
        $I->fillField(TehenPage::$proizvodnaLinija, $name);
        $I->fillField(TehenPage::$kvadratura, '5.6');
        $I->fillField(TehenPage::$procentZaPlaniranje, '5.6');
        $I->fillField(TehenPage::$prikljucnaMoc, '5.6');
        $I->fillField(TehenPage::$urnaPostavka, '5.6');
        $I->checkOption(TehenPage::$vIzpis); //css
        $I->checkOption(TehenPage::$nastavniList); //css
        $I->checkOption(TehenPage::$aktivnaAKT); //css
    }

    // tests
    public function testiranjeDodajanjaTehnoloskeEnote(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, TehenPage::$URL, TehenPage::$maticnaSifra);
    }

    public function testiranjePregledaTehnoloskeEnote(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, TehenPage::$URL);
    }

    public function testiranjeUrejanjaTehnoloskeEnote(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, TehenPage::$URL, TehenPage::$maticnaSifra);
    }

    public function testiranjeOdstranjevanjaTehnoloskeEnote(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, TehenPage::$URL);
    }

}
