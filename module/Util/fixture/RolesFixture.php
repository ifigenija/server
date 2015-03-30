<?php

namespace AaaFixture;

use Aaa\Entity\Role;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Zend\Config\Config;

/**
 * Nalaganje privzetih vlog
 *
 * @author boris
 */
class IfiFixture
        extends AbstractFixture
        implements FixtureInterface, DependentFixtureInterface
{

    protected $repo;

    public function load(ObjectManager $manager)
    {
        

        $res = $this->getData($modules, 'Option');
        foreach ($res as $val) {
            $this->populateOptions($manager, $val);
        }
        $manager->flush();

        $res = $this->getData($modules, 'Role');
        foreach ($res as $val) {
            $this->populateRole($manager, $val);
        }
        $manager->flush();
    }
        $res = $this->getData($modules, 'Role');
        foreach ($res as $val) {
            $this->populateUser($manager, $val)) 
        }
        $manager->flush();
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
            echo "User $val->name geslo $val->password\n";
            $o->setName($val->name);
            $o->setSurname($val->surname);
            $o->setEnabled(true);           
            $o->setRoles($rr->resolveNames($val->roles));
            $em->persist($o);

            $this->addReference('user-' . $val->username, $o);
        }
    }
    

    public function getData($modules, $entity)
    {
        $data = [];
        $file = 'module/' . $module . '/fixture/*.data.php';
        if (file_exists('module/' . $module . '/fixture/*.data.php')) {
            $data = array_merge($data, include $file);
        }
        return $data;
    }

    /**
     * Dodajanje skupin
     * @param string $val
     */
    public function populateOptions($em, $valarray)
    {
        $val = new Config($valarray);
        $pr = $em->getRepository('\App\Entity\Option');
        $o = $pr->findOneByName($val->name);
        if (!$o) {
            $o = new \App\Entity\Option();
            $o->setName($val->name);
            $o->setDescription($val->description);
            $o->setBuiltIn($val->readOnly);
            $o->setReadOnly($val->readOnly);
            $o->setValue($val->value);
            $em->persist($o);
        }
    }

    public function populateRole($manager, $valarray)
    {

        $this->repo = $manager->getRepository('\Aaa\Entity\Role');
        $this->pr = $manager->getRepository('\Aaa\Entity\Permission');

        $val = new Config($valarray);
        $o = $this->repo->findOneByName($val->name);
        if (!$o) {
            $o = new Role;
            $o->setName($val->name);
            $o->setDescription($val->description);
            $o->setBuiltIn(true);
            if ($val->permissions) {
                $o->setPermissions($this->pr->resolveNames($val->permissions));
            }
            $o->setBuiltIn(true);
            return $o;
        }

        return false;
    }

    public function getDependencies()
    {
        
    }

}
