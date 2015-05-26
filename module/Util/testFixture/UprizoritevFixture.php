<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

/**
 *
 * @author rado
 */
class UprizoritevFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateUprizoritev($manager, $value);
        }

        $manager->flush();
    }

    // $$ morda bo še potrebno implementirati funkcijo getOrder()

    public function getDependencies()
    {
        return array('IfiFixture\BesediloFixture', 'IfiFixture\ProstorFixture'); // fixture classes fixture is dependent on 
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateUprizoritev($manager, $v)
    {

        $rep      = $manager->getRepository('Produkcija\Entity\Uprizoritev');
        $zvrUpriR = $manager->getRepository('Produkcija\Entity\ZvrstUprizoritve');
        $zvrSursR = $manager->getRepository('Produkcija\Entity\ZvrstSurs');

        $o = $rep->findOneByNaslov(trim($v[0]));
        if (!$o) {
            $o = new \Produkcija\Entity\Uprizoritev();
            $o->setNaslov(trim($v[0]));
            $manager->persist($o);
        }

        $o->setFaza($v[1]);
        $o->setPodnaslov($v[2]);
        $o->setDelovniNaslov($v[3]);

        $date = empty($v[4]) ? null : date_create($v[4]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setdatumZacStudija($date);

        $date = empty($v[5]) ? null : date_create($v[5]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setDatumPremiere($date);

        $getref = $this->getReference("Prostor-0001");
        $getref = $this->getReference($v[6]);
        $o->setMaticniOder(
//                $this->getReference($v[6])
                $getref
        );
        $o->setStOdmorov($v[7]);
        $o->setAvtor($v[8]);
        $o->setGostujoca($v[9]);
        $o->setTrajanje($v[10]);
        $o->setOpis($v[11]);
        $o->setArhIdent($v[12]);
        $o->setArhOpomba($v[13]);

        $date = empty($v[14]) ? null : date_create($v[14]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setDatumZakljucka($date);
        $o->setSloAvtor($v[15]);
        $o->setKratkiNaslov($v[16]);

        $getref = $this->getReference($v[17]);
        $o->setBesedilo(
                $getref
        );

        // ker ni v isti skupini fixtur-jev, ne deluje getReference
        $value = $zvrUpriR->findOneByIme($v[18]);
        $o->setZvrstUprizoritve($value);

        $value = $zvrSursR->findOneByIme($v[19]);
        $o->setZvrstSurs($value);

        $referenca = 'Uprizoritev-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['Sen kresne noči', 'produkcija', '', 'Sanje', '2016-02-01', '2016-06-01', 'Prostor-0005', 1, 'William Shakespeare', FALSE, 2, '', '', '', null, FALSE, '', 'Besedilo-0001', 'Komedija', 'Drama'],
            ['Smoletov vrt', 'predprodukcija-ideja', '', '', '2017-01-01', '2016-04-20', 'Prostor-0006', 2, 'B. Hočevar', FALSE, 2, '', '', '', null, FALSE, '', 'Besedilo-0003', 'Kriminalka', 'Raziskovalno gledališče'],
        ];
    }

}
