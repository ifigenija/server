<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Repository;

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
