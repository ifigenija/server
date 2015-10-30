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

        /**
         * $$ zaenkrat šifra še ni unique, -a bi morala biti
         */
        $o   = $rep->findOneBySifra(trim($v[0]));
        $nov = false;
        if (!$o) {
            $o   = new \Produkcija\Entity\Zaposlitev();
            $o->setSifra(trim($v[0]));
            $nov = true;
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

        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }

        $referenca = 'Zaposlitev-' . $v[0];
        //var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ["0010", "A", "2010-02-01T00:00:00+0100", null, 1, 2, "", true, false, false, TRUE, "Oseba-0010", "Mojster"],
            ["0003", "A", "2010-02-01T00:00:00+0100", null, 1, 2, "", true, false, false, TRUE, "Oseba-0003", "Igralec"],
            ["0008", "A", "2010-02-01T00:00:00+0100", null, 1, 2, "", true, false, false, TRUE, "Oseba-0008", "Natakar"],
            ["0004", "A", "2010-02-01T00:00:00+0100", null, 1, 2, "", true, false, false, TRUE, "Oseba-0004", "Mizar"],
            ["0009", "A", "2010-02-01T00:00:00+0100", null, 1, 2, "", true, false, false, TRUE, "Oseba-0009", "Šivilja"],
            ["0007", "A", "2010-02-01T00:00:00+0100", null, 1, 2, "", true, false, false, TRUE, "Oseba-0007", "Inšpicient"]
        ];
    }

}
    