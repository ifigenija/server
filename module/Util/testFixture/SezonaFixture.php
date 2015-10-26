<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 * Nalaganje abonmajev
 *
 * @author rado
 */
class SezonaFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateSezona($manager, $value);
        }
        $manager->flush();
    }

    /**
     *
     * @param string $object
     * @param array $vals
     */
    public function populateSezona($manager, $v)
    {

        $sezonaR = $manager->getRepository('Koledar\Entity\Sezona');

        $o   = $sezonaR->findOneBySifra($v[0]);
        $nov = false;
        if (!$o) {
            $o   = new \Koledar\Entity\Sezona();
            $o->setSifra(trim($v[0]));
            $nov = true;
        }
        $o->setIme($v[1]);
        $date = empty($v[2]) ? null : date_create($v[2]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setZacetek($date);
        $date = empty($v[3]) ? null : date_create($v[3]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setKonec($date);
        $o->setAktivna($v[4]);
        if ($nov) {
            $sezonaR->create($o);
        } else {
            $sezonaR->update($o);
        }

        $referenca = 'Sezona-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['2015', 'Sezona 2015', '2015-01-01T00:00:00+0100', '2015-12-31T23:59:59+0100', true,],
            ['2016', 'Sezona 2016', '2016-01-01T00:00:01+0100', '2016-12-31T23:59:59+0100', true,],
            ['2017', 'Sezona 2017', '2017-01-01T00:00:00+0100', '2017-12-31T23:59:59+0100', true,],
        ];
    }

}
