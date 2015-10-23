<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Service;

use Max\Service\AbstractMaxService;

/**
 * 
 * Ponuja vmesnik do podatkov o osebah
 * @author boris
 */
class OsebaService
        extends AbstractMaxService
{

    /**
     * Poišče podobne osebe glede na kriterije kot npr. enak priimek,
     *
     * @param array $oseba      oseba, za katero iščemo podobne osebe
     * @return array            hidriran seznam podobnih oseb
     * @throws \Max\Exception\UnauthException
     */
    public function podobneOsebe($oseba)
    {
        $podobneOsebe = [];

        $em = $this->serviceLocator->get("\Doctrine\ORM\EntityManager");

        $osebaR = $em->getRepository("App\Entity\Oseba");

        /**
         * najdi podobne osebe po kriterijih
         * 
         */
        $qb      = $osebaR->createQueryBuilder('p');
        $e       = $qb->expr();
        $priimek = $e->like('trim(lower(p.priimek))', ':priimek');
        $id      = $e->notLike('CAST(p.id AS uuid)', ':id');
//        $qb->setParameter('id', $oseba['id'], "string");
        $qb->setParameter('priimek', trim(mb_strtolower($oseba['priimek'])), "string");
//        $qb->andWhere($e->orX($id, $priimek));
        $qb->andWhere($e->orX($priimek));

        $podobneOsebe = $qb->getQuery()
                ->getResult();

        /**
         * samega sebe ne upošteva
         */
        if (!empty($oseba['id'])) {
            $istaOseba    = $osebaR->find($oseba['id']);
            $podobneOsebe = array_diff($podobneOsebe, array($istaOseba));
        }


        return $podobneOsebe;
    }

}
