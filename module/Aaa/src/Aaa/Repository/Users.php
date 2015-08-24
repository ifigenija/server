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
            'name'  => ['alias' => 'u.name'],
            'email' => ['alias' => 'u.email']
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

        $qb->select('u');
        $qb->from('\Aaa\Entity\User', 'u');
        $qb->orderBy($sort->order, $sort->dir);

        if (!empty($options['text'])) {
            $srch = strtolower($options['text']);

            $qb->Where(
                    $ex->like('lower(u.name)', ':name')
            );
            $qb->setParameter('name', "%" . $srch . "%");
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


        $l    = $qb->getQuery()->getResult(Query::HYDRATE_ARRAY);
        $list = [];
        foreach ($l as $g) {
//            if ($g['username'] === 'SYSTEM')
            if ($g['email'] === 'SYSTEM')
                continue;
            $list[] = ['id' => $g['id'], 'name' => $g['surname'] . ', ' . $g['name'] . ' (' . $g['email'] . ')'];
        }
        return $list;
    }

    public function removeUser($id)
    {
        if (!$id) {
            return true;
        }
        $em   = $this->getEntityManager();
        $user = $this->getUser($id);
        $em->remove($user);
        $em->flush();
    }

    /**
     * 
     * @param string $email
     * @param string $password
     * @return boolean
     */
    public function login($email, $password)
    {
        $authService = $this->getServiceLocator()->get('Zend\Authentication\AuthenticationService');
        $adapter     = $authService->getAdapter();
        $adapter->setIdentityValue($email);
        $adapter->setCredentialValue($password);
        $authResult  = $authService->authenticate();
        if ($authResult->isValid()) {
            $identity = $authResult->getIdentity();
            $authService->getStorage()->write($identity);
        }
        return $authResult->isValid();
    }

    public function enable($username, $act)
    {
        $user = $this->findOneBy(['email' => $username]);

        if ($user) {
            $user->setEnabled($act);
        } else {
            throw new Exception('Ne najdem uporabnika ' . $username);
        }
    }

    public function resetPassword($username, $password)
    {
        $user = $this->findOneBy(['email' => $username]);

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
     * @param array $resIds array id ključ vlog
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
     * @param array $resIds array id ključ dovoljenja
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

    // vrne vloge vseh userjev
    public function getUsersRolesArray()
    {
        $dql   = "SELECT u,r FROM Aaa\Entity\User u JOIN u.roles r" .
                " ORDER BY r.name ASC";
        $query = $this->getEntityManager()->createQuery($dql);
        return $query->getArrayResult();
    }

    // vrne vloge 1 userja
    public function getUserRolesArray($username)
    {
        $dql   = "SELECT u,r FROM Aaa\Entity\User u JOIN u.roles r" .
                " WHERE u.email='$username' ORDER BY r.name ASC";
        $query = $this->getEntityManager()->createQuery($dql);
        return $query->getArrayResult();
    }

}
