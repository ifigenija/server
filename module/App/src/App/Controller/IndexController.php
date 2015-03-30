<?php

/*
 * 
 */

namespace App\Controller;

/**
 * Kontroller za index akcijo 
 *
 * @author boris
 */
class IndexController extends \Zend\Mvc\Controller\AbstractActionController
{
   /**
    * 
    */  
   public function indexAction() {
       
       return new \Zend\View\Model\ViewModel(['hello' => 'world']);
       
   }
   
   
}
