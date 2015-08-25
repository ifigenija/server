<?php

/*
 * cli vmesnik za kreiranje matičnega gledališča
 */

namespace App\Controller;

/**
 * Description of Cli
 *
 * @author boris
 */
class CliController
        extends \Zend\Mvc\Controller\AbstractActionController
{

    /**
     * kreiranje matičnega gledališča
     */
    public function createMaticoAction()
    {
        $naziv = $this->params('naziv');
        if (!$naziv) {
            echo "Naziv ne sme biti prazen" . PHP_EOL;
            echo "Kreiranje matičnega gledališča ni mogoče" . PHP_EOL;
            throw new \Exception();
        }


        $em      = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");
        $popaR   = $em->getRepository('App\Entity\Popa');
        $phisaR  = $em->getRepository('ProgramDela\Entity\ProdukcijskaHisa');
        $drzavaR = $em->getRepository('App\Entity\Drzava');
        $drzava  = $drzavaR->findOneBySifra('SI');
        $optionR = $em->getRepository('App\Entity\Option');

        /**
         * preverimo ali matično že obstaja v opcijah
         */
        $optionMaticno = "application.tenant.maticnopodjetje";
        $option        = $optionR->findOneByName($optionMaticno);
        if ($option) {
            $sifra = $option->getDefaultValue();
            if (!$this->params('force')) {
                echo "Opcija " . $optionMaticno . " že obstaja z vrednostjo (šifro):" . $sifra . PHP_EOL;
                echo "Kreiranje matičnega gledališča ni mogoče" . PHP_EOL;
                throw new \Exception();
            }
        }

        /**
         * zapišemo matično podjetje v popa
         */
        $popa = new \App\Entity\Popa();
        $em->persist($popa);
        if (empty($popa->getSifra())) {
            $num   = $this->getServiceLocator()->get('stevilcenje.generator');
            $popa->setSifra($num->generate('popa'));
            $sifra = $popa->getSifra($popa);
        }
        $popa->setNaziv($naziv);
        $popa->setStaKli('AK');
        $popa->setDrzava($drzava);

        /**
         * ustvarimo opcijo za matično gledališče
         */
        if (!$option) {
            $option = new \App\Entity\Option();
            $em->persist($option);
        }
        $option->setName($optionMaticno);
        $option->setDefaultValue($sifra);
        $option->setType('string');
        $option->setReadOnly(TRUE);
        $option->setDescription('Šifra matičnega podjetja v Popa in ProdukcijskaHisa');

        /**
         * zapišemo matično podjetje v ProdukcijskaHisa
         */
        $phisa = $phisaR->findOneByPopa($popa);
        if (!$phisa) {
            $phisa = new \ProgramDela\Entity\ProdukcijskaHisa();
            $phisa->setPopa($popa);
            $em->persist($phisa);
        }
        $phisa->setSifra($sifra);
        $phisa->setStatus('AK');

        $em->flush();

        echo "Kreirano je matično gledališče " . $naziv . " s šifro " . $sifra . PHP_EOL;
    }

}
