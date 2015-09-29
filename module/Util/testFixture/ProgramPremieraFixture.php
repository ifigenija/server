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

        $getref = $this->getReference($v[17]);
        $o->setUprizoritev($getref);

//        $o->setCelotnaVrednost($v[1]);

        $value = $tipPrEnR->findOneBySifra($v[2]);
        $o->setTipProgramskeEnote($value);

        $o->setZaproseno($v[3]);
        $o->setLastnaSredstva($v[4]);
        $o->setAvtorskiHonorarji($v[5]);
        $o->setAvtorskiHonorarjiSamoz($v[6]);
        $o->setTantieme($v[7]);
        $o->setAvtorskePravice($v[8]);
        $o->setDrugiJavni($v[9]);
        $o->setObiskDoma($v[10]);
        $o->setStZaposUmet($v[11]);
        $o->setStZaposDrug($v[12]);
        $o->setStHonorarnih($v[13]);
        $o->setStHonorarnihIgr($v[14]);
        $o->setStHonorarnihIgrTujJZ($v[15]);
        $o->setMaterialni($v[16]);

        $o->preracunaj();
        $o->validate();
        $referenca = 'ProgramPremiera-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['01', 10000.80, '04', 3600.12, 2222.3, 4000.4, 1000.4, 200.2, 200.3, 100.2, 40, 2, 2, 2, 2, 2, 4599.4,'Uprizoritev-0001',],
            ['02', 5000.000, '05', 1960.08, 1000.2, 600.70, 100.70, 200.2, 200.2, 100.2, 60, 3, 3, 3, 3, 3, 3899.1,'Uprizoritev-0002',],
            ['03', 5000.000, '04', 1960.08, 1000.2, 600.70, 100.70, 200.2, 200.2, 100.2, 60, 3, 3, 3, 3, 3, 3899.1,'Uprizoritev-0003',],
        ];
    }

}
