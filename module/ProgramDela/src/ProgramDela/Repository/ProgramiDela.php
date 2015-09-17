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
class ProgramiDela
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "p.sifra"]
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.sifra"]
        ],
        "seznam"  => [
            "zacetek" => ["alias" => "p.zacetek"]
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
            case "seznam":
                $qb   = $this->getSeznamQb($options);
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

            $sifra = $e->like('p.sifra', ':sifra');

            $qb->andWhere($e->orX($sifra));

            $qb->setParameter('sifra', "{$options['q']}%", "string");
        }

        return $qb;
    }

    public function getSeznamQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {

            $znaziv = $e->like('p.naziv', ':naziv');

            $qb->andWhere($e->orX($naziv));

            $qb->setParameter('naziv', "{$options['q']}%", "string");
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
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000510);

        // zaenkrat ne računamo v globino (DOWN), ampak vedno le v smeri UP
        $object->preracunaj();

        if (empty($object->getSifra())) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');

            $object->setSifra($num->generate('programdela', new \DateTime()));
        }

        parent::create($object, $params);
    }

    /**
     * 
     * @param type $object entiteta
     * @param type $params
     */
    public function update($object, $params = null)
    {
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000511);

        // zaenkrat ne računamo v globino (DOWN), ampak vedno le v smeri UP
        $object->preracunaj();

        parent::update($object, $params);
    }

    /**
     * 
     * @param type $object entiteta
     * @param type $params
     */
    public function delete($object)
    {
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000512);

        parent::delete($object);
    }

    /**
     * vrne true, če je pripadajoči program dela zaklenjen
     * 
     * @param entiteta $programDela
     * @return boolean
     */
    private function zaklenjenProgramDela($programDela)
    {
        if ($programDela) {
            if ($programDela->getZakljuceno()) {
                return true;
            }
        }
        return false;
    }

}
