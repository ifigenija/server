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
        return array('TestFixture\PopaFixture');
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateProdukcijskaHisa($manager, $v)
    {

        $rep = $manager->getRepository('ProgramDela\Entity\ProdukcijskaHisa');
//            'status' => 'zz',
//            'popa'   => $this->lookPopa1['id'],
//        


        $o   = $rep->findOneBySifra(trim($v[0]));
        $nov = FALSE;
        if (!$o) {
            $o   = new \ProgramDela\Entity\ProdukcijskaHisa();
            $o->setSifra(trim($v[0]));
            $nov = true;
        }

        $o->setStatus($v[1]);
        $getref = $this->getReference($v[2]);
        $o->setPopa($getref);

        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }

        $referenca = 'ProdukcijskaHisa-' . $v[0];
        //var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            // 987 napolni že pri fixture-ju PopaMaticnoTest
            ['0987', 'AK', 'Popa-0987',],
            ['0989', 'AK', 'Popa-0989',],
            ['0986', 'AK', 'Popa-0986',],
            ['0984', 'AK', 'Popa-0984',],
            ['0983', 'AK', 'Popa-0983',],
            ['0982', 'AK', 'Popa-0982',],
        ];
    }

}
