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

            case "vse":
                $qb   = $this->getVseQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
            case "default":
                $this->expect(!(empty($options['enotaPrograma']) ), "Enota programa je obvezna", 770061);
                $crit = new Criteria();
                $e    = $crit->expr();

                if (!empty($options['enotaPrograma'])) {
                    $enotaPrograma = $this->getEntityManager()->find('ProgramDela\Entity\EnotaPrograma', $options['enotaPrograma']);
                    $exp           = $e->eq('enotaPrograma', $enotaPrograma);
                }

                $crit->andWhere($exp);
                return new Selectable($this, $crit);
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
