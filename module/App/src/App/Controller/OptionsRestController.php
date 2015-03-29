<?php

namespace App\Controller;

use Max\Controller\RestController;

/**
 * 
 *
 * @author boris
 */
class OptionsRestController
        extends RestController
{

    protected $entityClass = 'App\Entity\Option';

    /**
     * create na opcijah ni podprt
     * @return \Zend\Http\Response
     */
    public function create($data)
    {
        return $this->notSupported();
    }

    /**
     * delete na opcijah ni podprt
     * @return \Zend\Http\Response
     */
    public function delete($id)
    {
        return $this->notSupported();
    }

    /**
     * update na opcijah ni podprt
     * @return \Zend\Http\Response 
     */
    public function update($id, $data)
    {
        return $this->notSupported();
    }

}
