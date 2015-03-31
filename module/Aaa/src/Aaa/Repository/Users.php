<?php

namespace Aaa\Repository;

use Doctrine\ORM\Query;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Exception;
use Max\Repository\AbstractMaxRepository;

/**
 * User - uporabniki
 *
 */
class Users
    extends AbstractMaxRepository
   
{

    /**
     * default sort opcije
     *
     * @var array
     */
    protected $sortOptions = [
        'default' => [
            'ime' => ['alias' => 'u.name'],
            'priimek' => ['alias' => 'u.surname']
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

        $srch = strtolower($options['text']);

        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $ex = $qb->expr();
        $sort = $this->getSort($name);

        $qb->select('u');
        $qb->from('\Aaa\Entity\User', 'u');
        $qb->orderBy($sort->order, $sort->dir);

        if ($srch) {
            $qb->Where($ex->orx(
                    $ex->like('lower(u.name)', ':name'), $ex->like('lower(u.surname)', ':surname')
            ));
            $qb->setParameter('name', "%" . $srch . "%");
            $qb->setParameter('surname', "%" . $srch . "%");
        }
        return new DoctrinePaginator(new Paginator($qb));
    }

    
    public function shrani($object, $data)
    {

        $object->defaultRouteParams = preg_replace('/\s+/', '', $object->defaultRouteParams);
        parent::shrani($object, $data);
    }


    public function getList()
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();

        $qb->select(['s']);
        $qb->from('\Aaa\Entity\User', 's');


        $l = $qb->getQuery()->getResult(Query::HYDRATE_ARRAY);
        $list = [];
        foreach ($l as $g) {
            if ($g['username'] === 'SYSTEM')
                continue;
            $list[] = ['id' => $g['id'], 'name' => $g['surname'] . ', ' . $g['name'] . ' (' . $g['username'] . ')'];
        }
        return $list;
    }

    public function getJsonHydrator($options = [])
    {
        $defaults = ['exclude' => ['groups', 'expires', 'defaultRouteParams', 'defaultRoute', 'upor', 'datKnj']];

        $options = array_merge_recursive($defaults, $options);
        return parent::getJsonHydrator($options);
    }

    public function removeUser($id)
    {
        if (!$id) {
            return true;
        }
        $em = $this->getEntityManager();
        $user = $this->getUser($id);
        $em->remove($user);
        $em->flush();
    }

    public function login($username, $password)
    {
        $authService = $this->getServiceLocator()->get('Zend\Authentication\AuthenticationService');
        $adapter = $authService->getAdapter();
        $adapter->setIdentityValue($username);
        $adapter->setCredentialValue($password);
        $authResult = $authService->authenticate();
        if ($authResult->isValid()) {
            $identity = $authResult->getIdentity();
            $authService->getStorage()->write($identity);
        }
        return $authResult->isValid();
    }

    public function enable($username, $act)
    {
        $user = $this->findOneBy(['username' => $username]);

        if ($user) {
            $user->setEnabled($act);
        } else {
            throw new Exception('Ne najdem uporabnika ' . $username);
        }
    }

    public function resetPassword($username, $password)
    {
        $user = $this->findOneBy(['username' => $username]);

        if ($user) {
            $user->setPassword($password);
        } else {
            throw new Exception('Ne najdem uporabnika ' . $username);
        }
    }

    /**
     * odstrani vloge iz uporabnika
     *
     * @param $object
     * @param $resIds array id ključ vlog
     */
    public function removeRoles($object, $resIds)
    {
        $rr = $this->getEntityManager()->getRepository('\Aaa\Entity\Role');
        if ($resIds) {
            foreach ($resIds as $resId => $v) {
                $perm = $rr->findOneById($resId);
                $object->getHierRoles()->removeElement($perm);
            }
        }
    }

    /**
     * dodaja izbrane vloge v objekt
     *
     * @param $object
     * @param $resIds array id ključ dovoljenja
     */
    public function addRoles($object, $resIds)
    {
        $rr = $this->getEntityManager()->getRepository('\Aaa\Entity\Role');
        if ($resIds) {
            foreach ($resIds as $resId => $v) {
                $perm = $rr->findOneById($resId);
                if (!$object->getHierRoles()->contains($perm)) {
                    $object->getHierRoles()->add($perm);
                }
            }
        }
    }

}
