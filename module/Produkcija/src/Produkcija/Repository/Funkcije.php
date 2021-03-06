<?php

/*
 *  Licenca GPLv3
 */

namespace Produkcija\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;

/**
 * Description of Funkcije
 *
 * @author rado
 */
class Funkcije
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default"     => [
            "sort" => ["alias" => "p.sort"]
        ],
        "planbrezakt" => [
            "sort" => ["alias" => "p.sort"]
        ],
        "planirane" => [
            "sort" => ["alias" => "p.sort"]
        ],
        "vse"         => [
            "sort" => ["alias" => "p.sort"]
        ],
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "vse":
                $qb = $this->getVseQb($options);
                break;
            case "default":

                $this->expect(!empty($options['uprizoritev']), "Uprizoritev je obvezna", 1000670);
                $qb = $this->getDefaultQb($options);
                break;
            /**
             * planirane brez aktivnih alternacij
             */
            case "planbrezakt":
                $this->expect(!empty($options['uprizoritev']), "Uprizoritev je obvezna", 1000674);
                $this->expect(!empty($options['datum']), "Datum je obvezen", 1000678);
                $qb = $this->getPlanBrezAktAltQb($options);
                break;
            case "planirane":
                $this->expect(!empty($options['uprizoritev']), "Uprizoritev je obvezna", 1000674);
                $qb = $this->getPlaniraneQb($options);
                break;
            default:
                $this->expect(false, "Lista $name ne obstaja", 1000673);
        }
        $sort = $this->getSort($name);
        $qb->orderBy($sort->order, $sort->dir);

        return new DoctrinePaginator(new Paginator($qb));
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

    public function getDefaultQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['q'])) {
            $naz = $e->like('p.id', ':id');
            $qb->andWhere($e->orX($id));
            $qb->setParameter('id', "{$options['q']}%", "string");
        }
        if (!empty($options['uprizoritev'])) {
            $qb->join('p.uprizoritev', 'uprizoritev');
            $naz = $e->eq('uprizoritev.id', ':upriz');
            $qb->andWhere($naz);
            $qb->setParameter('upriz', "{$options['uprizoritev']}", "string");
        }
        if (!empty($options['podrocje'])) {
            $this->expect(is_array($options['podrocje']), "Parameter področje mora biti array", 1000671);
            $naz = $e->in('p.podrocje', ':podrocja');
            $qb->andWhere($naz);
            $qb->setParameter('podrocja', $options['podrocje']);
        }
        return $qb;
    }

    /**
     * vrne seznam planirajočih brez aktivnih alternacij
     * 
     * @param type $options
     * @return type
     */
    public function getPlaniraneQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();
        if (!empty($options['uprizoritev'])) {
            $qb->join('p.uprizoritev', 'uprizoritev');
            $naz = $e->eq('uprizoritev.id', ':upriz');
            $qb->andWhere($naz);
            $qb->setParameter('upriz', "{$options['uprizoritev']}", "string");
        }
        $qb->andWhere($e->in('p.sePlanira', [TRUE]));

        return $qb;
    }

    /**
     * vrne seznam planirajočih brez aktivnih alternacij
     * 
     * @param type $options
     * @return type
     */
    public function getPlanBrezAktAltQb($options)
    {
        $qb = $this->getPlaniraneQb($options);

        $stAktivnihAltQb = $this->_em->createQueryBuilder();
        $e               = $stAktivnihAltQb->expr();
        $stAktivnihAltQb->select('count(a)')
                ->from('Produkcija\Entity\Alternacija', 'a')
                ->where('a.funkcija=p.id');
        /*
         * ali je alternacija aktivna na določen datum
         */
        if (!empty($options['datum'])) {
            $datum = $options['datum'];
        } else {
            $datum = new \DateTime();     //danes - to je za vsak slučaj, čeprav se ne uporablja
        }
        $zazacetkom = $e->orX(
                $e->lte('a.zacetek', ':dat')
                , $e->isNull('a.zacetek')
        );
        $predkoncem = $e->orX(
                $e->gte('a.konec', ':dat')
                , $e->isNull('a.konec')
        );
        $stAktivnihAltQb->andWhere($zazacetkom);
        $stAktivnihAltQb->andWhere($predkoncem);

        $qb->andWhere("(" . $stAktivnihAltQb->getDQL() . ")=0");  // le funkcije brez aktivnih alternacij
        $qb->setParameter('dat', $datum, "date");

        return $qb;
    }

    /**
     * 
     * @param type $object entiteta
     * @param type $params
     */
    public function update($object, $params = null)
    {
        parent::update($object, $params);

        /**
         * po validate-u dobimo nove vrednosti objekta
         * 
         * npr. če tehnični vodja zamenja področje funkcije
         */
        $this->expect($this->getAuthorizationService()->isGranted('Funkcija-write', $object)
                , 'Nimate dovoljenja za spreminjanje nekaterih kategorij funkcije', 1000672);
    }

}
