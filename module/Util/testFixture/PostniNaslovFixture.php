<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

/**
 * Nalaganje privzetih Drzav
 *
 * @author boris
 */
class PostniNaslovFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {

        foreach ($this->getData() as $value) {
            $this->populatePostniNaslov($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\PopaFixture');     // morda lahko tudi prazno?
    }

    /**
     *
     * @param string $object
     * @param array $vals
     */
    public function populatePostniNaslov($manager, $v)
    {

        $rep     = $manager->getRepository('App\Entity\PostniNaslov');
        $drzavaR = $manager->getRepository('App\Entity\Drzava');

        $popaId  = $v[1] ? $this->getReference($v[1]) : null;
        $osebaId = $v[2] ? $this->getReference($v[2]) : null;
        $o       = $rep->findOneBy([
            "popa"  => $popaId,
            "oseba" => $osebaId,
            "naziv" => $v[3],
        ]);
        $nov     = false;
        if (!$o) {
            $o   = new \App\Entity\PostniNaslov();
            $o->setNaziv($v[3]);
            $o->setPopa($popaId);
            $o->setOseba($osebaId);
            $nov = true;
        }

        $o->setUlica($v[4]);
        $o->setUlicaDva($v[5]);
        $o->setPosta($v[6]);
        $o->setPostaNaziv($v[7]);
        $o->setPokrajina($v[8]);
        
        $drzava = $drzavaR->findOneBySifra(trim($v[9]));
        $o->setDrzava($drzava);

        $o->setJeeu($v[10]);
        $o->setPrivzeti($v[11]);
        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }

        $referenca = 'PostniNaslov-' . $v[0];
        //var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['001', 'Popa-0988', NULL, 'Narodni dom', 'Koroška 15', null, '9231', 'Beltinci', null, 'SI', false, true,],
            ['002', 'Popa-0988', NULL, 'Korotan', 'Koroška 22', null, '9231', 'Beltinci', null, 'SI', false, false,],
            ['003', 'Popa-0989', NULL, 'Rimljan', 'Rimska ploščad 7', null, '9231', 'Beltinci', null, 'SI', false, TRUE,],
        ];
    }

}
