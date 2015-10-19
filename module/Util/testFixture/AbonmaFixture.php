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
class AbonmaFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateAbonma($manager, $value);
        }
        $manager->flush();
    }

    /**
     *
     * @param string $object
     * @param array $vals
     */
    public function populateAbonma($manager, $v)
    {

        $abonmaR = $manager->getRepository('Abonmaji\Entity\Abonma');

        $o = new \Abonmaji\Entity\Abonma();
        $o->setStPredstav($v[1]);
        $o->setStKuponov($v[2]);
        $o->setIme($v[3]);
        $o->setOpis($v[4]);
        $o->setKapaciteta($v[5]);
        $abonmaR->create($o);

        $referenca = 'Abonma-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['01', 10, 30, 'Otroci', 'Abonma za otroke', 200,],
            ['02', 20, 60, 'Mladina', 'Abonma za mladino', 400,],
            ['03', 15, 50, 'Odrasli', 'Abonma za odrasle', 300,],
        ];
    }

}
