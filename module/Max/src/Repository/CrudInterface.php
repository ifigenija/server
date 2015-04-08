<?php

/*
 *  Licenca GPLv3
 */

namespace Max\Repository;

/**
 * Description of CrudInterface
 *
 * @author boris
 */
interface CrudInterface
{

    public function create($object);

    public function update($object);

    public function delete($object);

    public function validate($object);
}
