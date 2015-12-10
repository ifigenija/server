<?php

/**
 * LicencOa GPLv3 or later
 */

namespace App\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;

/**
 * Description of Drzave
 *
 * @author boris
 */
class Osebe
        extends \Max\Repository\AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "priimek"   => ["alias" => "p.priimek"],
            "ime"       => ["alias" => "p.ime"],
            "sifra"     => ["alias" => "p.sifra"],
            "email"     => ["alias" => "p.email"],
            "psevdonim" => ["alias" => "p.psevdonim"],
        ],
        "osebni"  => [
            "priimek"   => ["alias" => "p.priimek"],
            "ime"       => ["alias" => "p.ime"],
            "sifra"     => ["alias" => "p.sifra"],
            "email"     => ["alias" => "p.email"],
            "psevdonim" => ["alias" => "p.psevdonim"],
        ],
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
                $qb = $this->getVseQb($options);
                break;
            case "osebni":
                $qb = $this->getOsebniQb($options);
                break;
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

            $ime       = $e->like('lower(p.ime)', ':naz');
            $priimek   = $e->like('lower(p.priimek)', ':naz');
            $sifra     = $e->like('lower(p.sifra)', ':naz');
            $email     = $e->like('lower(p.email)', ':naz');
            $psevdonim = $e->like('lower(p.psevdonim)', ':naz');
            $qb->andWhere($e->orX($ime, $priimek, $sifra, $email, $psevdonim));
            $q         = mb_strtolower($options['q']);
            $qb->setParameter('naz', "%" . $q . "%", "string");
        }

        if (!empty($options['naslov'])) {
            $qb->leftJoin('p.naslovi', 'naslov');

            $ulica          = $e->like('lower(naslov.ulica)', ':naslov');
            $dodatnaUlica   = $e->like('lower(naslov.ulicaDva)', ':naslov');
            $posta          = $e->like('lower(naslov.postaNaziv)', ':naslov');
            $postnaStevilka = $e->like('lower(naslov.posta)', ':naslov');

            $qb->andWhere($e->orX($ulica, $dodatnaUlica, $posta, $postnaStevilka));

            $qb->setParameter('naslov', mb_strtolower("{$options['naslov']}%"), "string");
        }

        return $qb;
    }

    public function getOsebniQb($options)
    {
        $this->expect($this->getAuthorizationService()->isGranted('OsebniPodatki-read'),
                'Nimate dovoljenja za branje osebnih podatkov', 1001600);

        return $this->getVseQb($options);
    }

    /**
     * 
     * 
     * @param Oseba $object
     * @param array $params
     */
    public function create($object, $params = null)
    {
        if (empty($object->getSifra())) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');
            $object->setSifra($num->generate('oseba'));
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
        // preračunamo vrednosti v smeri navzgor
        $object->preracunaj(\Max\Consts::UP);

        parent::update($object, $params);
    }

}
