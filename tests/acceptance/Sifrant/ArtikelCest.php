<?php

use \AcceptanceTester;

class ArtikelCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        $id = uniqid();
        $name = 'Art_' . $id;

        //Osnovni podatki
        $I->fillToOneEditor(ArtikelPage::$klasifikacija, '0');
        $I->checkOption(ArtikelPage::$aktivna); //css
        $I->fillField(ArtikelPage::$maticnaSifra, $name);
        $I->fillField(ArtikelPage::$naziv, $name);
        $I->fillField(ArtikelPage::$pomozniNaziv, $name);

        //Lastnosti
        $I->checkOption(ArtikelPage::$VTakojsnjoPorabo); //css
        $I->checkOption(ArtikelPage::$crtnaKoda); //css
        
        //Podrobno
        $I->fillToOneEditor(ArtikelPage::$podKlasifikacija, '0');
        $I->selectOption(ArtikelPage::$tipMateriala, 'Material');
        $I->fillField(ArtikelPage::$enotaMere, $name);
        $I->selectOption(ArtikelPage::$status, 'Pilotna serija');
        $I->fillField(ArtikelPage::$teza, '10.5');
        $I->fillField(ArtikelPage::$carinskaTarifaStevilo, $name);
        $I->fillField(ArtikelPage::$standard, $name);
    }

    // tests
    public function testiranjeDodajanjaArtikla(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, ArtikelPage::$URL, ArtikelPage::$maticnaSifra);
    }

    public function testiranjePregledaArtikla(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, ArtikelPage::$URL);
    }

    public function testiranjeUrejanjaArtikla(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, ArtikelPage::$URL, ArtikelPage::$maticnaSifra);
    }

    public function testiranjeOdstranjevanjaArtikla(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, ArtikelPage::$URL);
    }

}
