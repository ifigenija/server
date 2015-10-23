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

        $o   = $rep->findOneBySifra(trim($v[0]));
        $nov = false;
        if (!$o) {
            $o = new \Produkcija\Entity\ZvrstSurs();
            $o->setSifra(trim($v[0]));
            $nov=true;
        }

        $o->setNaziv($v[1]);
        $o->setOpis($v[2]);

        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }
    }

    public function getData()
    {
        return [
            ['01', 'Drama', 'drama (SURS 01)'],
            ['02', 'Opera', 'opera (SURS 02)'],
            ['03', 'Balet', 'balet (SURS 03)'],
            ['04', 'Plesne prireditve', 'plesne prireditve (SURS 04)'],
            ['05', 'Lutkovno gledališče', 'lutkovno gledališče (SURS 05)'],
            ['06', 'Raziskovalno gledališče', 'raziskovalno gledališče (SURS 06)'],
            ['07', 'Drugo', 'drugo (SURS 07)'],
        ];
    }

}
