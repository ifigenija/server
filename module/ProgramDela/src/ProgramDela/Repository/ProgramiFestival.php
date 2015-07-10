<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Repository;

use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineModule\Paginator\Adapter\Selectable;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Max\Repository\AbstractMaxRepository;

/**
 * Description of ProgramiFestival
 *
 * @author rado
 */
class ProgramiFestival
        extends EnotePrograma
{

    /**
     * 
     * @param type $object  entiteta
     * @param type $params
     */
    public function create($object, $params = null)
    {
        if ($object->getProgramDela()) {
            $object->getProgramDela()->getProgramiFestival()->add($object);
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
        // $$ morda nastane težava, če uporabnik najprej spremeni programdela in sproži brisanje v istem koraku
        if ($object->getProgramDela()){
            $object->getProgramDela()->getProgramiFestival()->removeElement($object);
            $object->getProgramDela()->preracunaj(\Max\Consts::UP);
        }

        parent::delete($object);
    }

}
