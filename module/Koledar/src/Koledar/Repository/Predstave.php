<?php

/*
 *  Licenca GPLv3
 */

namespace Koledar\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Koledar\Entity\Predstava;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of Predstave
 *
 * @author rado
 */
class Predstave
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "zaporedna"    => ["alias" => "p.zaporedna"],
            "zaporednaSez" => ["alias" => "p.zaporednaSez"],
        ],
        "vse"     => [
            "zaporedna"    => ["alias" => "p.zaporedna"],
            "zaporednaSez" => ["alias" => "p.zaporednaSez"],
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
                $this->expect(!empty($options['uprizoritev']), "Uprizoritev je obvezna", 770111);
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

            $naz = $e->like('p.id', ':id');

            $qb->andWhere($e->orX($naz));

            $qb->setParameter('id', "{$options['q']}%", "string");
        }
        if (!empty($options['uprizoritev'])) {
            $qb->join('p.uprizoritev', 'uprizoritev');
            $naz = $e->eq('uprizoritev.id', ':upr');
            $qb->andWhere($naz);
            $qb->setParameter('upr', "{$options['uprizoritev']}", "string");
        }
        return $qb;
    }

    /**
     * Opravila pri ustvarjanju nove entitete
     *
     * @param Predstava $object
     * @param Parameters $params
     */
    public function create($object, $params = null)
    {
        if ($object->dogodek) {
            /** @var Dogodki $rep */
            $rep = $this->getEntityManager()->getRepository('Koledar\Entity\Dogodek');
            $rep->create($object->getDogodek(), $params);
        }
        if ($object->getUprizoritev()) {
            $object->getUprizoritev()->getPredstave()->add($object);
        }
        $this->preracunajZaporedne($object, 'create');

        parent::create($object, $params); // TODO: Change the autogenerated stub
    }

    /**
     * 
     * @param type $object
     * @param type $params
     */
    public function update($object, $params = null)
    {
        if ($object->dogodek) {
            /** @var Dogodki $rep */
            $rep = $this->getEntityManager()->getRepository('Koledar\Entity\Dogodek');
            $rep->update($object->getDogodek(), $params);
        }
        parent::update($object, $params); // TODO: Change the autogenerated stub      
        $this->preracunajZaporedne($object, 'update');
    }

    /**
     * Pri brisanju brišem tudi dogodek
     *
     * @param Predstava $object
     */
    public function delete($object)
    {
        if ($object->getDogodek()) {
            $this->getEntityManager()->remove($object->getDogodek());
        }
        if ($object->getUprizoritev()) {
            $object->getUprizoritev()->getPredstave()->removeElement($object);
        }
        $this->preracunajZaporedne($object, 'delete');

        parent::delete($object);
    }

    /**
     * preračunaj zaporedne številke
     * 
     * @param type $object
     */
    private function preracunajZaporedne($object, $mode = 'update')
    {
        /*
         * najprej preštevilčenje prestav iste uprizoritve
         */       
        $predstave = $object->getUprizoritev()->getPredstave()->toArray();
        $predstave = $this->odstraniOdpovedane($predstave);
        $predstave = $this->sortPoZacetku($predstave);

        $i = 1;
        foreach ($predstave as $p) {
            $p->setZaporedna($i);
            $i++;
        }

        /*
         * predstave iste uprizoritve znotraj sezone
         */
        $predstaveSez = $predstave;
        foreach ($predstaveSez as $key => $p) {
            if (!$object->getDogodek()->getSezona() || $p->getDogodek()->getSezona() != $object->getDogodek()->getSezona()) {
                unset($predstaveSez[$key]);
            }
        }
        $i = 1;
        foreach ($predstaveSez as $p) {
            $p->setZaporednaSez($i);
            $i++;
        }

        /*
         * preštevilčenje predstav različnih uprizoritev znotraj sezone
         */
        $vsepredstaveSez = $this->getLetosnjePredstave($object);

        $vsepredstaveSez = $this->dodajOdstraniTrenutno($vsepredstaveSez, $object, $mode);
        $vsepredstaveSez = $this->odstraniOdpovedane($vsepredstaveSez);
        $vsepredstaveSez = $this->sortPoZacetku($vsepredstaveSez);

        $i = 1;
        foreach ($vsepredstaveSez as $p) {
            $p->setZaporednaSezVsehUpr($i);
            $i++;
        }
    }

    /**
     * sortiranje polja po datumu začetka predstave
     * 
     * @param array $predstave
     */
    private function sortPoZacetku(array $predstave)
    {
        usort($predstave, function($a, $b) {
            return $a->getDogodek()->getZacetek() < $b->getDogodek()->getZacetek() ? -1 : 1;
        });

        return $predstave;
    }

    /**
     * sortiranje polja po datumu začetka predstave
     * 
     * @param array $predstave
     */
    private function odstraniOdpovedane(array $predstave)
    {
        /*
         * ostranimo odpovedane dogodke
         */
        foreach ($predstave as $key => $p) {
            if ($p->getDogodek()->getStatus() == \Koledar\Entity\Dogodek::ODPOVEDAN) {
                unset($predstave[$key]);
            }
        }
        return $predstave;
    }

    /**
     * 
     * @param array $predstave  polje predstav
     * @param type $object      trenutna predstava
     * @param type $mode
     */
    private function dodajOdstraniTrenutno(array $predstave, $object, $mode)
    {
        switch ($mode):
            case "create":
                $predstave[] = $object;
                break;
            case "delete":
                foreach ($predstave as $key => $p) {
                    if ($p->getId() == $object->getId()) {
                        unset($predstave[$key]);
                    }
                }
                break;
        endswitch;

        return $predstave;
    }

    /**
     */
    public function getLetosnjePredstave($object)
    {
        $qb = $this->getEntityManager()->createQueryBuilder();
        $e  = $qb->expr();

        $qb->select('pr')
                ->from('Koledar\Entity\Predstava', 'pr')
                ->join('pr.dogodek', 'dog')
                ->join('dog.sezona', 's');
        if ($object->getDogodek()->getSezona()) {
            $qb->andWhere($e->eq('s.id', "'" . $object->getDogodek()->getSezona() . "'"));
        } else {
            /*
             * sezona mora biti vnešena
             */
            $qb->andWhere('1=0');
        }

        $predstave = $qb
                ->getQuery()
                ->getResult();

        return $predstave;
    }

}
