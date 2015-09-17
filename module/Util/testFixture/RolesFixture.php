<?php

namespace TestFixture;

use Aaa\Entity\Role;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 *
 * @author rado
 */
class RolesFixture
        extends AbstractFixture
        implements FixtureInterface
{

    use \Max\Expect\ExpectTrait;

    protected $repo;

    public function load(ObjectManager $manager)
    {
        echo "Nalagam - vloge" . PHP_EOL;
        $res = $this->getData('roles');
        foreach ($res as $val) {
            $this->populateRole($manager, $val);
        }
        $manager->flush();
        $manager->clear();
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

    public function populateRole($manager, $val)
    {
        $this->repo = $manager->getRepository('\Aaa\Entity\Role');
        $this->pr   = $manager->getRepository('\Aaa\Entity\Permission');

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

}
