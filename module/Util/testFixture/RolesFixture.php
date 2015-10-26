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
        $rep   = $manager->getRepository('\Aaa\Entity\Role');
        $permR = $manager->getRepository('\Aaa\Entity\Permission');

        $o   = $rep->findOneByName($val['name']);
        $nov = false;
        if (!$o) {
            $o   = new Role;
            $o->setName($val['name']);
            $o->setBuiltIn(true);
            $nov = true;
        }

        if ($o->getBuiltIn()) {
            $o->setDescription($val['description']);
            if ($val['permissions']) {
                $permR->azurirajNames($o, $val['permissions']);
            }
        }

        if ($nov) {
            $rep->create($o);
        } else {
            $rep->update($o);
        }
        return false;
    }

}
