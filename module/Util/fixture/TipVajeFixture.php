<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 * Nalaganje Tipov Vaj
 *
 * @author rado
 */
class TipVajeFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {

        foreach ($this->getData() as $value) {
            $this->populateTipVaje($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param string $object
     * @param array $vals
     */
    public function populateTipVaje($manager, $v)
    {

        $tipvajeR = $manager->getRepository('Koledar\Entity\TipVaje');

        $o   = $tipvajeR->findBySifra($v[0]);
        $nov = false;
        if (!$o) {
            $o = new \Koledar\Entity\TipVaje();
            $o->setSifra(trim($v[0]));
            $nov=true;
        }
        $o->setIme($v[1]);
        $o->setOpis($v[2]);
        if ($nov) {
            $tipvajeR->create($o);
        } else {
            $tipvajeR->update($o);
        }

        $referenca = 'TipVaje-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['0001', 'prva vaja', 'prva vaja'],
            ['0002', 'tehnična vaja', 'tehnična vaja'],
            ['0003', 'lučna vaja', 'lučna vaja'],
            ['0004', 'kostumska vaja', 'kostumska vaja'],
            ['0005', 'foto vaja', 'foto vaja'],
            ['0006', '1. glavna vaja', '1. glavna vaja'],
            ['0007', '2. glavna vaja', '2. glavna vaja'],
            ['0008', '1. generalka', '1. generalka'],
            ['0009', '2. generalka', '2. generalka'],
            ['0010', 'odprta generalka', 'odprta generalka'],
            ['0011', 'obnovitvena vaja', 'obnovitvena vaja'],
            ['0012', 'pevska vaja', 'pevska vaja'],
            ['0013', 'postavitev scene', 'postavitev scene (za pripravo vaje)'],
            ['0014', 'postavitev luči', 'postavitev luči (za pripravo vaje)'],
        ];
    }

}
