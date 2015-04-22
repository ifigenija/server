<?php

/**

 */

namespace Aaa\Resolver;

use Doctrine\ORM\EntityManager;
use Zend\Authentication\Adapter\Http\ResolverInterface;
use Zend\Authentication\Result;
use Zend\Stdlib\ErrorHandler;

/**
 * HTTP Authentication Doctrine entity Resolver
 */
class DoctrineResolver implements ResolverInterface
{

    /**
     * Path to credentials file
     *
     * @var string
     */
    protected $em;
    protected $entityClass;

    /**
     * Constructor
     *
     * @param  string $path Complete filename where the credentials are stored
     */
    public function __construct(EntityManager $em, $entityClass)
    {
        $this->em = $em;
        $this->entityClass = $entityClass;
    }

    function getEntityClass()
    {
        return $this->entityClass;
    }

    function setEntityClass($entityClass)
    {
        $this->entityClass = $entityClass;
        return $this;
    }

    function getEm()
    {
        return $this->em;
    }

    function setEm($em)
    {
        $this->em = $em;
        return $this;
    }

    /**
     * Resolve credentials
     *
     *
     * That is, each line consists of the user's username, the applicable
     * authentication realm, and the password or hash, each delimited by
     * colons.
     *
     * @param  string $email Username
     * @param  string $realm    Authentication Realm
     * @return Result  Authentication result
     * 
     */
    public function resolve($email, $realm, $password = null)
    {
        if (empty($email)) {
            return new Result(Result::FAILURE);
        }

        // Open file, read through looking for matching credentials
        ErrorHandler::start(E_WARNING);

        $rep = $this->em->getRepository($this->entityClass);
        $user = $rep->findOneBy(['email' => $email]);
        if ($user) {
            $authenticated = \Aaa\Service\AaaService::checkPassword($user, $password);
            if ($authenticated)
                return new Result(Result::SUCCESS, $user);
        }

        return new Result(Result::FAILURE,null);
    }

}
