<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\Collections\ArrayCollection;

/**
 *
 * @author rado
 */
class PredstavaFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populatePredstava($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\UprizoritevFixture', 'TestFixture\ProstorFixture'
            , 'TestFixture\OsebaFixture', 'TestFixture\SezonaFixture');
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populatePredstava($manager, $v)
    {

        $rep = $manager->getRepository('Koledar\Entity\Predstava');

        $uprizoritevId = $v[2] ? $this->getReference($v[2]) : null;
//        $o             = $rep->findOneBy([
//            "uprizoritev" => $uprizoritevId,
//            "zaporedna"   => $v[1],
//        ]);
        $o             = null;
        $nov           = false;
        if (!$o) {
            $o   = new \Koledar\Entity\Predstava();
//            $o->setZaporedna($v[1]);
            $o->setUprizoritev($uprizoritevId);
            $nov = true;
        }
        $o->setTitle($v[3]);
        $o->setStatus($v[4]);

        $date = empty($v[5]) ? null : date_create($v[5]);
        $o->setZacetek($date);

        $date = empty($v[6]) ? null : date_create($v[6]);
        $o->setKonec($date);

        $ref = $v[7] ? $this->getReference($v[7]) : null;
        $o->setProstor($ref);

        $ref = $v[8] ? $this->getReference($v[8]) : null;
//        $o->setSezona($ref);

        /*
         * many to many
         */
        $o->abonmaji = new ArrayCollection();
        foreach ($v[9] as $r) {
            $abonma = $this->getReference($r);
            $abonma->getPredstave()->add($o);
            $o->getAbonmaji()->add($abonma);
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


        $referenca    = 'Predstava-' . $v[0];
//        var_dump($referenca);
        $this->addReference($referenca, $o);
        $referencaDog = 'DogodekPre-' . $v[0];
        $this->addReference($referencaDog, $o->getDogodek());
    }

    public function getData()
    {
        return [
            ['01', 0, 'Uprizoritev-0002', 'Predstava 1.', '400s'
                , '2014-05-10T20:00:00+0200', '2014-05-10T23:00:00+0200', 'Prostor-0001', null, ['Abonma-01', 'Abonma-02'],],
            ['02', 0, 'Uprizoritev-0002', 'Predstava 2.', '200s'
                , '2014-05-11T20:00:00+0200', '2014-05-11T23:00:00+0200', 'Prostor-0002', null, ['Abonma-02', 'Abonma-03'],],
            ['03', 0, 'Uprizoritev-0002', 'Predstava 3.', '200s'
                , '2014-05-20T20:00:00+0200', '2014-05-20T23:00:00+0200', 'Prostor-0001', null, [],],
            ['04', 0, 'Uprizoritev-0002', 'Predstava 4.', '200s'            // neobstoječa sezona
                , '1995-05-20T20:00:00+0200', '1995-05-20T23:00:00+0200', 'Prostor-0001', null, [],],
            ['05', 0, 'Uprizoritev-0002', 'Predstava 5.', '200s'            // druga sezona
                , '2015-05-20T20:00:00+0200', '2015-05-20T23:00:00+0200', 'Prostor-0001', null, [],],
            ['06', 0, 'Uprizoritev-0002', 'Predstava 6.', '200s'            // druga sezona
                , '2015-05-25T20:00:00+0200', '2015-05-25T23:00:00+0200', 'Prostor-0001', null, [],],
            ['07', 0, 'Uprizoritev-0001', 'Predstava 7.', '200s'            // druga uprizoritev
                , '2014-05-15T20:00:00+0200', '2014-05-15T23:00:00+0200', 'Prostor-0001', null, [],],
            ['08', 0, 'Uprizoritev-0001', 'Predstava 8.', '200s'            // druga sezona, uprizoritev
                , '2015-05-18T20:00:00+0200', '2015-05-18T23:00:00+0200', 'Prostor-0001', null, [],],
            ['09', 0, 'Uprizoritev-0002', 'Predstava 9.', '200s'            // neobstoječa sezona
                , '1995-05-23T20:00:00+0200', '1995-05-23T23:00:00+0200', 'Prostor-0001', null, [],],
            ['10', 0, 'Uprizoritev-0001', 'Predstava 10.', '200s'            // neobstoječa sezona, durga uprizoritev
                , '1995-05-23T20:00:00+0200', '1995-05-23T23:00:00+0200', 'Prostor-0001', null, [],],
            ['11', 0, 'Uprizoritev-0002', 'Predstava 11.', '200s'            // druga sezona
                , '2015-05-02T20:00:00+0200', '2015-05-02T23:00:00+0200', 'Prostor-0001', null, [],],
            ['12', 0, 'Uprizoritev-0002', 'Predstava 12.', '200s'            // tretja sezona
                , '2016-05-02T20:00:00+0200', '2016-05-02T23:00:00+0200', 'Prostor-0001', null, [],],
            ['13', 0, 'Uprizoritev-0001', 'Predstava 13.', '200s'            // tretja sezona, druga uprizoritev
                , '2016-05-01T20:00:00+0200', '2016-05-01T23:00:00+0200', 'Prostor-0001', null, [],],
            ['14', 0, 'Uprizoritev-0001', 'Predstava 14.', '200s'            // druga sezona
                , '2015-05-23T20:00:00+0200', '2015-05-23T23:00:00+0200', 'Prostor-0001', null, [],],
        ];
    }

}
