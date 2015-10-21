<?php

/**
 * Licenca GPLv3 or later
 */

namespace App\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of OrganizacijskeEnote
 *
 * @author lovro
 */
class OrganizacijskeEnote
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra"     => ["alias" => "p.sifra"],
            "ime"       => ["alias" => "p.ime"],
            "vodja"     => ["alias" => "p.vodja"],
            "namestnik" => ["alias" => "p.namestnik"]
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.sifra"]
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "vse":
            case "default":
                $qb   = $this->getDefaultQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    public function getDefaultQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naz = $e->like('p.sifra', ':sifra');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('sifra', "{$options['q']}%", "string");
        }
        if (!empty($options['q'])) {
            $naz = $e->like('p.ime', ':ime');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('ime', "{$options['q']}%", "string");
        }
        if (!empty($options['q'])) {
            $qb->leftJoin('p.vodja', 'vodja');
            $naz = $e->like('vodja.oseba', ':oseba');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('oseba', "{$options['q']}%", "string");
        }
        if (!empty($options['q'])) {
            $qb->leftJoin('p.namestnik', 'namestnik');
            $naz = $e->like('namestnik.oseba', ':oseba');
            $qb->andWhere($e->orX($naz));
            $qb->setParameter('oseba', "{$options['q']}%", "string");
        }

        if (!empty($options['parent'])) {
            $qb->join('p.parent', 'parent');
            $naz = $e->eq('parent.id', ':parent');
            $qb->andWhere($naz);
            $qb->setParameter('parent', $options['parent'], "string");
        }else {
            $parentNull=($e->isNull('p.parent'));
            $qb->andWhere($e->orX($parentNull));
        }
        
        return $qb;
    }
    
    /**
     * 
     * @param OrganizacijskaEnota $object
     * @param type $params
     */
    public function create($object, $params = null)
    {
        if (empty($object->getSifra())) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');
            $object->setSifra($num->generate('organizacijskaenota'));
        }
        parent::create($object, $params);
    }

}
