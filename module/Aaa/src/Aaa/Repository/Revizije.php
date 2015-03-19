<?php

namespace Aaa\Repository;

class Revizije extends \Doctrine\ORM\EntityRepository {

    /**
     * Vrne seznam revizij po objectId, ki so starejše od beforeId
     * @param string $objectId
     * @param string $beforeId
     * @return array<Revizija>
     */
    public function findRevizije($objectId, $beforeId = null) {
        $qb = $this->getEntityManager()->createQueryBuilder();
        $qb->select('r');
        $qb->from('Aaa\Entity\Revizija', 'r');
        $qb->where('r.objectId = ?1');
        
        if ($beforeId !== null) {
            $qb->andWhere('r.id < ?2');
            $qb->setParameter(2, $beforeId);
        }
        
        $qb->orderBy('r.id', 'DESC');
        
        $qb->setParameter(1, $objectId);
        $qb->setMaxResults(10);
        return $qb->getQuery()->getResult();
    }
}