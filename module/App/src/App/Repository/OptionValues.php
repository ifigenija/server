<?php

/**
 * Licenca GPLv3 or later
 */

namespace App\Repository;

use Doctrine\ORM\Query;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Exception;
use Max\Repository\AbstractMaxRepository;


/**
 * 
 *
 * @author rado
 */
class OptionValues
        extends \Max\Repository\AbstractMaxRepository
{

    /**
     * vrne globalno vrednost opcij , če le ta obstaja 
     * 
     * @param string $name Ime opcije
     * @return array
     */
    public function getOptionValuesGlobalArray($name)
    {
        $dql   = "SELECT v,o FROM App\Entity\OptionValue v JOIN v.option o" .
                " WHERE v.global = true  AND  o.name='$name'";
        $query = $this->getEntityManager()->createQuery($dql);
        return $query->getArrayResult();
    }
    
    /**
     * 
     * @param type $name      ime opcije
     * @param type $username  uprabniško ime
     * @return type
     */
    public function getOptionValuesUserArray($optname,$username)
    {
        $dql   = "SELECT v,o,u FROM App\Entity\OptionValue v JOIN v.option o JOIN v.user u" .
                " WHERE v.global = false  AND  o.name='$optname' and u.username='$username' ";
        $query = $this->getEntityManager()->createQuery($dql);
        return $query->getArrayResult();
    }

    
    
    
}
