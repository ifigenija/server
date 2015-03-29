<?php

use \AcceptanceTester;

class SifrantCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        $I->fillToOneEditor(MaticniSifrantPage::$klasifikacija, '0'); //xpath
        $I->checkOption(MaticniSifrantPage::$aktivna); //css
        $I->fillField(MaticniSifrantPage::$maticnaSifra, $I->genRandStr('Sfr_', 11));
        $I->fillField(MaticniSifrantPage::$naziv, $I->genRandStr('Sfr_', 11));
        $I->fillField(MaticniSifrantPage::$pomozniNaziv, $I->genRandStr('Sfr_', 11));
        $I->fillToOneEditor(MaticniSifrantPage::$podKlasifikacija, '0');
    }

    // tests
    public function testiranjeDodajanjaSifranta(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, MaticniSifrantPage::$URL, MaticniSifrantPage::$maticnaSifra);
    }

    public function testiranjePregledaSifranta(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, MaticniSifrantPage::$URL);
    }

    public function testiranjeUrejanjaSifranta(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, MaticniSifrantPage::$URL, MaticniSifrantPage::$maticnaSifra);
    }

    public function testiranjeOdstranjevanjaSifranta(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, MaticniSifrantPage::$URL);
    }

}
