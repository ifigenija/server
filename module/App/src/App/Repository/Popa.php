<?php

/**
 * Licenca GPLv3 or later
 */

namespace App\Repository;

use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of PostniNaslovi
 *
 * @author rado
 */
class Popa
        extends AbstractMaxRepository
{

    protected $sortOptions = [
        "default" => [
            "sifra" => ["alias" => "p.sifra"],
            "naziv" => ["alias" => "p.naziv"],
            "email" => ["alias" => "p.email"],
            "idddv" => ["alias" => "p.iddv"],
        ],
        "vse"     => [
            "sifra" => ["alias" => "p.sifra"],
        ]
    ];

    public function getPaginator(array $options, $name = "default")
    {
        switch ($name) {
            case "default":
            case "vse":
                $qb = $this->getVseQb($options);
                $sort = $this->getSort($name);
                $qb->orderBy($sort->order, $sort->dir);
                return new DoctrinePaginator(new Paginator($qb));
        }
    }

    /**
     * Naredim query s query builderjem in ga vrnem 
     * uporabno samostojno ali pa preko
     * getPaginator
     * 
     * @param array $options
     */
    public function getVseQb($options)
    {
        $qb = $this->createQueryBuilder('p');
        $e  = $qb->expr();

        if (!empty($options['q'])) {

            $naziv = $e->like('lower(p.naziv)', ':naz');
            $sifra = $e->like('lower(p.sifra)', ':naz');
            $email = $e->like('lower(p.email)', ':naz');
            $iddv  = $e->like('lower(p.idddv)', ':ddv');

            $qb->andWhere($e->orX($naziv, $sifra, $email, $iddv));

            $qb->setParameter('naz', strtolower("%{$options['q']}%"), "string");
            $qb->setParameter('ddv', strtolower($options['q']), "string");
        }

        if (!empty($options['naslov'])) {
            $qb->leftJoin('p.naslovi', 'naslov');

            $ulica          = $e->like('lower(naslov.ulica)', ':naslov');
            $dodatnaUlica   = $e->like('lower(naslov.ulicaDva)', ':naslov');
            $posta          = $e->like('lower(naslov.postaNaziv)', ':naslov');
            $postnaStevilka = $e->like('lower(naslov.posta)', ':naslov');


            $qb->andWhere($e->orX($ulica, $dodatnaUlica, $posta, $postnaStevilka));

            $qb->setParameter('naslov', strtolower("{$options['naslov']}%"), "string");
        }

        if (!empty($options['kontaktna'])) {
            $qb->join('p.kontaktneOsebe', 'kontaktna');
            $qb->join('kontaktna.oseba', 'oseba');

            $ime     = $e->like('lower(oseba.ime)', ':niz');
            $priimek = $e->like('lower(oseba.priimek)', ':niz');

            $qb->andWhere($e->orX($ime, $priimek));

            $qb->setParameter('niz', strtolower("{$options['kontaktna']}%"), "string");
        }

        return $qb;
    }

    /**
     * 
     * 
     * @param Popa $object
     * @param array $params
     */
    public function create($object, $params = null)
    {
        if (empty($object->getSifra())) {
            $num = $this->getServiceLocator()->get('stevilcenje.generator');
            $object->setSifra($num->generate('popa'));
        }
        parent::create($object, $params);
    }

        /**
     * 
     * @param type $object entiteta
     * @param type $params
     */
    public function delete($object)
    {
        /**
         * matičnega gledališča ni mogoče brisati
         */
        $em      = $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');
        $optionR = $em->getRepository('App\Entity\Option');
        $option  = $optionR->findOneByName("application.tenant.maticnopodjetje");
        $popaId   = $option->getDefaultValue();      // šifra matičnega podjetja t.j. lastnega gledališča

        $this->expect($object->getId()!=$popaId, "Matičnega gledališča ni mogoče brisati", 1001210);

        parent::delete($object);
    }

    
    
}
