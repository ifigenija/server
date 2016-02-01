<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

/**
 *
 * @author rado
 */
class TerminStoritveFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateTerminStoritve($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\DogodekFixture', 'TestFixture\PredstavaFixture', 'TestFixture\AlternacijaFixture', 'TestFixture\OsebaFixture'); // fixture classes fixture is dependent on , 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateTerminStoritve($manager, $v)
    {

        $rep = $manager->getRepository('Prisotnost\Entity\TerminStoritve');

        $dogodek         = $v[6] ? $this->getReference($v[6]) : null;
        $alternacija     = $v[7] ? $this->getReference($v[7]) : null;
        $oseba           = $v[8] ? $this->getReference($v[8]) : null;
        $planiranZacetek = empty($v[1]) ? null : date_create($v[1]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o               = $rep->findOneBy([
            "dogodek"         => $dogodek,
            "alternacija"     => $alternacija,
            "oseba"           => $oseba,
            "planiranZacetek" => $planiranZacetek,
        ]);
        $nov             = false;
        if (!$o) {
            $o   = new \Prisotnost\Entity\TerminStoritve();
            $o->setDogodek($dogodek);
            $o->setAlternacija($alternacija);
            $o->setOseba($oseba);
            $o->setPlaniranZacetek($planiranZacetek);
            $nov = true;
        }

        $date = empty($v[2]) ? null : date_create($v[2]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setPlaniranKonec($date);
//        $date = empty($v[3]) ? null : date_create($v[3]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
//        $o->setZacetek($date);
//        $date = empty($v[4]) ? null : date_create($v[4]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
//        $o->setKonec($date);
//        $o->setPlaniranoTraja($v[5]);
        $o->setDezurni($v[9]);
        $o->setGost($v[10]);
        $o->setSodelujoc($v[11]);
        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }
        /*
         * izjemoma rabimo flush zaradi kontrole TS pri gostovanju
         */
        $manager->flush();

        $referenca = 'TerminStoritve-' . $v[0];
//        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['01', "2015-06-26 10:00:00", "2015-06-26 11:00", null, null, 2, "Dogodek-01", "Alternacija-0001", "Oseba-0001", false, false, false,],
            ['02', "2015-06-26 10:00:00", "2015-06-26 11:00", null, null, 2, "Dogodek-01", "Alternacija-0002", "Oseba-0010", false, false, false,],
            ['03', "2015-06-26 10:00:00", "2015-06-26 11:00", null, null, 2, "Dogodek-01", "Alternacija-0003", "Oseba-0003", false, false, false,],
            ['04', "2015-06-26 10:00:00", "2015-06-26 11:00", null, null, 2, "Dogodek-01", "Alternacija-0004", "Oseba-0002", false, false, false,],
            ['05', "2015-06-26 10:00:00", "2015-06-26 11:00", null, null, 2, "Dogodek-01", "Alternacija-0005", "Oseba-0012", false, false, false,],
            // dezurni
            ['06', "2015-08-01 20:00:00", "2015-08-01 23:30", null, null, 2, "DogodekPre-01", null, "Oseba-0012", TRUE, false, false,],
            // gost
            ['07', "2015-08-01 20:00:00", "2015-08-01 23:30", null, null, 2, "Dogodek-03", null, "Oseba-0010", false, TRUE, false,],
            // gost
            ['08', "2015-08-01 20:00:00", "2015-08-01 23:30", null, null, 2, "Dogodek-01", null, "Oseba-0014", false, TRUE, false,],
            // ts v gostovanju
            ['09', '2015-03-10T07:00:00+0100', '2015-03-20T23:00:00+0100', null, null, 2, "DogodekGos-01", null, "Oseba-0001", false, false, true,],
            ['10', '2015-03-10T07:00:00+0100', '2015-03-20T23:00:00+0100', null, null, 2, "DogodekGos-01", null, "Oseba-0010", false, false, true,],
            ['11', '2015-03-10T07:00:00+0100', '2015-03-31T23:00:00+0100', null, null, 2, "DogodekGos-01", null, "Oseba-0004", false, false, true,],
            // termini storitve poddogodka
            ['12', '2015-03-15T20:00:00+0100', '2015-03-15-01T23:00:00+0100', null, null, 2, "DogodekPre-15", "Alternacija-0001", "Oseba-0001", false, false, false,],
            ['13', '2015-03-15T20:00:00+0100', '2015-03-15-01T23:00:00+0100', null, null, 2, "DogodekPre-15", "Alternacija-0002", "Oseba-0010", false, false, false,],
        ];
    }

}
