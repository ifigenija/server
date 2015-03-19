<?php

namespace TipFixture;

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
class RolesFixture
    extends AbstractFixture
    implements FixtureInterface, DependentFixtureInterface
{

    protected $repo;

    public function load(ObjectManager $manager)
    {

        $res = include __DIR__ . '/data/roles.data.php';
        $this->repo = $manager->getRepository('\Aaa\Entity\Role');
        $this->pr = $manager->getRepository('\Aaa\Entity\Permission');

        foreach ($res as $val) {
            if ($o = $this->populateRole($val)) {
                $manager->persist($o);
            };
            $manager->flush();
        }
    }

    public function populateRole($valarray)
    {
        $val = new Config($valarray);
        $o = $this->repo->findOneByName($val->name);
        if (!$o) {
            $o = new Role;
            $o->setName($val->name);
            $o->setDescription($val->description);
            if ($val->children) {
                $o->setChildren($this->repo->resolveNames($val->children));
            }
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
        return [
            'TipFixture\PermissionFixture'
        ];
    }

}
