<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Produkcija\Entity\Funkcija;

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
        $nov = false;
        if (!$o) {
            $o = new Funkcija();
            $o->setNaziv(trim($v[0]));
            $nov=true;
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

        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }

        $referenca = 'Funkcija-' . $v[0];
        //var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['Hipolita', 'glavna vloga', 'Vloga', false, 'velika', TRUE, 6, true, true, 'Uprizoritev-0002', null,],
            ['Tezej', 'glavna vloga', 'Vloga', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0002', null,],
            ['Režija', '', 'Režija', false, 'velika', TRUE, 8, true, true, 'Uprizoritev-0002', null,],
            ['Inšpicient', '', 'Inšpicient', true, '', TRUE, 8, true, true, 'Uprizoritev-0002', null,],
            ['Tehnični vodja', '', 'Tehnična in druga podpora', true, '', TRUE, 8, true, true, 'Uprizoritev-0002', null,],
            ['Razsvetljava', '', 'Tehnična in druga podpora', false, '', TRUE, 3, true, true, 'Uprizoritev-0002', null,],
            ['Helena', 'glavna vloga', 'Vloga', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0002', null,],
            ['Lektoriranje', '', 'Lektorstvo', false, '', TRUE, 22, true, true, 'Uprizoritev-0002', null,],
            ['Avtor', 'Avtor besedila', 'Avtor', false, '', TRUE, 2, true, FALSE, 'Uprizoritev-0002', null,],
            ['Konj', 'glavna vloga', 'Vloga', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0005', null,],
            ['Režiramo', '', 'Režija', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0005', null,],
            ['u11_DN fja', '', 'Režija', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0011', null,],
            ['u12_EN fja', '', 'Režija', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0012', null,],
            ['u12_ND fja', '', 'Režija', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0012', null,],
            ['u13_BN fja', '', 'Režija', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0013', null,],
            ['u14_NB fja', '', 'Režija', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0014', null,],
            ['u15_N fja', '', 'Režija', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0015', null,],
            ['u16_D_fja', '', 'Režija', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0016', null,],
            ['u17_DE_fja', '', 'Režija', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0017', null,],
            ['u18_NN_fja', '', 'Režija', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0018', null,],
            ['u18_DENN_fja', '', 'Režija', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0018', null,],
            ['u19_D_fja', '', 'Režija', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0019', null,],
            ['u19_EN_fja', '', 'Režija', false, 'velika', TRUE, 5, true, true, 'Uprizoritev-0019', null,],
        ];
    }

}
