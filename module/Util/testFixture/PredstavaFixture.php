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
        $o             = $rep->findOneBy([
            "uprizoritev" => $uprizoritevId,
            "zaporedna"   => $v[1],
        ]);
        $nov           = false;
        if (!$o) {
            $o   = new \Koledar\Entity\Predstava();
            $o->setZaporedna($v[1]);
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

        $referenca    = 'Predstava-' . $v[0];
//        var_dump($referenca);
        $this->addReference($referenca, $o);
        $referencaDog = 'DogodekPre-' . $v[0];
        $this->addReference($referencaDog, $o->getDogodek());
    }

    public function getData()
    {
        return [
            ['01', 1, 'Uprizoritev-0002', 'Predstava 1', '400s', '2014-05-10T20:00:00+0200', '2014-05-10T23:00:00+0200', 'Prostor-0001', null, ['Abonma-01', 'Abonma-02'],],
            ['02', 2, 'Uprizoritev-0002', 'Predstava 2', '200s', '2014-05-11T20:00:00+0200', '2014-05-11T23:00:00+0200', 'Prostor-0002', null, ['Abonma-02', 'Abonma-03'],],
            ['03', 3, 'Uprizoritev-0002', 'Predstava 3', '200s', '2014-05-20T20:00:00+0200', '2014-05-20T23:00:00+0200', 'Prostor-0001', null, [],],
        ];
    }

}
