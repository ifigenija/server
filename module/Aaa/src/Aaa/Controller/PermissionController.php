<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace Aaa\Controller;
/**
 * Description of UserController
 *
 * @author boris
 */
class PermissionController extends \Max\Controller\RestController
{
    
    protected $entityClass = "Aaa\Entity\Permission";
    
    public function create($data)
    {
        return $this->notSupported();
    }

    public function delete($id)
    {
        return $this->notSupported();
    }

    public function update($id, $data)
    {
        return $this->notSupported();
    }

            
            
    
}
