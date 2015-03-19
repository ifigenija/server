<?php

namespace TipFixture;

use Aaa\Entity\Permission;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Zend\Config\Config;

/**
 * Nalaganje privzetih dovoljenj
 *
 * @author boris
 */
class PermissionFixture extends AbstractFixture implements FixtureInterface
{

    /**
     * Dodajanje skupin
     * @param string $val
     */
    public function populatePermission($em, $valarray)
    {
        $val = new Config($valarray);
        $pr = $em->getRepository('\Aaa\Entity\Permission');
        $o = $pr->findOneByName($val->name);
        if (!$o) {
            $o = new Permission;
            $o->setName($val->name);
            $o->setDescription($val->description);
            $o->setBuiltIn(true);
            $em->persist($o);
        }
    }

    function load(ObjectManager $manager)
    {
        
        $res = include __DIR__ . '/data/permission.data.php';
        foreach ($res as $val) {
            $this->populatePermission($manager, $val);
        }
        $manager->flush();
    }

}
