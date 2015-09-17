<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Produkcija\Entity\Besedilo;

/**
 *
 * @author rado
 */
class BesediloFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateBesedilo($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateBesedilo($manager, $v)
    {

        $rep = $manager->getRepository('Produkcija\Entity\Besedilo');

        $o = $rep->findOneByStevilka(trim($v[0]));
        if (!$o) {
            $o = new Besedilo();
            $o->setStevilka(trim($v[0]));
            $manager->persist($o);
        }
        $o->setNaslov($v[1]);
//        $o->setAvtor($v[2]);
        $o->setPodnaslov($v[3]);
        $o->setJezik($v[4]);
        $o->setNaslovIzvirnika($v[5]);

        $date = empty($v[6]) ? null : date_create($v[6]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setDatumPrejema($date);
        $o->setMoskeVloge($v[7]);
        $o->setZenskeVloge($v[8]);
//        $o->setPrevajalec($v[9]);
        $o->setPovzetekVsebine($v[10]);

        $referenca = 'Besedilo-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
//            ['0001', 'Sen kresne noči', 'William Shakespeare', '', 'slovenščina', "A Midsummer Night's Dream", '2015-04-26', 5, 5, 'Milan Jesih', 'Nastopajo Titanija, Hipolita, Oberon, ...',],
            ['0001', 'Sen kresne noči', '', '', 'slovenščina', "A Midsummer Night's Dream", '2015-04-26', 5, 5, 'Milan Jesih', 'Nastopajo Titanija, Hipolita, Oberon, ...',],
//            ['0002', 'Bratje Karamazovi', 'Fjodor Mihajlovič Dostojevski', '', 'slovenščina', "Bratja Karamazjovji", '2015-12-04', 4, 1, 'Vladimir Levstik', 'Svetovna uspešnica',],
            ['0002', 'Bratje Karamazovi', '', '', 'slovenščina', "Bratja Karamazjovji", '2015-12-04', 4, 1, 'Vladimir Levstik', 'Svetovna uspešnica',],
//            ['0003', 'Smoletov Vrt', 'Berta Hočevar', '', 'slovenščina', "", '2015-05-26', 2, 8, '', '',],
            ['0003', 'Smoletov Vrt', '', '', 'slovenščina', "", '2015-05-26', 2, 8, '', '',],
        ];
    }

}
