<?php

namespace AaaFixture;

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
class UsersFixture extends AbstractFixture implements FixtureInterface, DependentFixtureInterface
{   

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
            echo "User $val->name geslo $val->password\n";
            $o->setName($val->name);
            $o->setSurname($val->surname);
            $o->setEnabled(true);           
            $o->setRoles($rr->resolveNames($val->roles));
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
   }

    public function getDependencies()
    {
        return [
            'AaaFixture\RolesFixture'
        ];
    }

}
