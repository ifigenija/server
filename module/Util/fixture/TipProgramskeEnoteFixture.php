<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 * Nalaganje TipProgramskeEnote
 *
 * @author rado
 */
class TipProgramskeEnoteFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateTipProgramskeEnote($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateTipProgramskeEnote($manager, $v)
    {

        $rep = $manager->getRepository('ProgramDela\Entity\TipProgramskeEnote');

        $o   = $rep->findOneBySifra(trim($v[0]));
        $nov = false;
        if (!$o) {
            $o   = new \ProgramDela\Entity\TipProgramskeEnote();
            $o->setSifra(trim($v[0]));
            $nov = true;
        }

        $o->setNaziv($v[1]);
        $o->setKoprodukcija($v[2]);
        $o->setMaxFaktor($v[3]);
        $o->setMaxVsi($v[4]);
        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }
    }

    public function getData()
    {
        return [
            // tipi programske enote iz Program dela 2015:
            ['01', "Velika predstava", false, 1, 1,],
            ['02', "Mala predstava", false, 0.5, 0.5,],
            ['03', "Mala koprodukcija", true, 0.4, 1,],
            ['04', "Srednja koprodukcija", true, 0.7, 2,],
            ['05', "Velika koprodukcija", true, 1, 3,],
        ];
    }

}
