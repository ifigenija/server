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
class KontaktnaOsebaFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateKontaktnaOseba($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\OsebaFixture', 'TestFixture\PopaFixture'); // fixture classes fixture is dependent on 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateKontaktnaOseba($manager, $v)
    {

        $rep = $manager->getRepository('App\Entity\KontaktnaOseba');

        $popaId  = $v[3] ? $this->getReference($v[3]) : null;
        $osebaId = $v[4] ? $this->getReference($v[4]) : null;
        $o       = $rep->findOneBy(["popa" => $popaId, "oseba" => $osebaId]);
        $nov     = false;
        if (!$o) {
            $o   = new \App\Entity\KontaktnaOseba();
            $o->setPopa($popaId);
            $o->setOseba($osebaId);
            $nov = true;
        }
        $o->setStatus(trim($v[0]));
        $o->setFunkcija($v[1]);
        $o->setOpis($v[2]);
        $o->setOpis($v[5]);
        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }


        $referenca = 'KontaktnaOseba-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            [ 'AK', '', '', 'Popa-0988', 'Oseba-0009', 'igralka'],
        ];
    }

}
