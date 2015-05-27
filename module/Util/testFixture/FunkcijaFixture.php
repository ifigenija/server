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

        $o->setPodrocje($v[1]);
        $o->setVelikost($v[2]);
        $o->setPomembna($v[3]);
        $o->setSort($v[4]);
        $o->setSePlanira($v[5]);
        $o->setDovoliPrekrivanje($v[6]);
        $getref = $this->getReference($v[7]);
        $o->setUprizoritev($getref);
        if ($v[8]) {
            $getref = $this->getReference($v[8]); 
            $o->setPrivzeti($getref); 
        }

        // ker ni v isti skupini fixtur-jev, ne deluje getReference
        $value = $tipFunR->findOneByIme($v[9]);
        $o->setTipFunkcije($value);

        $referenca = 'Funkcija-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['Hipolita', 'igralec', 'velika', TRUE, 9, true, true, 'Uprizoritev-Sen kresne noči', null, 'Igralec ali animator',],
            ['Tezej', 'igralec', 'velika', TRUE, 9, true, true, 'Uprizoritev-Sen kresne noči', null, 'Igralec ali animator',],
        ];
    }

}
