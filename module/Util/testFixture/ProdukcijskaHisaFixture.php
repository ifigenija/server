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
class ProdukcijskaHisaFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateProdukcijskaHisa($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('IfiFixture\PopaFixture');
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateProdukcijskaHisa($manager, $v)
    {

        $rep = $manager->getRepository('Produkcija\Entity\ProdukcijskaHisa');
//            'status' => 'zz',
//            'popa'   => $this->lookPopa1['id'],
//        


        $o = $rep->findOneBySifra(trim($v[0]));
        if (!$o) {
            $o = new \Produkcija\Entity\ProdukcijskaHisa();
            $o->setSifra(trim($v[0]));
            $manager->persist($o);
        }

        $o->setStatus($v[1]);
        $getref = $this->getReference($v[2]);
        $o->setPopa($getref);


        $referenca = 'ProdukcijskaHisa-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['0987', 'A', 'Popa-0987',],
            ['0989', 'A', 'Popa-0989',],
        ];
    }

}
