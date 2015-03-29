<?php

$I = new AcceptanceTester($scenario);
$I->wantTo('Test close active tab');
$I->loginAsAdmin();
$I->waitForText('Domov');

$I->closeActiveTab();

$I->amOnPage('#pp');
$I->waitForAjax();

$I->selectTab('Domov');
$I->selectTab('PP');
$I->selectTab('Domov');
$I->closeActiveTab();






