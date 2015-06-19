<?php

namespace TestFixture;

use Aaa\Entity\User;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\ORM\EntityManager;
use Zend\Config\Config;
use Max\Expect\ExpectTrait;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

/**
 *
 * @author rado
 */
class UserTestFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    use \Max\Expect\ExpectTrait;

    protected $repo;

    public function load(ObjectManager $manager)
    {
        echo "Nalagam - uporabnike" . PHP_EOL;
        $res = $this->getData('users');
        foreach ($res as $val) {
            $this->populateUser($manager, $val);
        }
        $manager->flush();
        $manager->clear();
    }
    public function getDependencies()
    {
        return array('TestFixture\RolesFixture');
    }

    
    public function getData($entity)
    {

        $pattern = 'module/*/testFixture/' . $entity . '.yml';

        $files = glob($pattern);

        $data = [];
        foreach ($files as $f) {
            if (file_exists($f)) {
                $file = file_get_contents($f);

                $data = array_merge($data, \Symfony\Component\Yaml\Yaml::parse($file));
            }
        }
        return $data;
    }
    
    /**
     * Dodajanje skupin
     * @param EntityManager $em 
     * @param array $valarray
     */
    public function populateUser($em, $val)
    {

        $ur = $em->getRepository('\Aaa\Entity\User');
        $rr = $em->getRepository('\Aaa\Entity\Role');
        $o  = $ur->findOneByEmail($val['email']);
        if (!$o) {
            $o        = new User();
            $o->setEmail($val['email']);
            $o->setPassword($val['password']);
            $o->setName($val['name']);
            $o->setEnabled($val['enabled']);
            $rr->resolveNames($o, $val['roles']);
            $em->persist($o);

            $this->addReference('User-' . $val['email'], $o);
        }
    }


}
