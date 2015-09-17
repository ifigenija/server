<?php


namespace App\Controller;
use Zend\Mvc\Controller\AbstractActionController;

/**
 * Kontroller za index akcijo 
 * 
 * redirecta na klient aplikacijo.
 *
 * @author boris
 */
class IndexController extends AbstractActionController
{
   /**
    * Redirect na client aplikacijo 
    * 
    */  
   public function indexAction() {
       
       return $this->redirect()->toUrl('/client/index.php');       
   }
   
   
}
