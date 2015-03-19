<?php

namespace TipFixture;

use Aaa\Entity\Group;
use Aaa\Entity\User;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Zend\Config\Config;

/**
 * Nalaganje privzetih skupin in uporabnikov
 *
 * @author boris
 */
class UsersGroupsFixture extends AbstractFixture implements FixtureInterface, DependentFixtureInterface
{

    /**
     * Dodajanje skupin     
     * @param \Doctrine\ORM\EntityManager $em 
     * @param array $valarray
     */
    public function populateGroup($em, $valarray)
    {
        $val = new Config($valarray);

        $re = $em->getRepository('\Aaa\Entity\Group');
        $o = $re->findOneByName($val->name);
        if (!$o) {
            $o = new Group();
            $o->setName($val->name);
            $o->setDescription($val->description);
            $em->persist($o);
        }

        // uporabniki
        $usr = $val->users;
        $r = $em->getRepository('\Aaa\Entity\User');
        foreach ($usr as $v) {
            $usrobj = $r->findOneByUsername($v);
            if ($usrobj) {
                $o->addUser($usrobj);
            } else {
                echo 'Ne najdem uporabnika ' . $v . PHP_EOL;
            }
        }
    }

    /**
     * Dodajanje skupin
     * @param \Doctrine\ORM\EntityManager $em 
     * @param array $valarray
     */
    public function populateUser($em, $valarray)
    {
        $val = new Config($valarray);
        $ur = $em->getRepository('\Aaa\Entity\User');
        $rr = $em->getRepository('\Aaa\Entity\Role');
        $o = $ur->findOneByUsername($val->username);
        if (!$o) {
            $o = new User;
            $o->setId($val->id);
            $o->setUsername($val->username);
            $o->setEmail($val->email);
            $o->setPassword($val->password);
            $o->setName($val->name);
            $o->setSurname($val->surname);
            $o->setEnabled(true);           
            $o->setHierRoles($rr->resolveNames($val->hierRoles));
            $em->persist($o);

            $this->addReference('user-' . $val->username, $o);
        }
    }

    function load(ObjectManager $manager)
    {
        $res = include __DIR__ . '/data/users.data.php';

        foreach ($res as $val) {
            $this->populateUser($manager, $val);
        }
        $manager->flush();

        $res = include __DIR__ . '/data/groups.data.php';
        foreach ($res as $val) {
            $this->populateGroup($manager, $val);
        }
        $manager->flush();
    }

    public function getDependencies()
    {
        return [
            'TipFixture\RolesFixture'
        ];
    }

}
