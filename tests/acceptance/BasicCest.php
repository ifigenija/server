<?php

use \AcceptanceTester;

class BasicCest
{
    protected $ID;
    protected $nizZaIskanje;

    protected function zapolni(AcceptanceTester $I)
    {        
    }

    public function _before(AcceptanceTester $I)
    {        
    }

    public function _after(AcceptanceTester $I)
    {        
    }

    // tests
    protected function testiranjeDodajanja(AcceptanceTester $I, $url, $polje)
    {
        $I->loginAsAdmin();
        $I->gremNaStran($url);
        $I->pritisnemNaGumbVToolbaru('dodaj');
        $this->zapolni($I);
        $this->nizZaIskanje = $I->grabValueFrom($polje);
        $I->pritisnemNaGumbVToolbaru('shrani');
        $I->waitForSporociloSuccess();
        $this->ID = $I->pridobimID();
    }

    protected function testiranjePregleda(AcceptanceTester $I, $url)
    {
        $I->loginAsAdmin();
        $I->gremNaStran($url);
        $I->poiscemVnos($this->nizZaIskanje);
        $I->pritisnemNaLink('pregled', $this->ID);
        $I->dontSee('table[@class="xdebug-error xe-notice"]');
    }

    protected function testiranjeUrejanja(AcceptanceTester $I, $url, $polje)
    {
        $I->loginAsAdmin();
        $I->gremNaStran($url);
        $I->poiscemVnos($this->nizZaIskanje);
        $I->pritisnemNaLink('uredi', $this->ID);
        $this->zapolni($I);
        $this->nizZaIskanje = $I->grabValueFrom($polje);
        $I->pritisnemNaGumbVToolbaru('shrani');
        $I->waitForSporociloSuccess();
    }

    protected function testiranjeOdstranjevanja(AcceptanceTester $I, $url)
    {
        $I->loginAsAdmin();
        $I->gremNaStran($url);
        $I->poiscemVnos($this->nizZaIskanje);
        $I->pritisnemNaLink('brisi', $this->ID);
        $I->click('Potrdi brisanje');
        $I->waitForSporociloSuccess();
    }

}
