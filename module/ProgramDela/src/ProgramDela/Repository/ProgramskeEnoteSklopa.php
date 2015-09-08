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
 * Description of ProgramDelai
 *
 * @author boris
 */
class ProgramskeEnoteSklopa
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "naslovPE" => ["alias" => "p.naslovPE"]
        ],
        "vse"     => [
            "naslovPE" => ["alias" => "p.naslovPE"]
        ],
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
                $qb   = $this->getVseQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $naslovPE = $e->like('p.naslovPE', ':naslovPE');

            $qb->andWhere($e->orX($naslovPE));

            $qb->setParameter('naslovPE', "{$options['q']}%", "string");
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
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000660);

        if ($object->getProgramRazno()) {
            $object->getProgramRazno()->getProgramskeEnoteSklopa()->add($object);
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
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000661);

        // preračunamo vrednosti v smeri navzgor
        $object->preracunaj(\Max\Consts::UP);

        parent::update($object, $params);
    }

    /**
     * 
     * @param type $object entiteta
     * @param type $params
     */
    public function delete($object)
    {
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000662);

        // $$ morda nastane težava, če uporabnik najprej spremeni enoto programa in sproži brisanje v istem koraku
        if ($object->getProgramRazno()) {
            $object->getProgramRazno()->getProgramskeEnoteSklopa()->removeElement($object);
            $object->getProgramRazno()->preracunaj(\Max\Consts::UP);
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
            if ($obj->getProgramRazno()) {
                // najdemo programDela:
                if (method_exists($obj->getProgramRazno(), 'getDokument')) {
                    $programDela = $obj->getProgramRazno()->getDokument();
                } elseif (method_exists($obj->getProgramRazno(), 'getProgramDela')) {
                    $programDela = $obj->getProgramRazno()->getProgramDela();      //za festival
                } else {
                    $this->expect(false, "Program gostovanje nima niti metode getDocument niti getProgramDela", 1000663);
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
