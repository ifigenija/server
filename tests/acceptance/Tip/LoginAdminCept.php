<?php 
$I = new AcceptanceTester($scenario);
$I->wantTo('login as admin');
$I->loginAsAdmin();
$I->waitForText('doma');
