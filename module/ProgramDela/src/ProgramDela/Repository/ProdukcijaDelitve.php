<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Repository;

use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineModule\Paginator\Adapter\Selectable;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of ProdukcijaDelitve
 *
 * @author rado
 */
class ProdukcijaDelitve
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "id" => ["alias" => "p.id"]
        ],
        "vse"     => [
            "id" => ["alias" => "p.id"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
                $qb   = $this->getVseQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $vrKop = $e->like('p.vrstaKoproducenta', ':vrkop');

            $qb->andWhere($e->orX($vrKop));

            $qb->setParameter('vrkop', "{$options['q']}%", "string");
        }

        return $qb;
    }

    /**
     * 
     * @param type $object  entiteta
     * @param type $params
     */
    public function create($object, $params = null)
    {
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000610);

        $this->nastaviFlagMaticna($object);
        if ($object->getEnotaPrograma()) {
            $object->getEnotaPrograma()->getKoprodukcije()->add($object);
        }

        // preračunamo vrednosti v smeri navzgor
        $object->preracunaj(\Max\Consts::UP);

        parent::create($object, $params);
    }

    /**
     * 
     * @param type $object entiteta
     * @param type $params
     */
    public function update($object, $params = null)
    {
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000611);

        $this->nastaviFlagMaticna($object);

        // preračunamo vrednosti v smeri navzgor
        $object->preracunaj(\Max\Consts::UP);

        parent::update($object, $params);
    }

    private function nastaviFlagMaticna(\ProgramDela\Entity\ProdukcijaDelitev $object)
    {
        $em      = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');
        $optionR = $em->getRepository('App\Entity\Option');
        $option  = $optionR->findOneByName("application.tenant.maticnopodjetje");
        $sifra   = $option->getDefaultValue();      // šifra matičnega podjetja t.j. lastnega gledališča
        
        $this->expect($object->getKoproducent(), "Koproducent je obvezen podatek", 1000614);        
        if ($object->getKoproducent()->getSifra() == $sifra) {
            $object->setMaticniKop(TRUE);
        } else {
            $object->setMaticniKop(false);
        };
    }

    /**
     * 
     * @param type $object entiteta
     * @param type $params
     */
    public function delete($object)
    {
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000612);

        // $$ morda nastane težava, če uporabnik najprej spremeni enoto programa in sproži brisanje v istem koraku
        if ($object->getEnotaPrograma()) {
            /**
             * brisanje matične koprodukcije mogoče le, ko enota programa nima flaga za koprodukcije
             */
            $this->expect(!($object->getMaticniKop() && $object->getEnotaPrograma()->getImaKoprodukcije())
                    , "Enota programa ima nastavljen flag ima koprodukcije. Brisanje matične koprodukcije ni mogoče"
                    , 1000613);
            $object->getEnotaPrograma()->getKoprodukcije()->removeElement($object);
            $object->getEnotaPrograma()->preracunaj(\Max\Consts::UP);
        }

        parent::delete($object);
    }

    /**
     * vrne true, če je pripadajoči program dela zaklenjen
     * 
     * @param entiteta $obj
     * @return boolean
     */
    private function zaklenjenProgramDela($obj)
    {
        if ($obj) {
            if ($obj->getEnotaPrograma()) {
                // najdemo programDela:
                if (method_exists($obj->getEnotaPrograma(), 'getDokument')) {
                    $programDela = $obj->getEnotaPrograma()->getDokument();
                } elseif (method_exists($obj->getEnotaPrograma(), 'getProgramDela')) {
                    $programDela = $obj->getEnotaPrograma()->getProgramDela();      //za festival
                } else {
                    $this->expect(false, "Enota programa nima niti metode getDocument niti getProgramDela", 1000603);
                }

                if ($programDela) {
                    if ($programDela->getZakljuceno()) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

}
