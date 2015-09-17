<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;

/**
 * Description of ProgramDelai
 *
 * @author boris
 */
class DrugiViri
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "opis" => ["alias" => "p.opis"]
        ],
        "vse"     => [
            "opis" => ["alias" => "p.opis"]
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

            $opis = $e->like('p.opis', ':opis');

            $qb->andWhere($e->orX($opis));

            $qb->setParameter('opis', "{$options['q']}%", "string");
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
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000600);

        if ($object->getEnotaPrograma()) {
            $object->getEnotaPrograma()->getDrugiViri()->add($object);
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
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000601);

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
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000602);

        // $$ morda nastane težava, če uporabnik najprej spremeni enoto programa in sproži brisanje v istem koraku
        if ($object->getEnotaPrograma()) {
            $object->getEnotaPrograma()->getDrugiViri()->removeElement($object);
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
