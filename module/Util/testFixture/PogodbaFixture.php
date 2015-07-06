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
class PogodbaFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populatePogodba($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array( 'TestFixture\PopaFixture', 'TestFixture\OsebaFixture'); // fixture classes fixture is dependent on , 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populatePogodba($manager, $v)
    {

        $rep = $manager->getRepository('Produkcija\Entity\Pogodba');
//        $tipFunR = $manager->getRepository('Produkcija\Entity\TipFunkcije');

        $o = $rep->findOneBySifra(trim($v[0]));
        if (!$o) {
            $o = new \Produkcija\Entity\Pogodba();
            $o->setSifra(trim($v[0]));
            $manager->persist($o);
        }

        $o->setVrednostVaj($v[1]);
        $o->setVrednostPredstave($v[2]);
        $o->setVrednostUre($v[3]);
        $o->setAktivna($v[4]);
        $o->setOpis($v[5]);

        if ($v[6]) {
            $getref = $this->getReference($v[6]);
            $o->setOseba($getref);
        }

        if ($v[7]) {
            $getref = $this->getReference($v[7]);
            $o->setPopa($getref);
        }

        if ($v[8]) {
            $getref = $this->getReference($v[8]);
            $o->setTrr($getref);
        }

        $o->setVrednostDo($v[9]);

        $date = empty($v[10]) ? null : date_create($v[10]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setZacetek($date);
        $date = empty($v[11]) ? null : date_create($v[11]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setKonec($date);

        $o->setVrednostDoPremiere($v[12]);
        $o->setZaposlenVDrJz($v[13]);


        $referenca = 'Pogodba-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [

            ['0001', 10, 30, 10, true, "Pogodba o sodelovanju", 'Oseba-0001', null, null, 400, null, null, 400, true],
            ['0002', 11, 31, 11, true, "Pogodba za vlogo Helena", 'Oseba-0006', null, null, 401, null, null, 401, false],
            ['0003', 12, 32, 12, true, "Pogodba za lektoriranje", 'Oseba-0013', null, null, 402, null, null, 402, false],
        ];
    }

}
