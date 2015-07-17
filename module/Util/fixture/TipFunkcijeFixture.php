<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 * Nalaganje TipFunkcije
 *
 * @author rado
 */
class TipFunkcijeFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateTipFunkcije($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateTipFunkcije($manager, $v)
    {

        $rep = $manager->getRepository('Produkcija\Entity\TipFunkcije');

        $o = $rep->findOneByIme(trim($v[1]));
        if (!$o) {
            $o = new \Produkcija\Entity\TipFunkcije();
            $o->setIme(trim($v[1]));
            $manager->persist($o);
        }

        $o->setOpis($v[2]);
        $o->setImeZenski($v[3]);
        if ($v[4]) {
            $o->setPodrocje($v[4]);
        }
    }

    public function getData()
    {
        return [
             // najprej specialna tipa funkcije - se ne bo uporabljalo
//            ['Inšpicient', 'Inšpicienti', FALSE,  'Inšpicientka', null,],
//            ['Tehnični vodja', 'Tehnične vodje', false,  'Tehnični vodja', null,],
            // tipi funkcije iz SLOGI:
            ['01','Igralec ali animator', 'Igralci in animatorji',   'Igralka ali animatorka', 'igralec',],
            ['02','Baletnik ali plesalec', 'Baletniki in plesalci','Baletnica ali plesalka', 'igralec',],
            ['03','Avtor', 'Avtorji',  'Avtorka', 'umetnik',],
            ['04','Režiser', 'Režiserji',  'Režiserka', 'umetnik',],
            ['05','Scenograf', 'Scenografi', 'Scenografka', 'tehnik',],
            ['06','Kostumograf', 'Kostumografi',  'Kostumografinja', 'tehnik',],
            ['07','Oblikovalec maske', 'Oblikovalci maske',   'Oblikovalka maske', 'tehnik',],
            ['08','Avtor glasbe', 'Avtorji glasbe',   'Avtorica glasbe', 'umetnik',],
            ['09','Oblikovalec svetlobe', 'Oblikovalci svetlobe',   'Oblikovalka svetlobe', 'tehnik',],
            ['10','Koreograf', 'Koreografi',   'Koreografinja', 'umetnik',],
            ['11','Dramaturg', 'Dramaturgi',   'Dramaturginja', 'umetnik',],
            ['12','Lektor', 'Lektorji',   'Lektorica', 'umetnik',],
            ['13','Prevajalec', 'Prevajalci',   'Prevajalka', 'umetnik',],
            ['14','Oblikovalec videa', 'Oblikovalci videa',   'Oblikovalka videa', 'umetnik',],
            ['15','Intermedijski ustvarjalec', 'Intermedijski ustvarjalci',   'Intermedijska ustvarjalka', 'umetnik',],
            ['16','Nerazvrščeno', 'Nerazvrščeno',   'Nerazvrščeno', null,],
            ['17','Inšpicient', 'Inšpicienti',   'Inšpicientka', 'inspicient',],
            ['18','Šepetalec', 'Šepetalci',   'Šepetalka', 'sepetalec',],
            ['19','Tehnični vodja', 'Tehnične vodje',   'Tehnični vodja', 'tehnik',],
        ];
    }

}
