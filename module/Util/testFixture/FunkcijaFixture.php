<?php

namespace TestFixture;

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

    public function getDependencies()
    {
        return array('TestFixture\UprizoritevFixture'); // fixture classes fixture is dependent on , 
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

        $value = $tipFunR->findOneByIme($v[2]);
        $o->setTipFunkcije($value);

        if ($v[3]) {
            $o->setVodjaEkipe($v[3]);
        }
        $o->setVelikost($v[4]);
        $o->setPomembna($v[5]);
        $o->setSort($v[6]);
        $o->setSePlanira($v[7]);
        $o->setDovoliPrekrivanje($v[8]);

        if ($v[9]) {
            $getref = $this->getReference($v[9]);
            $o->setUprizoritev($getref);
        }

        // ker ni v isti skupini fixtur-jev, ne deluje getReference

        $o->validate();

        $referenca = 'Funkcija-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['Hipolita', 'glavna vloga', 'Vloga', false, 'velika', TRUE, 6, true, true, 'Uprizoritev-0002', null,],
            ['Tezej', 'glavna vloga', 'Vloga', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0002', null,],
            ['Režija', '', 'Režija', false, 'velika', TRUE, 8, true, true, 'Uprizoritev-0002', null,],
            ['Inšpicient', '', 'Inšpicient', true, '', TRUE, 8, true, true, 'Uprizoritev-0002', null,],
            ['Tehnični vodja', '', 'Tehnična podpora', true, '', TRUE, 8, true, true, 'Uprizoritev-0002', null,],
            ['Razsvetljava', '', 'Tehnična podpora', false, '', TRUE, 3, true, true, 'Uprizoritev-0002', null,],
            ['Helena', 'glavna vloga', 'Vloga', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0002', null,],
            ['Lektoriranje', '', 'Lektorstvo', false, '', TRUE, 22, true, true, 'Uprizoritev-0002', null,],
            ['Avtor', 'Avtor besedila', 'Avtor', false, '', TRUE, 2, true, FALSE, 'Uprizoritev-0002', null,],
        ];
    }

}
