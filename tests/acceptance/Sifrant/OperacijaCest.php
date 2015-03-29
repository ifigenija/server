<?php

use \AcceptanceTester;

class OperacijaCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        $id = uniqid();
        $name = 'Ope_' . $id;

        $I->fillToOneEditor(OperacijaPage::$klasifikacija, '0');
        $I->checkOption(OperacijaPage::$aktivna); //css
        $I->fillField(OperacijaPage::$maticnaSifra, $name);
        $I->fillField(OperacijaPage::$naziv, $name);
        $I->fillField(OperacijaPage::$pomozniNaziv, $name);
        $I->fillToOneEditor(OperacijaPage::$podKlasifikacija, '0');

        $I->fillField(OperacijaPage::$cenaNaUro, '10.2');
        $I->fillField(OperacijaPage::$cenaNaKomad, '2.3');
        $I->checkOption(OperacijaPage::$ris); //css
        $I->checkOption(OperacijaPage::$kk); //css
        $I->checkOption(OperacijaPage::$nsl); //css
        $I->checkOption(OperacijaPage::$ncp); //css
        $I->checkOption(OperacijaPage::$pakiranje); //css
    }

    // tests
    public function testiranjeDodajanjaOperacije(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, OperacijaPage::$URL, OperacijaPage::$maticnaSifra);
    }

    public function testiranjePregledaOperacije(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, OperacijaPage::$URL);
    }

    public function testiranjeUrejanjaOperacije(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, OperacijaPage::$URL, OperacijaPage::$maticnaSifra);
    }

    public function testiranjeOdstranjevanjaOperacije(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, OperacijaPage::$URL);
    }

}
