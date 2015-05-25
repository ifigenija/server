<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 * Nalaganje privzetih zvrsti SURS
 *
 * @author lovro
 */
class ZvrstUprizoritveFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {

        foreach ($this->getData() as $value) {
            $this->populateZvrstUprizoritve($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateZvrstUprizoritve($manager, $v)
    {

        $rep = $manager->getRepository('Produkcija\Entity\ZvrstUprizoritve');

        $o = $rep->findOneByIme(trim($v[0]));
        if (!$o) {
            $o = new \Produkcija\Entity\ZvrstUprizoritve();
            $o->setIme(trim($v[0]));
            $manager->persist($o);
        }

        $o->setOpis($v[1]);
    }

    public function getData()
    {
        return [
            ['Opera', 'opera'],
            ['Opereta', 'opereta'],
            ['Balet', 'balet'],
            ['Plesne prireditve', 'plesne prireditve'],
            ['Lutkovno gledališče', 'lutkovno gledališče'],
            ['Raziskovalno gledališče', 'raziskovalno gledališče'],
            ['Biografska drama', 'biografska drama'],
            ['Komedija', 'komedija'],
            ['Črna komedija', 'črna komedija'],
            ['E-igra', 'E-igra'],
            ['Kriminalka', 'kriminalka'],
            ['Musical', 'musical'],
        ];
    }

}
