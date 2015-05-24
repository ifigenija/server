<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Stevilcenje\Entity\Stevilcenje;
use Stevilcenje\Entity\StevilcenjeKonfig;
use Symfony\Component\Yaml\Yaml;

/**
 * Nalaganje privzetih številčenj dokumetov
 *
 * @author boris
 */
class StevilcenjeFixture
        extends AbstractFixture
        implements FixtureInterface
{

    /**
     *
     *
     * @param ObjectManager $manager
     */
    public function load(ObjectManager $manager)
    {

        $rep = $manager->getRepository('Stevilcenje\Entity\Stevilcenje');
        $stv = $rep->findOneBySifra('pri');

        if (!$stv) {
            $stv = new Stevilcenje();
            $stv->setSifra('pri');
            $stv->setNaziv('Privzeto številčenje po letih YYYY-N');
            $stv->setFormat('%l-%n');
            $stv->setDolzina(1);
            $stv->setZacetek(1);
            $stv->setGlobalno(false);
            $stv->setPoLetih(true);
            $manager->persist($stv);
        }
        $this->addReference('privzeto-stevilcenje', $stv);


        $obj = $rep->findOneBySifra('bcd');
        if (!$obj) {
            $obj = new Stevilcenje();
            $obj->setSifra('bcd');
            $obj->setNaziv('Globalno številčenje črtnih kod');
            $obj->setFormat('%n');
            $obj->setDolzina(9);
            $obj->setZacetek(1);
            $obj->setGlobalno(true);
            $obj->setPoLetih(false);
            $manager->persist($obj);
        }
        $this->addReference('barcode-stevilcenje', $obj);

        $obj = $rep->findOneBySifra('sif');
        if (!$obj) {
            $obj = new Stevilcenje();
            $obj->setSifra('sif');
            $obj->setNaziv('Številčenje šifrant');
            $obj->setFormat('%n');
            $obj->setDolzina(4);
            $obj->setZacetek(1000);
            $obj->setGlobalno(true);
            $obj->setPoLetih(false);
            $manager->persist($obj);
        }
        $this->addReference('sifre-stevilcenje', $obj);

        $obj = $rep->findOneBySifra('tmp');
        if (!$obj) {
            $obj = new Stevilcenje();
            $obj->setSifra('tmp');
            $obj->setNaziv('Globalno številčenje začasnih številk');
            $obj->setPrefix('tmp');
            $obj->setFormat('%l%n');
            $obj->setDolzina(5);
            $obj->setZacetek(1000);
            $obj->setGlobalno(true);
            $obj->setPoLetih(true);
            $manager->persist($obj);
        }
        $this->addReference('temp-stevilcenje', $obj);



        $manager->flush();

        $this->loadKonfig($manager);
    }

    /**
     * 
     * @param type $manager
     */
    public function loadKonfig($manager)
    {
        $res = $this->getData('stevilcenjekonfig');
        foreach ($res as $val) {
            $this->populateKonfig($manager, $val);
        }
        $manager->flush();
        $manager->clear();
    }

    public function populateKonfig($em, $val)
    {

        $sr = $em->getRepository('\Stevilcenje\Entity\Stevilcenje');
        $kr = $em->getRepository('\Stevilcenje\Entity\StevilcenjeKonfig');
        $o    = $kr->findOneByDok($val['dok']);
        $stev = $sr->findOneBySifra($val['stevilcenje']);
        
        if (!$o) {
            $o = new StevilcenjeKonfig();
            $o->setDok($val['dok']);
            $o->setStevilcenje($stev);
            $em->persist($o);
        }
    }

    public function getData($entity)
    {

        $pattern = 'module/*/fixture/' . $entity . '.yml';

        $files = glob($pattern);

        $data = [];
        foreach ($files as $f) {
            if (file_exists($f)) {
                $file = file_get_contents($f);

                $data = array_merge($data, Yaml::parse($file));
            }
        }
        return $data;
    }

}
