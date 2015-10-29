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
class ProgramRaznoFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateProgramRazno($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\UprizoritevFixture');     // morda lahko tudi prazno?
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateProgramRazno($manager, $v)
    {

        $rep = $manager->getRepository('ProgramDela\Entity\ProgramRazno');

        $o              = $rep->findOneBy([
            "naziv"       => $v[1],
        ]);
        $nov            = false;
        if (!$o) {
            $o   = new \ProgramDela\Entity\ProgramRazno();
            $o->setNaziv($v[1]);
            $nov = true;
        }

        $o->setSort($v[2]);
        $o->setObiskDoma($v[3]);
        $o->setStZaposlenih($v[4]);
        $o->setStHonorarnihZun($v[5]);
        $o->setZaproseno($v[6]);
//        $o->setNasDelez($v[7]);
        $o->setLastnaSredstva($v[8]);
        $o->setDrugiJavni($v[9]);

        /**
         * pri create oz. update javi v repozitoriju, da ne more nekega servica poklicati
         */
        if ($nov) {
            $manager->persist($o);
        } 
        $o->preracunaj();
        $o->validate();
        
        $referenca = 'ProgramRazno-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['01', 'Urejanje portala', 10, 22, 5, 3, 0, 300.00, 200.11, 54.20,],
            ['02', 'Delavnice otroci', 8, 202, 5, 3, 0, 203.00, 100.22, 31.20,],
        ];
    }

}
