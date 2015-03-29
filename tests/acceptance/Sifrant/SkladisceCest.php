<?php

use \AcceptanceTester;

class SkladisceCest
    extends BasicCest
{

    protected function zapolni(AcceptanceTester $I)
    {
        $I->fillField(SkladiscePage::$sifra, $I->genRandStr('', 2));
        $I->fillField(SkladiscePage::$naziv, $I->genRandStr('Skl_', 11));
        $I->selectOption(SkladiscePage::$tipMateriala, 'Material');
        $I->fillToOneEditor(SkladiscePage::$skladisceIzrabljenih, '00');
    }

    // tests
    public function testiranjeDodajanjaSkladisca(AcceptanceTester $I)
    {
        $this->testiranjeDodajanja($I, SkladiscePage::$URL, SkladiscePage::$sifra);
    }

    public function testiranjePregledaSkladisca(AcceptanceTester $I)
    {
        $this->testiranjePregleda($I, SkladiscePage::$URL);
    }

    public function testiranjeUrejanjaSkladisca(AcceptanceTester $I)
    {
        $this->testiranjeUrejanja($I, SkladiscePage::$URL, SkladiscePage::$sifra);
    }

    public function testiranjeOdstranjevanjaSkladisca(AcceptanceTester $I)
    {
        $this->testiranjeOdstranjevanja($I, SkladiscePage::$URL);
    }

}
