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
     * Vrne globalno opcijo, če le-ta obstaja
     * 
     * @param type $name ime opicje
     * @return type map Global Value ali null
     */
    public function getOptionValuesGlobalValue($name)
    {
        $dql    = "SELECT v,o FROM App\Entity\OptionValue v JOIN v.option o" .
                " WHERE v.global = true  AND  o.name='$name'";
        $query  = $this->getEntityManager()->createQuery($dql);
        $optval = $query->getOneOrNullResult();
        if (is_null($optval)) {
            $value = null;
        } else {
            $value = $optval->getValue();
        }
        return $value;
    }

    /**
     * Vrne globalno opcijo, če le-ta obstaja
     * 
     * @param type $name      ime opcije
     * @param type $username  uprabniško ime
     * @return type map Global Value ali null
     */
    public function getOptionValuesUserValue($optname, $username)
    {
        $dql    = "SELECT v,o,u FROM App\Entity\OptionValue v JOIN v.option o JOIN v.user u" .
                " WHERE v.global = false  AND  o.name='$optname' and u.username='$username' ";
        $query  = $this->getEntityManager()->createQuery($dql);
        $optval = $query->getOneOrNullResult();
        if (is_null($optval)) {
            $value = null;
        } else {
            $value = $optval->getValue();
        }
        return $value;
    }

}
