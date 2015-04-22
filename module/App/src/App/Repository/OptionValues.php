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
     * @param \App\Entity\Option $option      ime opcije
     * @return type map Global Value ali null
     */
    public function getOptionValuesGlobalValue($option)
    {
//        $dql    = "SELECT v,o FROM App\Entity\OptionValue v JOIN v.option o" .
//                " WHERE v.global = true  AND  o.name='$name'";
//        $query  = $this->getEntityManager()->createQuery($dql);
//        $optval = $query->getOneOrNullResult();
        $optval = $this->findOneBy(["option" => $option->getId(), "global" => true]);

        
        if (is_null($optval)) {
            $value = null;
        } else {
            $value = $optval->getValue();
        }
        return $value;
    }

    /**
     * Vrne Id globalne opcijo, če le-ta obstaja
     * 
     * @param type $name ime opcije
     * @return string|null      Id ali null
     */
    public function getOptionValuesGlobalId($name)
    {
        $dql    = "SELECT v,o FROM App\Entity\OptionValue v JOIN v.option o" .
                " WHERE v.global = true  AND  o.name='$name'";
        $query  = $this->getEntityManager()->createQuery($dql);
        $optval = $query->getOneOrNullResult();
        if (is_null($optval)) {
            $id = null;
        } else {
            $id = $optval->getId();
        }
        return $id;
    }

    /**
     * Vrne uporabniško opcijo, če le-ta obstaja
     * 
     * @param \App\Entity\Option $option      ime opcije
     * @param \Aaa\Entity\User $user  uprabniško ime
     * @return  mixed
     */
    public function getOptionValuesUserValue($option, $user)
    {
        $optval = $this->findOneBy(["user"   => $user->getId(),
            "option" => $option->getId(),
            "global" => false]);

        if (is_null($optval)) {
            $value = null;
        } else {
            $value = $optval->getValue();
        }
        return $value;
    }

    /**
     * Vrne Id uporabniške opcije, če le-ta obstaja
     * 
     * @param \App\Entity\Option $option      ime opcije
     * @param \Aaa\Entity\User $user  uprabniško ime
     * @return  Id ali null
     */
    public function getOptionValuesUserId($option, $user)
    {
        $optval = $this->findOneBy(["user"   => $user->getId(),
            "option" => $option->getId(),
            "global" => false]);

        if (is_null($optval)) {
            $id = null;
        } else {
            $id = $optval->getId();
        }
        return $id;
    }

}
