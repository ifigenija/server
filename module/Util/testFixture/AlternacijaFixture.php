<?php

namespace TestFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Produkcija\Entity\Alternacija;

/**
 *
 * @author rado
 */
class AlternacijaFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateAlternacija($manager, $value);
        }

        $manager->flush();
    }

    public function getDependencies()
    {
        return array('TestFixture\FunkcijaFixture', 'TestFixture\OsebaFixture', 'TestFixture\ZaposlitevFixture', 'TestFixture\PogodbaFixture');
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateAlternacija($manager, $v)
    {

        $rep = $manager->getRepository('Produkcija\Entity\Alternacija');
//        $tipFunR = $manager->getRepository('Produkcija\Entity\TipFunkcije');

        $o   = $rep->findOneBySifra(trim($v[0]));
        $nov = false;
        if (!$o) {
            $o   = new Alternacija();
            $o->setSifra(trim($v[0]));
            $nov = true;
        }

        $o->setZaposlen($v[1]);

        $getref = $this->getReference($v[2]);
        $o->setFunkcija($getref);
        if ($v[3]) {
            // $$ še ni implementirano
            $getref = $this->getReference($v[3]);
            $o->setSodelovanje($getref);
        }

        $getref = $this->getReference($v[4]);
        $o->setOseba($getref);

        if ($v[5]) {
            $getref = $this->getReference($v[5]);
            $o->setKoprodukcija($getref);
        }

        $o->setSort($v[6]);
        $o->setImaPogodbo($v[7]);
        $o->setPomembna($v[8]);
        if ($v[9]) {
            $getref = $this->getReference($v[9]);
            $o->setPogodba($getref);
        }
        if ($v[10]) {
            $getref = $this->getReference($v[10]);
            $o->setZaposlitev($getref);
        }

        $date = empty($v[11]) ? null : date_create($v[11]);
        $o->setZacetek($date);
        $date = empty($v[12]) ? null : date_create($v[12]);
//        var_dump($date);
        $o->setKonec($date);

        $o->setPrivzeti($v[13]);

        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }

        $referenca = 'Alternacija-' . $v[0];
//        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
//            ['0001', false, 'Funkcija-Tezej', null, 'Oseba-0009', null,3, TRUE,True,'Pogodba-0001',],
            ['0001', false, 'Funkcija-Tezej', null, 'Oseba-0001', null, 3, TRUE, True, 'Pogodba-0001', null, null, null, true,],
            ['0002', true, 'Funkcija-Režija', null, 'Oseba-0010', null, 8, false, false, null, "Zaposlitev-0010", '2016-01-01', null, true,],
            ['0003', TRUE, 'Funkcija-Inšpicient', null, 'Oseba-0003', null, 2, false, false, null, "Zaposlitev-0003", null, '2016-01-19', true,],
            ['0004', TRUE, 'Funkcija-Tehnični vodja', null, 'Oseba-0002', null, 26, false, false, null, null, '2016-01-01', '2016-01-19', true],
            ['0005', TRUE, 'Funkcija-Razsvetljava', null, 'Oseba-0012', null, 7, false, false, null, null, '2016-01-01', '2016-01-01', true],
            ['0006', false, 'Funkcija-Helena', null, 'Oseba-0006', null, 1, true, true, 'Pogodba-0002', null, '2016-01-01', '2016-04-20', true],
            ['0007', true, 'Funkcija-Hipolita', null, 'Oseba-0008', null, 14, false, true, null, "Zaposlitev-0008", '2016-01-01', '2016-04-20', true],
            ['0008', false, 'Funkcija-Lektoriranje', null, 'Oseba-0013', null, 12, true, true, 'Pogodba-0003', null, '2016-01-01', '2016-04-20', true],
            ['0009', true, 'Funkcija-Hipolita', null, 'Oseba-0004', null, 15, false, true, null, "Zaposlitev-0004", '2016-01-01', null, true],
            ['0010', true, 'Funkcija-Hipolita', null, 'Oseba-0009', null, 16, false, true, null, "Zaposlitev-0009", null, '2017-04-20', false],
            ['0011', true, 'Funkcija-Hipolita', null, 'Oseba-0007', null, 17, false, true, null, "Zaposlitev-0007", '2017-01-01', null, false],
            ['0012', false, 'Funkcija-Avtor', null, 'Oseba-0010', null, 2, true, true, 'Pogodba-0004', null, null, null, true,],
            ['0013', true, 'Funkcija-u11_DN fja', null, 'Oseba-0013', null, 2, true, true, null, null, null, null, true,],
            ['0014', true, 'Funkcija-u11_DN fja', null, 'Oseba-0018', null, 2, true, true, null, null, null, null, false,],
            ['0015', true, 'Funkcija-u12_EN fja', null, 'Oseba-0003', null, 2, true, true, null, null, null, null, true,],
            ['0016', true, 'Funkcija-u12_EN fja', null, 'Oseba-0018', null, 2, true, true, null, null, null, null, false,],
            ['0017', true, 'Funkcija-u12_ND fja', null, 'Oseba-0018', null, 2, true, true, null, null, null, null, true,],
            ['0018', true, 'Funkcija-u12_ND fja', null, 'Oseba-0013', null, 2, true, true, null, null, null, null, false,],
            ['0019', true, 'Funkcija-u13_BN fja', null, 'Oseba-0008', null, 2, true, true, null, null, null, null, true,],
            ['0020', true, 'Funkcija-u13_BN fja', null, 'Oseba-0018', null, 2, true, true, null, null, null, null, false,],
            ['0021', true, 'Funkcija-u14_NB fja', null, 'Oseba-0018', null, 2, true, true, null, null, null, null, true,],
            ['0022', true, 'Funkcija-u14_NB fja', null, 'Oseba-0008', null, 2, true, true, null, null, null, null, false,],
            ['0023', true, 'Funkcija-u15_N fja', null, 'Oseba-0018', null, 2, true, true, null, null, null, null, true,],
            ['0024', true, 'Funkcija-u16_D_fja', null, 'Oseba-0013', null, 2, true, true, null, null, null, null, true,],
            ['0025', true, 'Funkcija-u17_DE_fja', null, 'Oseba-0013', null, 2, true, true, null, null, null, null, true,],
            ['0026', true, 'Funkcija-u17_DE_fja', null, 'Oseba-0003', null, 2, true, true, null, null, null, null, false,],
            ['0027', true, 'Funkcija-u18_NN_fja', null, 'Oseba-0016', null, 2, true, true, null, null, null, null, true,],
            ['0028', true, 'Funkcija-u18_NN_fja', null, 'Oseba-0014', null, 2, true, true, null, null, null, null, false,],
            ['0029', true, 'Funkcija-u18_DENN_fja', null, 'Oseba-0013', null, 1, true, true, null, null, null, null, true,],
            ['0030', true, 'Funkcija-u18_DENN_fja', null, 'Oseba-0003', null, 2, true, true, null, null, null, null, false,],
            ['0031', true, 'Funkcija-u18_DENN_fja', null, 'Oseba-0014', null, 3, true, true, null, null, null, null, false,],
            ['0032', true, 'Funkcija-u18_DENN_fja', null, 'Oseba-0016', null, 4, true, true, null, null, null, null, false,],
            ['0033', true, 'Funkcija-u19_D_fja', null, 'Oseba-0013', null, 4, true, true, null, null, null, null, true,],
            ['0034', true, 'Funkcija-u19_EN_fja', null, 'Oseba-0003', null, 4, true, true, null, null, null, null, true,],
            ['0035', true, 'Funkcija-u19_EN_fja', null, 'Oseba-0018', null, 4, true, true, null, null, null, null, false,],
        ];
    }

}
