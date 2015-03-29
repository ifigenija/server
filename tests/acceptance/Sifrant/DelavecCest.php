<?php

use \AcceptanceTester;

class DelavecCest extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        $id = uniqid();
        $name = 'Del_' . $id;

        $I->fillToOneEditor(DelavecPage::$klasifikacija, '0');
        $I->checkOption(DelavecPage::$aktivna); //css
        $I->fillField(DelavecPage::$maticnaSifra, $name);
        $I->fillField(DelavecPage::$naziv, $name);
        $I->fillField(DelavecPage::$pomozniNaziv, $name);
        $I->fillToOneEditor(DelavecPage::$podKlasifikacija, '0');
        $I->fillField(DelavecPage::$internaTelefonskaStevilka, $name);
        $I->fillToOneEditor(DelavecPage::$klasifikacijaDela, '0');
        $I->fillField(DelavecPage::$sifraVOD, $name);
        $I->checkOption(DelavecPage::$izpisemDelavca); //css
        $I->checkOption(DelavecPage::$aktiven); //css
    }

    // tests
    public function testiranjeDodajanjaDelavca(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, DelavecPage::$URL, DelavecPage::$maticnaSifra);
    }

    public function testiranjePregledaDelavca(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, DelavecPage::$URL);
    }

    public function testiranjeUrejanjaDelavca(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, DelavecPage::$URL, DelavecPage::$maticnaSifra);
    }

    public function testiranjeOdstranjevanjaDelavca(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, DelavecPage::$URL);
    }

}
