<?php

/* 
 * Licenca GPL V3 or later
 *  
 */

$I = new AcceptanceTester($scenario);
$I->wantTo("Dodaj novo ponudbo");
$I->loginAsAdmin();



$I->amOnPage('/#t!aaa/Permission');
$I->waitForFragmentLoad();
$I->see('Dovoljenja');
$I->fillField('text', 'delete');
$I->click('Išči');
$I->waitForFragmentLoad();
$I->canSeeElement('td a i.icon-edit');


