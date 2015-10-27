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
class AvtorBesedilaFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateAvtorBesedila($manager, $value);
        }

        $manager->flush();
    }

    // $$ morda bo še potrebno implementirati funkcijo getOrder()

    public function getDependencies()
    {
        return array('TestFixture\BesediloFixture', 'TestFixture\OsebaFixture'); // fixture classes fixture is dependent on , 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateAvtorBesedila($manager, $v)
    {

        $rep = $manager->getRepository('Produkcija\Entity\AvtorBesedila');

        $besediloId = $this->getReference($v[4]);
        $osebaId    = $this->getReference($v[5]);
        $o          = $rep->findOneBy(["besedilo" => $besediloId, "oseba" => $osebaId]);
        $nov        = false;
        if (!$o) {
            $o   = new \Produkcija\Entity\AvtorBesedila();
            $o->setBesedilo($besediloId);
            $o->setOseba($osebaId);
            $nov = true;
        }
        $o->setTipAvtorja($v[1]);
        $o->setZaporedna($v[2]);
        $o->setAliVNaslovu($v[3]);

        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }



        $referenca = 'AvtorBesedila-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['01', 'aizv', 10, true, "Besedilo-0001", "Oseba-0014",],
            ['02', 'apri', 14, true, "Besedilo-0001", "Oseba-0015",],
            ['03', 'aizv', 11, true, "Besedilo-0002", "Oseba-0016",],
            ['04', 'aizv', 12, true, "Besedilo-0003", "Oseba-0017",],
            ['05', 'apri', 18, false, "Besedilo-0001", "Oseba-0018",],
        ];
    }

}
