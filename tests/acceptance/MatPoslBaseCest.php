<?php

use \AcceptanceTester;

class MatPoslBaseCest
{
    protected $ID;
    protected $nizZaIskanje;
    protected $I;


    public function _before(AcceptanceTester $I)
    {
        $this->I = $I;
    }

    public function _after(AcceptanceTester $I)
    {
    }
    
    protected function zapolni(AcceptanceTester $I)
    {        
    }
    
    protected function dodajPostavke(AcceptanceTester $I)
    {        
    }    

    // tests
    protected function testiranjeDodajanja($URLDodaj)
    {
        $I = $this->I;
        
        $I->loginAsAdmin();
        $I->amOnPage($URLDodaj);
        $I->gumb('glava-panel', 'shrani', false);
        $this->zapolni($I);
        $I->gumb('glava-panel', 'shrani', true);
        $I->waitForSporociloSuccess();
        $this->ID = $I->pridobimID();
        $this->nizZaIskanje = $I->grabTextFrom('//dd[@class="stevilka-dokumenta"]');

        $this->dodajPostavke($I);
    }

    protected function testiranjePregleda($URLPregled)
    {
        $I = $this->I;
        
        $I->loginAsAdmin();
        $I->amOnPage($URLPregled . '/' . $this->ID);
        $I->gumb('tip-tab-toolbar', 'potrdi', false);
        $I->dontSee('table[@class="xdebug-error xe-notice"]');
    }

    protected function testiranjeUrejanja($URLUredi)
    {
        $I = $this->I;
        
        $I->loginAsAdmin();
        $I->amOnPage($URLUredi . '/' . $this->ID);
        $I->gumb('glava-panel', 'shrani', false);
        $this->zapolni($I);
        $this->dodajPostavke($I);
        $I->gumb('glava-panel', 'shrani', true);
        $I->waitForSporociloSuccess();
    }

    protected function testiranjeOdstranjevanja($URL, $URLPregled)
    {
        $I = $this->I;
        
        $this->testiranjePregleda($URLPregled);
        $I->gumb('tip-tab-toolbar', 'briši', true);
        $I->wait(2);
        $I->amOnPage($URL);
        $I->wait(2);
        $I->dontSee('a[href$="' . "/pregled/$this->ID" . '"]');
    }
}