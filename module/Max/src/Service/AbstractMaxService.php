<?php

/*
 * Licenca GPL V3 or later
 *  
 */

namespace Max\Service;

use Aaa\Entity\User;
use Doctrine\Common\Util\ClassUtils;
use Doctrine\ORM\EntityManager;
use Max\Consts;
use Max\Entity\Base;
use Max\Exception\MaxException;
use Max\Filter\StripEntity;
use Workflow\Repository\JobManager;
use Zend\Mvc\I18n\Translator;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use ZfcRbac\Service\AuthorizationService;

/**
 * Description of AbstractMaxService
 *
 * @author boris
 */
class AbstractMaxService
        implements ServiceLocatorAwareInterface
{

    use \Zend\ServiceManager\ServiceLocatorAwareTrait;

use \Max\Expect\ExpectTrait;

    /**
     * Referenca na translator
     * @var Translator
     */
    private $translator;

    //put your code here

    /**
     * 
     * @return EntityManager
     */
    protected function getEm()
    {
        return $this->getServiceLocator()->get('doctrine.entitymanager.orm_default');
    }

    /**
     * 
     * @return AuthorizationService
     */
    protected function getAuth()
    {
        return $this->serviceLocator->get('ZfcRbac\Service\AuthorizationService');
    }

    /**
     * 
     * @return User
     */
    protected function getIdentity()
    {
        return $this->getAuth()->getIdentity();
    }

    /**
     * Vrne razred entitete
     * @param Base $object
     * @return string
     */
    protected function getEntityClass($object)
    {
        return ClassUtils::getRealClass(get_class($object));
    }

    /**
     * Vrne kratko ime entitete za objekt
     * @param Base $object
     * @return string
     */
    protected function getEntity($object)
    {
        $f = new StripEntity();
        return $f->filter($this->getEntityClass($object));
    }

    /**
     * Prevri avtorizacijo za akcijo na objektu, glede na vrsto entitete
     * @param object $object instanca ali kratko ime entitete
     * @param string $operacije create, update, delete, lookup
     */
    protected function expectAuthorized($object, $operacije)
    {
        $auth = $this->getAuth();

        $message = 'Nimate dovoljenja %s. Dostop zavrnjen';

        if (is_array($operacije)) {
            foreach ($operacije as $operacija) {
                $perm = $this->getEntity($object) . '-' . $operacija;
                $this->expect($auth->isGranted($perm, $object)
                        , sprintf($this->translate($message), $perm)
                        , 420001
                );
            }
        } else {
            $perm = $this->getEntity($object) . '-' . $operacije;
            $this->expect($auth->isGranted($perm, $object)
                    , sprintf($this->translate($message), $perm)
                    , 420001
            );
        }
    }

    /**
     * Preveri ali ima dovoljenje delati z objektom
     * @param string $perm dovoljenje
     * @param mi $object 
     */
    protected function expectPermission($perm, $object = null)
    {
        $auth = $this->getAuth();
        $this->expect($auth->isGranted($perm, $object)
                , sprintf($this->translate('Nimate dovoljenja %s. Dostop zavrnjen'), $perm)
                , 420002
        );
    }

    /**
     * helper metoda, da se skrajša dostop do translatorja
     * @param string $text
     * @param string $domain
     */
    protected function translate($text, $domain = 'default')
    {

        if (!$this->translator) {
            $this->translator = $this->getServiceLocator()->get('translator');
        }

        return $this->translator->translate($text, $domain);
    }

    public function getUsername()
    {
        $auth  = $this->getServiceLocator()->get('Zend\Authentication\AuthenticationService');
        $ident = $auth->getIdentity();
        if ($ident) {
            return $ident->getUsername();
        } else {
            return "anonymous";
        }
    }

}
