<?php

namespace IfiFixture;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

/**
 *
 * @author rado
 */
class UserFixture
        extends AbstractFixture
        implements FixtureInterface
{

    public function load(ObjectManager $manager)
    {
        foreach ($this->getData() as $value) {
            $this->populateUser($manager, $value);
        }

        $manager->flush();
    }

    /**
     *
     * @param \Tip\Repository\IzbirneOpcije $rep
     * @param string $object
     * @param array $vals
     */
    public function populateUser($manager, $v)
    {

        $rep     = $manager->getRepository('Aaa\Entity\User');
        
        $o = $rep->findOneByEmail(trim($v[1]));
        if (!$o) {
            $o = new \Aaa\Entity\User();
            $o->setEmail(trim($v[1]));
            $manager->persist($o);
        }

        $o->setName              ($v[2]);
        $o->setPassword          ($v[3]);
        $o->setEnabled           ($v[4]);
        if ($v[5]) {
            $date = empty($v[5]) ? null : date_create($v[5]);     // polje mora biti v php-jevi PHP-jevem datetime  tipu
            $o->setExpires           ($date);
        }
        $o->setDefaultRoute      ($v[6]);
        $o->setDefaultRouteParams($v[7]);

        $referenca = 'User-' . $v[0];
        var_dump($referenca);
        $this->addReference($referenca, $o);
    }

    public function getData()
    {
        return [
                    ['01','ivo@ifigenija.si',"testni uporabnik za inšpecienta","Ivo1234",true,null, "","",],
                    ['02','tona@ifigenija.si',"testni uporabnik za Tehničnega vodjo","Tona1234",true,null, "","",],
        ];
    }

}
