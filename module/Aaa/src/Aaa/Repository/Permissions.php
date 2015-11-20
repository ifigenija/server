<?php

namespace Aaa\Repository;

use Aaa\Entity\Permission;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Resource - dovoljenja
 *
 */
class Permissions
        extends AbstractMaxRepository
{

    /**
     * default sort opcije
     *
     * @var array
     */
    protected $sortOptions = [
        'default' => [
            'name'    => ['alias' => 'p.name'],
            'builtIn' => ['alias' => 'p.builtIn']
        ]
    ];

    /**
     * Iskanje za privzeto
     *
     * @param type $options['text'] je obvezen
     * @return Paginator
     */
    public function getPaginator(array $options, $name = 'default')
    {

        $em   = $this->getEntityManager();
        $qb   = $em->createQueryBuilder();
        $ex   = $qb->expr();
        $sort = $this->getSort($name);
        $qb->orderBy($sort->order, $sort->dir);

        $qb->select('p');
        $qb->from('\Aaa\Entity\Permission', 'p');

        if (!empty($options['q'])) {
            $srch = mb_strtolower($options['q']);
            $name = $ex->like('lower(p.name)', ':query');

            $qb->andWhere($ex->orx($name));

            $qb->setParameter('query', "%" . $srch . "%");
        }
        return new DoctrinePaginator(new Paginator($qb));
    }

    /**
     * Vrne seznam Permission objektov, kot array collection 
     * @param string[] $names
     * @return Permission[]
     */
    public function resolveNames($role, $names)
    {
        $ret = new ArrayCollection([]);
        foreach ($names as $name) {
            $r = $this->findOneByName($name);
            if ($r) {
                $role->getPermissions()->add($r);
                $r->getRoles()->add($role);
            }
        }
        return $ret;
    }

    /**
     * doda/ažurira seznam permission objektov 
     * 
     * @param string[] $names
     * @return boolean  
     */
    public function azurirajNames($role, $names)
    {
        foreach ($names as $name) {
            $perm = $this->findOneByName($name);
            if ($perm) {
                if (!$role->getPermissions()->contains($perm)) {
                    $role->addPermissions($perm);
                }
            }
        }
        return true;
    }

    /**
     * 
     * @param Permission $object
     * @param type $params
     * @return boolean
     */
    public function update($object, $params = null)
    {
        if (!empty($params) && array_key_exists('__relation', $params) && $params['__relation'] == 'roles') {
            /**
             * dodajanje vlog k dovoljenjem
             * možno dodajati le ne vgrajene vloge
             * $$ dokončaj: - poglej computeAssociationChanges, computeChangeSet
             */
            $uow  = $this->getEntityManager()->getUnitOfWork();
            $spremembeA = $uow->getEntityChangeSet($object); //verjetno nič ne pomaga ta ukaz $$
        } else {
            /**
             * rest update dovoljen le za nevgrajena dovoljenja
             */
            $this->expect(!$object->getBuiltIn(), "Vgrajenih dovoljenj ni dovoljeno spreminjati", 1001400);
        }


        parent::update($object, $params);
        return true;
    }

    /**
     * 
     * @param Permission $object
     */
    public function delete($object)
    {
        /**
         * rest delete dovoljen le za nevgrajena dovoljenja
         */
        $this->expect(!$object->getBuiltIn(), "Vgrajenih dovoljenj ni dovoljeno brisati", 1001401);

        parent::delete($object);
    }

}
