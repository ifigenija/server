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
class ZvrstSursFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {

        foreach ($this->getData() as $value) {
            $this->populateZvrstSurs($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateZvrstSurs($manager, $v)
    {

        $rep = $manager->getRepository('Produkcija\Entity\ZvrstSurs');

        $o = $rep->findOneByIme(trim($v[0]));
        if (!$o) {
            $o = new \Produkcija\Entity\ZvrstSurs();
            $o->setIme(trim($v[0]));
            $manager->persist($o);
        }

        $o->setNaziv($v[1]);
        
//        $referenca = 'ZvrstSurs-' . $v[0];
//        var_dump($referenca);
//        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['Drama', 'drama (SURS 01)'],
            ['Opera', 'opera (SURS 02)'],
            ['Balet', 'balet (SURS 03)'],
            ['Plesne prireditve', 'plesne prireditve (SURS 04)'],
            ['Lutkovno gledališče', 'lutkovno gledališče (SURS 05)'],
            ['Raziskovalno gledališče', 'raziskovalno gledališče (SURS 06)'],
            ['Drugo', 'drugo (SURS 07)'],
        ];
    }

}
