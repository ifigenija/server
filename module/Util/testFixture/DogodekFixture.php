<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Koledar\Entity\Dogodek;

/**
 *
 * @author rado
 */
class DogodekFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateDogodek($manager, $value);
        }

        $manager->flush();
    }

    // $$ morda bo še potrebno implementirati funkcijo getOrder()

    public function getDependencies()
    {
        return array('TestFixture\VajaFixture', 'TestFixture\ProstorFixture'); // fixture classes fixture is dependent on , 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateDogodek($manager, $v)
    {

        $rep = $manager->getRepository('Koledar\Entity\Dogodek');

        $predstavaId  = $v[8] ? $this->getReference($v[8]) : null;
//        $zasedenostId = $v[9] ? $this->getReference($v[9]) : null;
        $vajaId       = $v[10] ? $this->getReference($v[10]) : null;
        $gostovanjeId = $v[11] ? $this->getReference($v[11]) : null;
        $splosniId    = $v[12] ? $this->getReference($v[12]) : null;
        $o            = $rep->findOneBy([
            "predstava"  => $predstavaId,
//            "zasedenost" => $zasedenostId,
            "vaja"       => $vajaId,
            "gostovanje" => $gostovanjeId,
            "splosni"    => $splosniId,
        ]);
        $nov          = false;
        if (!$o) {
            $o   = new \Koledar\Entity\Dogodek();
            $o->setPredstava($predstavaId);
//            $o->setZasedenost($zasedenostId);
            $o->setVaja($vajaId);
            $o->setGostovanje($gostovanjeId);
            $o->setSplosni($splosniId);
            $nov = true;
        }

        $date = empty($v[2]) ? null : date_create($v[2]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setZacetek($date);
        $date = empty($v[3]) ? null : date_create($v[3]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setKonec($date);

        $o->setStatus($v[4]);
        $o->setRazred($v[5]);
        $o->setTermin($v[6]);
        $o->setTitle($v[7]);

        if ($v[13]) {
            $getref = $this->getReference($v[13]);
            $o->setProstor($getref);
        }
        if ($v[14]) {
            $getref = $this->getReference($v[14]);
            $o->setSezona($getref);
        }
        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }

        $referenca = 'Dogodek-' . $v[0];
        //var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['01', "2012-05-16 10:00", "2012-05-20 10:00", "2015-06-26 12:00", '200s', "200s", "", "dogodek 1", NULL, NULL, 'Vaja-01', NULL, NULL, 'Prostor-0005', NULL,],
            ['02', "2012-06-03 10:00", "2012-06-04 10:00", "2015-06-27 12:00", '400s', "200s", "", "dogodek 2", NULL, NULL, 'Vaja-02', NULL, NULL, 'Prostor-0005', NULL,],
            // oddaja prostora, ni vezano na uprizoritev
            ['03', "2012-08-01 20:00", "2012-08-01 20:00", "2015-08-01 23:00", '400s', "200s", "", "dogodek 3", NULL, NULL, 'Vaja-03', NULL, NULL, 'Prostor-0002', NULL,],
            // status  še ni odobren (zaenkrat <500) $$
            ['04', "2012-08-01 20:00", "2012-08-01 20:00", "2015-08-01 23:00", '200s', "200s", "", "dogodek 4", NULL, NULL, 'Vaja-04', NULL, NULL, 'Prostor-0003', NULL,],
            // status odobren (zaenkrat >='500') $$
            ['05', "2012-08-01 20:00", "2012-08-01 20:00", "2015-08-01 23:00", '500s', "200s", "", "dogodek 5", NULL, NULL, 'Vaja-05', NULL, NULL, 'Prostor-0006', NULL,],
        ];
    }

}
