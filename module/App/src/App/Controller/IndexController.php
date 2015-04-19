<?php


namespace App\Controller;

/**
 * Kontroller za index akcijo 
 * 
 * redirecta na klient aplikacijo.
 *
 * @author boris
 */
class IndexController extends \Zend\Mvc\Controller\AbstractActionController
{
   /**
    * Redirect na client aplikacijo 
    * 
    */  
   public function indexAction() {
       
       return $this->redirect()->toUrl('/client/index.html');       
   }
   
   
}
