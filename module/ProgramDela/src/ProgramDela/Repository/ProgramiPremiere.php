<?php

/*
 *  Licenca GPLv3
 */

namespace ProgramDela\Repository;


/**
 * Description of ProgramiPremiere
 *
 * @author rado
 */
class ProgramiPremiere
        extends EnotePrograma
{
    /**
     * 
     * @param type $object  entiteta
     * @param type $params
     */
    public function create($object, $params = null)
    {
        if ($object->getDokument()) {
            $object->getDokument()->getPremiere()->add($object);
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
        if ($object->getDokument()) {
            $object->getDokument()->getPremiere()->removeElement($object);
            $object->getDokument()->preracunaj(\Max\Consts::UP);
        }
        
        parent::delete($object);
    }

}
