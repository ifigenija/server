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

        echo "Nalagam - opcije" .PHP_EOL;
        $res = $this->getData($modules, 'options');
        foreach ($res as $val) {
            $this->populateOptions($manager, $val);
        }
        $manager->flush();

        echo "Nalagam - dovoljenja" .PHP_EOL;
        $res = $this->getData($modules, 'permissions');
        foreach ($res as $val) {
            $this->populatePermissions($manager, $val);
        }
        $manager->flush();
echo "Nalagam - vloge" .PHP_EOL;
        $res = $this->getData($modules, 'roles');
        foreach ($res as $val) {
            $this->populateRole($manager, $val);
        }
        $manager->flush();

        echo "Nalagam - uporabnike" .PHP_EOL;
        $res = $this->getData($modules, 'users');
        foreach ($res as $val) {
            $this->populateUser($manager, $val);
        }
        $manager->flush();
    }

    /**
     * Dodajanje skupin
     * @param EntityManager $em 
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
        foreach ($modules as $module) {
            $file = 'module/' . $module . '/fixture/' . $entity . '.data.php';
            if (file_exists($file)) {
                $data = array_merge($data, include $file);
            }
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
            $o = new Option();
            $o->setName($val->name);
            $o->setType($val->type);
            $o->setDescription($val->description);
            $o->setReadOnly($val->readOnly || false);
            if ($val->type === 'map') {
                $def = $val->defaultValue;
                if ($def) {
                    $def = $def->toArray();
                }
            } else {
                $def = $val;
            }
            $o->setDefaultValue($val->defaultValue);
            $o->setPerUser($val->perUser || false);
            $o->setPublic($val->public || false);
            $o->setRole($val->role);
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
