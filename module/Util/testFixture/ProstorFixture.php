<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 *
 * @author rado
 */
class ProstorFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateProstor($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateProstor($manager, $v)
    {

        $rep = $manager->getRepository('Prodaja\Entity\Prostor');

        $o = $rep->findOneBySifra(trim($v[0]));
        if (!$o) {
            $o = new \Prodaja\Entity\Prostor();
            $o->setSifra(trim($v[0]));
            $manager->persist($o);
        }
        $o->setNaziv($v[1]);
        $o->setJePrizorisce($v[2]);
        $o->setKapaciteta($v[3]);
        $o->setOpis($v[4]);
        $o->setSePlanira($v[5]);

        $referenca = 'Prostor-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['0001', 'Poskusna 1', false, 8, 'Poskusna učilnica v prvem', true],
            ['0002', 'Poskusna 3', false, 34, 'Poskusna učilnica v tretjem', false],
            ['0003', 'Kazinska', true, 84, 'Kazinska dvorana', true],
            ['0004', 'Mali oder', true, 24, 'Mali oder ', true],
            ['0005', 'Komorni oder', true, 150, 'Komorni oder', true],
            ['0006', 'Stara dvorana', true, 96, 'Stara dvorana ali dvorana Franceta Prešerna', true],
            ['0007', 'Velika dvorana', true, 160, 'Velika, glavna dvorana', true],
        ];
    }

}
