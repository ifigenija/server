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
 * Description of ProgramiPremiere
 *
 * @author rado
 */
class ProgramiPremiere
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

//    public function create($object, $params = null)
//    {
//        $this->validateProgramDela($object);
//
//        parent::create($object, $params);
//    }
//
//    public function update($object)
//    {
//        $this->validateProgramDela($object);
//        parent::update($object);
//    }
//
//    private function validateProgramDela(\ProgramDela\Entity\ProgramPremiera $object)
//    {
//        if ($object->getDokument()) {
//            $programdela = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default')
//                    ->getRepository('ProgramDela\Entity\ProgramDela')
//                    ->findOneById($object->getDokument()->getId());
//            $programdela->validate();
//        }
//    }

}
