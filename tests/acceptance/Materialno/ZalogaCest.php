<?php

use \AcceptanceTester;

class ZalogaCest
    extends BasicCest
{

    protected function dodajZalogo(AcceptanceTester $I, $sifra)
    {
        $I->fillToOneEditor(ZalogaPage::$artikel, $sifra);
        $I->click('Dodaj zalogo');
        $I->fillToOneEditor(ZalogaPage::$skladisce, '00');
        $I->selectOption(ZalogaPage::$status, 'Aktivni po prometu');
        $I->fillField(ZalogaPage::$zacSta, '200');
        $I->fillField(ZalogaPage::$zacCena, '1,34');
        $I->click('Shrani');
        $I->waitForSporociloSuccess();
    }

    // tests
    public function testiranjeDodajanjaZaloge(AcceptanceTester $I)
    {
        $I->loginAsAdmin();
        $I->gremNaStran(ZalogaPage::$URLDodaj);
        $this->dodajZalogo($I, '0004000001');
    }

    public function testiranjePregledaZaloge(AcceptanceTester $I)
    {
        $I->loginAsAdmin();
        $I->gremNaStran(ZalogaPage::$URLPregled);
        $I->dontSee('table[@class="xdebug-error xe-notice"]');
    }

    /* public function testiranjeUrejanjaZaloge(AcceptanceTester $I)
      {
      $I->loginAsAdmin();
      $I->gremNaStran(ZalogaPage::$URLDodaj);
      $this->dodajZalogo($I, '0004000001');
      } */

    public function testiranjeOdstranjevanjaZaloge(AcceptanceTester $I)
    {
        $I->loginAsAdmin();
        $I->gremNaStran(ZalogaPage::$URL);
        $I->click('Odstrani zalogo');
    }

}
