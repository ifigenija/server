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
 * Description of ProgramDela
 *
 * @author boris
 */
class EnotePrograma
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sort" => ["alias" => "p.sort"]
        ],
        "vse"     => [
            "sort" => ["alias" => "p.sort"]
        ],
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
     * vrne true, če je pripadajoči program dela zaklenjen
     * 
     * @param entiteta $obj
     * @return boolean
     */
    private function zaklenjenProgramDela($obj)
    {
        if ($obj) {
            // najdemo programDela:
            if (method_exists($obj, 'getDokument')) {
                return ($obj->getDokument() && $obj->getDokument()->getZakljuceno() ? true : false);
            } elseif (method_exists($obj, 'getProgramDela')) {
                //za festival
                return ($obj->getProgramDela() && $obj->getProgramDela()->getZakljuceno() ? true : false);
            } else {
                $this->expect(false, "Enota programa nima niti metode getDocument niti getProgramDela", 1000523);
            }
        }
        return false;       // za vsak slučaj
    }

    /**
     * 
     * @param type $object  entiteta
     * @param type $params
     */
    public function create($object, $params = null)
    {
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000520);

        $this->nastaviFlagImaKoprodukcijo($object);
        $object->preracunaj();      //$ da se naš delež za koprodukcije ustrezno postavi
        $this->azurirajKoprodukcije($object);

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
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000521);

        $object->preracunajPoljaZaMatKoprodukcijo();
        $this->nastaviFlagImaKoprodukcijo($object);
        $this->azurirajKoprodukcije($object);

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
        $this->expect(!$this->zaklenjenProgramDela($object), "Program dela je že zaklenjen/zaključen. Spremembe niso več mogoče", 1000522);

        parent::delete($object);
    }

    protected function nastaviFlagImaKoprodukcijo($object)
    {
        if ($object->getTipProgramskeEnote()) {
            $object->setImaKoprodukcije($object->getTipProgramskeEnote()->getKoprodukcija());
        }
    }

    /**
     * ažurira koprodukcije - če je flag ima koprodukcijo:
     *  true   => kreira novo matično koprodukcijo
     *  false  => briše vse koprodukcije
     * 
     * @param type $object
     */
    protected function azurirajKoprodukcije($object)
    {
        if ($object->getImaKoprodukcije()) {
            /**
             * nova matična koprodukcija
             */
            $service = $this->serviceLocator->get('enotaprograma.service');
            $service->novaMaticnaKoprodukcija($object);
        } else {
            /**
             * briši vse koprodukcije
             */
            $object->getKoprodukcije()->clear();
        }
    }

}
