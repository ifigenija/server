<?php

namespace AaaFixture;

use Aaa\Entity\Permission;
use Aaa\Entity\Role;
use Aaa\Entity\User;
use App\Entity\Option;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\ORM\EntityManager;
use Zend\Config\Config;

/**
 * Nalaganje privzetih vlog, opcij dovoljenj in uporabnikov 
 * V load metodi je potrebno vključiti modul,
 * če želiš da se loadajo podatki iz modula 
 *
 * @author boris
 */
class RolesFixture
        extends AbstractFixture
        implements FixtureInterface
{

    protected $repo;

    public function load(ObjectManager $manager)
    {
        $modules = ['Aaa', 'App'];

        echo "Nalagam - opcije" . PHP_EOL;
        $res = $this->getData($modules, 'options');
        foreach ($res as $val) {
            $this->populateOptions($manager, $val);
        }
        $manager->flush();
        $manager->clear();

        echo "Nalagam - dovoljenja" . PHP_EOL;
        $res = $this->getData($modules, 'permissions');
        foreach ($res as $val) {
            $this->populatePermissions($manager, $val);
        }
        $manager->flush();
        $manager->clear();
        echo "Nalagam - vloge" . PHP_EOL;
        $res = $this->getData($modules, 'roles');
        foreach ($res as $val) {
            $this->populateRole($manager, $val);
        }
        $manager->flush();
        $manager->clear();

        echo "Nalagam - uporabnike" . PHP_EOL;
        $res = $this->getData($modules, 'users');
        foreach ($res as $val) {
            $this->populateUser($manager, $val);
        }
        $manager->flush();
        $manager->clear();
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
        $o = $ur->findOneByUsername($val['username']);
        if (!$o) {
            $o = new User;
            $o->setUsername($val['username']);
            $o->setEmail($val['email']);
            $password = uniqid() . uniqid();
            $o->setPassword($password);
            echo "User {$val['name']} geslo $password\n";
        $o->setName($val['name']);
            $o->setEnabled(true);
            $rr->resolveNames($o, $val['roles']);
            $em->persist($o);

            $this->addReference('user-' . $val['username'], $o);
        }
    }

    public function getData($modules, $entity)
    {
        $data = [];
        foreach ($modules as $module) {
            $f = 'module/' . $module . '/fixture/' . $entity . '.yml';
            if (file_exists($f)) {
                $file = file_get_contents($f);
                
                $data = array_merge($data, \Symfony\Component\Yaml\Yaml::parse($file));

                file_put_contents($f, \Symfony\Component\Yaml\Yaml::dump($data));
            }
        }
        return $data;
    }

    /**
     * Dodajanje skupin
     * @param string $val
     */
    public function populateOptions($em, $val)
    {
        

        $pr = $em->getRepository('App\Entity\Option');
        $o = $pr->findOneByName($val['name']);
        
        if (!$o) {
            $o = new Option();
            $em->persist($o);
        }
            
            $o->setName($val['name']);
            $o->setType($val['type']);
            $o->setDescription($val['description']);
            $o->setReadOnly(empty($val['readOnly']) ? false : $val['readOnly']);
            $o->setDefaultValue(empty($val['defaultValue']) ? null : $val['defaultValue']);
            $o->setPerUser(empty($val['perUser']) ? false: $val['perUser']);
            $o->setPublic(empty($val['public']) ? false: $val['public']);
            $o->setRole(empty($val['role']) ? null:$val['role'] );
            
    }

    public function populateRole($manager, $val)
    {

        $this->repo = $manager->getRepository('\Aaa\Entity\Role');
        $this->pr = $manager->getRepository('\Aaa\Entity\Permission');


        $o = $this->repo->findOneByName($val['name']);
        if (!$o) {
            $o = new Role;
            $o->setName($val['name']);
            $o->setDescription($val['description']);
            $o->setBuiltIn(true);
            if ($val['permissions']) {
                $this->pr->resolveNames($o, $val['permissions']);
            }
            $o->setBuiltIn(true);
            $manager->persist($o);
        }

        return false;
    }

    public function populatePermissions($manager, $valarray)
    {

        $this->pr = $manager->getRepository('\Aaa\Entity\Permission');


        $val = new Config($valarray);

        $o = $this->pr->findOneByName($val->name);
        if (!$o) {
            $o = new Permission();
            $o->setName($val->name);
            $o->setDescription($val->description);
        }
        $manager->persist($o);
        return false;
    }

}
