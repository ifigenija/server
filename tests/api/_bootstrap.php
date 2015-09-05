<?php

// Here you can initialize variables that will be available to your tests

        const UUID_RE = '/^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$/';

$db = $e->getSuite()->getModules()['Db'];

$cu = new ReflectionMethod($db, 'connect');
$cu->setAccessible(true);
$cu->invoke($db);
$cu = new ReflectionMethod($db, 'cleanup');
$cu->setAccessible(true);
$cu->invoke($db);
$po = new ReflectionMethod($db, 'loadDump');
$po->setAccessible(true);
$po->invoke($db);
