<?php

/**
 * Licenca GPLv3 or later
 */

namespace App\Repository;

use Doctrine\ORM\Query;

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
     * @return mixed 
     */
    public function getOptionValuesGlobalValue($option)
    {
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
     * @param \App\Entity\Option $option      ime opcije
     * @return string|null      Id ali null
     */
    public function getOptionValuesGlobalId($option)
    {
        $optval = $this->findOneBy(["option" => $option->getId(), "global" => true]);

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
