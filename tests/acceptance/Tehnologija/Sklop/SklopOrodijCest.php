<?php

use \AcceptanceTester;

class SklopOrodijCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        $id = uniqid();
        $name = 'Skor_' . $id;

        //osnovni podatki
        $I->fillToOneEditor(SklopOrodijPage::$klasifikacija, '0');
        $I->checkOption(SklopOrodijPage::$aktivna); //css
        $I->fillField(SklopOrodijPage::$maticnaSifra, $name);
        $I->fillField(SklopOrodijPage::$naziv, $name);
        $I->fillField(SklopOrodijPage::$pomozniNaziv, $name);

        //Sklop
        $I->checkOption(SklopOrodijPage::$zaklenjen); //css
        $I->selectOption(SklopOrodijPage::$vrstaSklopa, 'Sklop obdelovalnega orodja');
    }

    // tests
    public function testiranjeDodajanjaSklopOrodij(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, SklopOrodijPage::$URL, SklopOrodijPage::$maticnaSifra);
    }

    public function testiranjePregledaSklopOrodij(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, SklopOrodijPage::$URL);
    }

    public function testiranjeUrejanjaSklopOrodij(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, SklopOrodijPage::$URL, SklopOrodijPage::$maticnaSifra);
    }

    public function testiranjeOdstranjevanjaSklopOrodij(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, SklopOrodijPage::$URL);
    }

}
