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
class VajaFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateVaja($manager, $value);
        }

        $manager->flush();
    }

    // $$ morda bo še potrebno implementirati funkcijo getOrder()

    public function getDependencies()
    {
        return array('TestFixture\ProstorFixture', 'TestFixture\UprizoritevFixture'); // fixture classes fixture is dependent on , $$ rb dodaj še AlternacijaFixture, ko bo
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateVaja($manager, $v)
    {

        $rep = $manager->getRepository('Koledar\Entity\Vaja');

        $uprizoritevId = $v[6] ? $this->getReference($v[6]) : null;
//        $o             = $rep->findOneBy([
//            "uprizoritev" => $uprizoritevId,
//        ]);
        $o             = null;
        $nov           = false;
        if (!$o) {
            $o   = new \Koledar\Entity\Vaja();
            $o->setUprizoritev($uprizoritevId);
            $nov = true;
        }
        $date = empty($v[1]) ? null : date_create($v[1]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setZacetek($date);
        $date = empty($v[2]) ? null : date_create($v[2]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setKonec($date);

        $o->setStatus($v[3]);
        $o->setTitle($v[4]);

        if ($v[5]) {
            $getref = $this->getReference($v[5]);
            $o->setProstor($getref);
        }


        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }

        /*
         * $$ sprotni flush potreben, da pravilno preračuna zaporedne številke
         */
        $manager->flush();


        $referenca = 'Vaja-' . $v[0];
        //var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['01', "2012-05-20 10:00", "2015-06-26 12:00", '200s', "Vaja 1.", 'Prostor-0005', 'Uprizoritev-0002',],
            ['02', "2012-06-04 10:00", "2015-06-27 12:00", '400s', "Vaja 2.", 'Prostor-0005', 'Uprizoritev-0002',],
            ['03', "2012-08-01 20:00", "2015-08-01 23:00", '400s', "Vaja 3.", 'Prostor-0002', 'Uprizoritev-0002',],
            // status  še ni potrjen (zaenkrat <500) 
            ['04', "2012-08-01 20:00", "2015-08-01 23:00", '200s', "Vaja 4.", 'Prostor-0003', 'Uprizoritev-0002',],
            // status potrjen (zaenkrat >='500')
            ['05', "2012-08-01 20:00", "2015-08-01 23:00", '500s', "Vaja 5.", 'Prostor-0006', 'Uprizoritev-0002',],
            // druga uprizoritev
            ['06', "2012-08-01 20:00", "2015-08-01 23:00", '400s', "Vaja 6.", 'Prostor-0002', 'Uprizoritev-0001',],
            // izven sezone
            ['07', "1995-08-01 20:00", "1995-08-01 23:00", '500s', "Vaja 7.", 'Prostor-0006', 'Uprizoritev-0002',],
            // izven sezone
            ['08', "1995-08-01 20:00", "1995-08-01 23:00", '500s', "Vaja 8.", 'Prostor-0006', 'Uprizoritev-0002',],
            // druga sezona
            ['09', "2014-06-04 10:00", "2014-06-27 12:00", '400s', "Vaja 9.", 'Prostor-0005', 'Uprizoritev-0002',],
        ];
    }

}
