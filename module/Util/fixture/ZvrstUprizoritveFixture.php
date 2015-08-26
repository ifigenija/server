<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 * Nalaganje privzetih zvrsti uprizoritve
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

        $o = $rep->findOneBySifra(trim($v[0]));
        if (!$o) {
            $o = new \Produkcija\Entity\ZvrstUprizoritve();
            $o->setSifra(trim($v[0]));
            $manager->persist($o);
        }

        $o->setNaziv($v[1]);
        $o->setOpis($v[2]);
    }

    public function getData()
    {
        return [
                // #1169 - naj bo prazno
//            ['01', 'Opera', 'opera'],
//            ['02', 'Opereta', 'opereta'],
//            ['03', 'Balet', 'balet'],
//            ['04', 'Plesne prireditve', 'plesne prireditve'],
//            ['05', 'Lutkovno gledališče', 'lutkovno gledališče'],
//            ['06', 'Raziskovalno gledališče', 'raziskovalno gledališče'],
//            ['07', 'Biografska drama', 'biografska drama'],
//            ['08', 'Komedija', 'komedija'],
//            ['09', 'Črna komedija', 'črna komedija'],
//            ['10', 'E-igra', 'E-igra'],
//            ['11', 'Kriminalka', 'kriminalka'],
//            ['12', 'Musical', 'musical'],
        ];
    }

}
