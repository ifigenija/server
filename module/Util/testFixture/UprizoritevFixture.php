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
        return array('TestFixture\BesediloFixture', 'TestFixture\ProstorFixture', 'TestFixture\ProdukcijskaHisaFixture','TestFixture\AvtorBesedilaFixture', );
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

        $o = $rep->findOneBySifra(trim($v[0]));
        if (!$o) {
            $o = new \Produkcija\Entity\Uprizoritev();
            $o->setSifra(trim($v[0]));
            $manager->persist($o);
        }

        $o->setNaslov($v[1]);
        $o->setFaza($v[2]);
        $o->setPodnaslov($v[3]);
        $o->setDelovniNaslov($v[4]);

        $date = empty($v[5]) ? null : date_create($v[5]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setDatumZacStudija($date);

        $date = empty($v[6]) ? null : date_create($v[6]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setDatumPremiere($date);

//        $getref = $this->getReference("Prostor-0001");
        $getref = $this->getReference($v[7]);
        $o->setMaticniOder(
                $getref
        );
        $o->setStOdmorov($v[8]);
//        $o->setAvtor($v[9]);
        $o->setGostujoca($v[10]);
        $o->setTrajanje($v[11]);
        $o->setOpis($v[12]);
        $o->setArhIdent($v[13]);
        $o->setArhOpomba($v[14]);

        $date = empty($v[15]) ? null : date_create($v[15]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
        $o->setDatumZakljucka($date);
        $o->setSloAvtor($v[16]);
        $o->setKratkiNaslov($v[17]);
        if ($v[18]) {
            $getref = $this->getReference($v[18]);
            $o->setBesedilo($getref);
        }

        // ker ni v isti skupini fixtur-jev, ne deluje getReference
        if ($v[19]) {
            $value = $zvrUpriR->findOneBySifra($v[19]);
            $o->setZvrstUprizoritve($value);
        }

        $value = $zvrSursR->findOneBySifra($v[20]);
        $o->setZvrstSurs($value);

        if ($v[21]) {
            $getref = $this->getReference($v[21]);
            $o->setProducent($getref);
        }

        $o->preracunaj();
        $o->validate();

        $referenca = 'Uprizoritev-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
            ['0001', 'Sen kresne noči', 'produkcija', '', 'Sanje', '2016-02-01', '2016-06-01', 'Prostor-0005', 1, 'William Shakespeare', FALSE, 2, '', '', '', null, FALSE, '', 'Besedilo-0001', null, '01', NULL],
            ['0002', 'Smoletov vrt', 'predprodukcija-ideja', '', '', '2016-01-01', '2016-04-20', 'Prostor-0006', 2, 'B. Hočevar', FALSE, 2, '', '', '', null, FALSE, '', 'Besedilo-0003', null, '06', NULL],
            ['0003', 'Kisli maček', 'postprodukcija', '', '', '2016-02-01', '2016-04-20', 'Prostor-0005', 2, 'Caryl Churchill', TRUE, 2, '', '', '', null, FALSE, '', null, null, '06', 'ProdukcijskaHisa-0987'],
            ['0004', 'Vladimir', 'postprodukcija', '', '', '2017-03-01', '2017-04-20', 'Prostor-0005', 2, 'Matjaž Zupančič', TRUE, 2, '', '', '', null, FALSE, '', null, null, '06', 'ProdukcijskaHisa-0987'],
            ['0005', 'Španska princesa', 'postprodukcija', '', '', '2017-04-01', '2017-05-20', 'Prostor-0001', 1, 'Nina Kokelj', false, 1, '', '', '', null, FALSE, '', null, null, '06', 'ProdukcijskaHisa-0987'],
            /**
             * ena brez datumov
             */
            ['0006', 'Ne vemo datumov', 'postprodukcija', '', '', NULL, NULL, 'Prostor-0001', 1, 'Nandi Frafar', false, 1, '', '', '', null, FALSE, '', null, null, '06', 'ProdukcijskaHisa-0987'],
        ];
    }

}
