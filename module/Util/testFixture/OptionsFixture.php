<?php

namespace TestFixture;

use App\Entity\Option;
use App\Entity\OptionValue;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

/**
 *
 * @author rado
 */
class OptionsFixture
        extends AbstractFixture
        implements FixtureInterface
{

    use \Max\Expect\ExpectTrait;

    protected $repo;

    public function load(ObjectManager $manager)
    {
        // opcije je potrebno naložiti za uporabniki
        echo "Nalagam - opcije" . PHP_EOL;
        $res = $this->getData('options');
        foreach ($res as $val) {
            $this->populateOptions($manager, $val);
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

    /**
     * Dodajanje opcij
     * 
     * Vsebino yml datoteke ažurira v entitetah Option in OptionValue
     * 
     * @param type $em  entity manager
     * @param type $val Ena opcija iz yml datoteke
     */
    public function populateOptions($em, $val)
    {
        $optR     = $em->getRepository('App\Entity\Option');
        $o        = $optR->findOneByName($val['name']);
        $readOnly = (empty($val['readOnly']) ? false : $val['readOnly']);
        if (!$o) {
            $o = new Option();
            $em->persist($o);
            $o->setName($val['name']);
        } else {
            /**
             * spremembe naredimo le, če je readonly
             * 
             * $$ morda bi lahko v testnih fixturjih tudi ne readonly spremenili?
             */
            if (!$readOnly)
                return;
        }

        $o->setReadOnly($readOnly);
        $o->setType($val['type']);
        $o->setDescription($val['description']);
        $o->setDefaultValue(empty($val['defaultValue']) ? null : $val['defaultValue']);
        $o->setPerUser(empty($val['perUser']) ? false : $val['perUser']);
        $o->setPublic(empty($val['public']) ? false : $val['public']);
        $o->setRole(empty($val['role']) ? null : $val['role'] );

        /**
         *          če obstajajo globalne ali uporabniške vrednosti ažuriramo entiteto OptionValue:
         */
        if (!empty($val['optionValue'])) {
            echo " " . $val['name'] . '  ->  not empty Option Value ' . PHP_EOL;
            if (!empty($val['optionValue']['global'])) {
                echo "  global" . PHP_EOL;

                /**
                 *  ali obstaja globalna opcija ?
                 */
                $optValue = $em->getRepository('App\Entity\OptionValue')->getOptionValuesGlobalValue($o);

                // pričakujemo, da najde največ 1 globalno vrednost. 
                if (empty($optValue)) {
                    $optVal = new OptionValue();
                    $optVal->setValue($val['optionValue']['global']['value']);
                    $optVal->setGlobal(true);
                    $optVal->addOption($o);
                    $em->persist($optVal);
                }
                echo "     opt val: " .
                $val['optionValue']['global']['value'][0]['key'] . "  " .
                $val['optionValue']['global']['value'][0]['value'] .
                PHP_EOL;
            }

            /**
             * ali obstajajo uporabniške vrednosti 
             */
            if (!empty($val['optionValue']['user'])) {
                $optValueUserY = $val['optionValue']['user'];
                foreach ($optValueUserY as $user) {

                    echo "  user    " . $user['email'] . PHP_EOL;

                    // najprej preverim, če uporabniško ime že obstaja v entiteti User
                    $u        = $em->getRepository('Aaa\Entity\User')
                            ->findOneByemail($user['email']);
                    $this->expect($u, "Ni tega uporabnika", 1000300); // $$ rb potrebno še implementirati trnsl 
                    // ali obstajajo  opcije userja
                    $optValue = $em->getRepository('App\Entity\OptionValue')
                            ->getOptionValuesUserValue($o, $u);

                    if (empty($optValue)) {
                        $optVal = new OptionValue();
                        $optVal->setValue($user['value']);
                        $optVal->setGlobal(false);
                        $optVal->addOption($o);
                        $optVal->addUser($u);
                        $em->persist($optVal);  // ali je lahko več persistov pred flush-em?
                    }
                    echo "     opt val: " . $user['value'][0]['key'] . " " . $user['value'][0]['value'] . PHP_EOL;
                }
            }
        }
    }

}
