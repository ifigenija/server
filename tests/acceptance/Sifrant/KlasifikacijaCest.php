<?php

use \AcceptanceTester;

class KlasifikacijaCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        //Osnovni podatki
        $I->fillToOneEditor(KlasifikacijaPage::$stars, '0');
        $I->fillField(KlasifikacijaPage::$sifra, $I->genRandStr('', 4)); // podvojen dela probleme omejeno na 4 znake
        $I->fillField(KlasifikacijaPage::$naziv, $I->genRandStr('Klas_', 11));
        $I->selectOption(KlasifikacijaPage::$tipMateriala, 'Material');
        $I->fillField(KlasifikacijaPage::$komercialniNaziv, $I->genRandStr('Klas_', 11) . $I->genRandStr('Klas_', 11));

        //Lastnosti
        $I->checkOption(KlasifikacijaPage::$vracilo); //css
        $I->checkOption(KlasifikacijaPage::$vIzdajo); //css
        $I->checkOption(KlasifikacijaPage::$rezalnoOrodje); //css

        //Podrobno
        $I->fillField(KlasifikacijaPage::$carinskaTarifaStevilo, $I->genRandStr('Klas_', 11));
        $I->fillField(KlasifikacijaPage::$sifraStopnjeDavka, $I->genRandStr('', 3));

        //Računovodstvo
        $I->fillField(KlasifikacijaPage::$konto, $I->genRandStr('', 6));
        $I->fillField(KlasifikacijaPage::$kontoNabave, $I->genRandStr('', 6));
        $I->fillField(KlasifikacijaPage::$kontoPorabe, $I->genRandStr('', 6));
    }

    // tests
    public function testiranjeDodajanjaKlasifikacija(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, KlasifikacijaPage::$URL, KlasifikacijaPage::$sifra);
    }

    public function testiranjePregledaKlasifikacija(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, KlasifikacijaPage::$URL);
    }

    public function testiranjeUrejanjaKlasifikacija(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, KlasifikacijaPage::$URL, KlasifikacijaPage::$sifra);
    }

    public function testiranjeOdstranjevanjaKlasifikacija(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, KlasifikacijaPage::$URL);
    }

}
