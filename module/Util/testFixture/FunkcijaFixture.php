<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

/**
 *
 * @author rado
 */
class FunkcijaFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateFunkcija($manager, $value);
        }

        $manager->flush();
    }

    // $$ morda bo še potrebno implementirati funkcijo getOrder()

    public function getDependencies()
    {
        return array('IfiFixture\UprizoritevFixture'); // fixture classes fixture is dependent on , $$ rb dodaj še AlternacijaFixture, ko bo
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateFunkcija($manager, $v)
    {

        $rep     = $manager->getRepository('Produkcija\Entity\Funkcija');
        $tipFunR = $manager->getRepository('Produkcija\Entity\TipFunkcije');

        $o = $rep->findOneByNaziv(trim($v[0]));
        if (!$o) {
            $o = new \Produkcija\Entity\Funkcija();
            $o->setNaziv(trim($v[0]));
            $manager->persist($o);
        }

        $o->setKomentar($v[1]);
        $o->setPodrocje($v[2]);
        $o->setVelikost($v[3]);
        $o->setPomembna($v[4]);
        $o->setSort($v[5]);
        $o->setSePlanira($v[6]);
        $o->setDovoliPrekrivanje($v[7]);
        $getref = $this->getReference($v[8]);
        $o->setUprizoritev($getref);
        if ($v[9]) {
            $getref = $this->getReference($v[9]);
            $o->setPrivzeti($getref);
        }

        // ker ni v isti skupini fixtur-jev, ne deluje getReference
        $value = $tipFunR->findOneByIme($v[10]);
        $o->setTipFunkcije($value);

        $referenca = 'Funkcija-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['Hipolita', 'glavna vloga', 'igralec', 'velika', TRUE, 6, true, true, 'Uprizoritev-0002', null, 'Igralec ali animator',],
            ['Tezej', 'glavna vloga', 'igralec', 'velika', TRUE, 5, true, true, 'Uprizoritev-0002', null, 'Igralec ali animator',],
            ['Režija', '', 'umetnik', 'velika', TRUE, 8, true, true, 'Uprizoritev-0002', null, 'Režiser',],
        ];
    }

}
