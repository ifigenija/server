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
class ProgramPremieraFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateProgramPremiera($manager, $value);
        }

        $manager->flush();
    }

    // $$ morda bo še potrebno implementirati funkcijo getOrder()

    public function getDependencies()
    {
        return array('TestFixture\UprizoritevFixture');
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateProgramPremiera($manager, $v)
    {

        $rep      = $manager->getRepository('ProgramDela\Entity\ProgramPremiera');
        $tipPrEnR = $manager->getRepository('ProgramDela\Entity\TipProgramskeEnote');

        $o = new \ProgramDela\Entity\ProgramPremiera();
        $manager->persist($o);

        $getref = $this->getReference($v[0]);
        $o->setUprizoritev($getref);

        $o->setCelotnaVrednost($v[1]);

        $value = $tipPrEnR->findOneBySifra($v[2]);
        $o->setTipProgramskeEnote($value);

        $o->setZaprosenProcent($v[3]);
        $o->setLastnaSredstva($v[4]);
        $o->setAvtorskiHonorarji($v[5]);
        $o->setTantieme($v[6]);
        $o->setAvtorskePravice($v[7]);
        $o->setDrugiJavni($v[8]);
        $o->setObiskDoma($v[9]);
        $o->setStZaposUmet($v[10]);
        $o->setStZaposDrug($v[11]);
        $o->setStHonorarnih($v[12]);
        $o->setStHonorarnihIgr($v[13]);
        $o->setStHonorarnihIgrTujJZ($v[14]);
        $o->setNasDelez($v[15]);

        $o->preracunaj();
        $o->validate();
        $referenca = 'ProgramPremiera-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['Uprizoritev-0001', 10000.80, '04', 40, 2222.3, 4000.4, 200.2, 200.3, 100.2, 40, 2, 2, 2, 2, 2, 9000.3,],
            ['Uprizoritev-0002', 5000, '05', 40, 1000.2, 600.7, 200.2, 200.2, 100.2, 60, 3, 3, 3, 3, 3, 4900.2,],
        ];
    }

}
