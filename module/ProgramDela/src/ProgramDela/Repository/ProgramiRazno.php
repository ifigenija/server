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
 * Description of ProgramiRazno
 *
 * @author rado
 */
class ProgramiRazno
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sort" => ["alias" => "p.sort"]
        ],
        "vse"     => [
            "sort" => ["alias" => "p.sort"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
                $qb = $this->getVseQb($options);
                $this->getSort($name, $qb);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $naz = $e->like('p.id', ':id');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('id', "{$options['q']}%", "string");
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
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000590);

        //$$ verjetno potrebna še kontrola, če dokument obstaja
        if ($object->getDokument()) {
            $object->getDokument()->getProgramiRazno()->add($object);
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
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000591);

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
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000592);

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
            if ($obj->getDokument()) {
                if ($obj->getDokument()->getZakljuceno()) {
                    return true;
                }
            }
        }
        return false;
    }

}
