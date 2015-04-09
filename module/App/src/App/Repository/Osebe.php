<?php

/**
 * Licenca GPLv3 or later
 */

namespace App\Repository;

/**
 * Description of Drzave
 *
 * @author boris
 */
class Osebe extends \Max\Repository\AbstractMaxRepository
{

    public function create($object)
    {
        parent::create($object);
        
        $object->setNaziv($object->getPriimek() . ', ' . $object->getIme());
    }

    public function update($object)
    {
        parent::update($object);
        
        
        $object->setNaziv($object->getPriimek() . ', ' . $object->getIme());
    }


}
