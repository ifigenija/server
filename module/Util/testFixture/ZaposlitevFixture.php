<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

/**
 *
 * Nalaganje TipFunkcije
 * @author rado
 */
class ZaposlitevFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateZaposlitev($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\OsebaFixture'); // fixture classes fixture is dependent on , 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateZaposlitev($manager, $v)
    {

        $rep = $manager->getRepository('Produkcija\Entity\Zaposlitev');

        $o = $rep->findOneBySifra(trim($v[0]));
        if (!$o) {
            $o = new \Produkcija\Entity\Zaposlitev();
            $o->setSifra(trim($v[0]));
            $manager->persist($o);
        }
        $o->setStatus($v[1]);
        $date = empty($v[2]) ? null : date_create($v[2]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setZacetek($date);
        $date = empty($v[3]) ? null : date_create($v[3]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setKonec($date);
        $o->setTip($v[4]);
        $o->setDelovnaObveza($v[5]);
        $o->setDelovnoMesto($v[12]);
        $o->setMalica($v[6]);
        $o->setIzmenskoDelo($v[7]);
        $o->setIndividualnaPogodba($v[8]);
        $o->setJeZaposlenVdrugemJz($v[9]);
        $o->setJeNastopajoci($v[10]);
        if ($v[11]) {
            $getref = $this->getReference($v[11]);
            $o->setOseba($getref);
        }

        $o->validate();

        $referenca = 'Zaposlitev-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ["01", "A", "2010-02-01T00:00:00+0100", null, 1, 2, "", true, false, false, TRUE, "Oseba-0010", "Mojster"],
            ["02", "A", "2010-02-01T00:00:00+0100", null, 1, 2, "", true, false, false, TRUE, "Oseba-0003", "Igralec"],
            ["03", "A", "2010-02-01T00:00:00+0100", null, 1, 2, "", true, false, false, TRUE, "Oseba-0008", "Natakar"],
            ["04", "A", "2010-02-01T00:00:00+0100", null, 1, 2, "", true, false, false, TRUE, "Oseba-0004", "Mizar"],
            ["05", "A", "2010-02-01T00:00:00+0100", null, 1, 2, "", true, false, false, TRUE, "Oseba-0009", "Šivilja"],
            ["06", "A", "2010-02-01T00:00:00+0100", null, 1, 2, "", true, false, false, TRUE, "Oseba-0007", "Inšpicient"]
        ];
    }

}
