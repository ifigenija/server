<?php

namespace Max\Controller;

use Doctrine\ORM\EntityManager;
use Max\Ann\EntityMetadata;
use Max\Entity\Base;
use Max\Navigation\BaseToolbar;
use Max\Repository\AbstractMaxRepository;
use Max\Repository\IzbirneOpcije;
use Max\Service\Nastavitve;
use Zend\Form\Fieldset;
use Zend\Form\Form;
use Zend\Http\PhpEnvironment\Request;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Mvc\MvcEvent;
use Zend\Paginator\Paginator;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;
use ZfcRbac\Service\AuthorizationService;
use ZfcRbac\Service\AuthorizationServiceAwareInterface;

/**
 * AbstractMaxController Služi kot base class za kontrolerje v aplikaciji.
 * Nudi upravljanje isklanih form in sortirnih opcij
 *
 * @author boris
 */
class ActionController
    extends AbstractActionController
    implements AuthorizationServiceAwareInterface
{

    /**
     * Vračanje napak ajax klicov
     */
    use JsonErrorsTrait,
        ActionTrait\EntityTrait;

    /**
     * A je bila zahtevana printana verzija
     *
     * @var integer
     */
    protected $print = 0;

    /**
     * Stran za glavni paginator
     *
     * @var integer
     */
    protected $page = 1;

    /**
     * @var Nastavitve
     */
    protected $nast;

    /**
     * @var AuthorizationService
     *
     */
    protected $authorizationService;

    /**
     * @var IzbirneOpcije
     *
     */
    protected $opts;

    /**
     *
     * @var BaseToolbar
     */
    protected $toolbar;

    /**
     * Callback, ki ga pokliče flashShrani, če ni nastavljen pokliče shrani na 
     * repozitoriju
     * 
     * @var callable
     */
    protected $shraniCallback;

    public function init()
    {
        return $this;
    }

    public function onDispatch(MvcEvent $e)
    {

      

        

        return parent::onDispatch($e);
    }

    /**
     * Posreduje podatke o zahtevanem sortu v repositorij
     * Poskrbi za persistenco sort podatkov v sessionu
     *
     * @param string $name
     * @param AbstractMaxRepository $repository
     * @param string $paginatorName
     */
    public function manageSort($repository, $paginatorName = 'default', $suffix = 'sort')
    {
        $this->page = $this->params()->fromQuery('page', 1);
        if (!$this->fragment()) {

            $sess = new Container('Max');
            if (!$this->entity) {
                $c = $this->params('controller') . '-' . $this->params('action');
            } else {
                $c = $this->entity;
            }

            $name = $c . $suffix;
// če je sort shranjen
            if ($sess->offsetExists($name . $paginatorName)) {
                $sort = $sess->offsetGet($name . $paginatorName);
                $repository->setSort($sort['field'], $sort['dir'], $paginatorName);
            }


// če je sort zahtevan
            if ($this->params()->fromQuery('sort')) {
                $field = $this->params()->fromQuery('sort');
                $dir = $this->params()->fromQuery('d', 'up');
                $repository->setSort($field, $dir, $paginatorName);
                $this->sess->offsetSet($name . $paginatorName, ['field' => $field, 'dir' => $dir]);
            }
        } else {

            $field = $this->params()->fromQuery('sort', null);
            $dir = $this->params()->fromQuery('d', 'up');
            $repository->setSort($field, $dir, $paginatorName);
        }
    }

    /**
     * Preveri če je forma valid in jo shrani podatke iz valid forme shrani v session
     *
     * @param Form $filter
     * @return boolean
     */
    public function manageSearchForm($filter, $json = false)
    {
        $data = $this->params()->fromQuery('filter');
        if ($data) {
            $data = array_merge($filter->getDefaults(), $data);
        } else {
            $data = $filter->getDefaults();
        }
        $filter->setData($data);
        if ($filter->isValid()) {
            return true;
        } else {
            if ($json) {
                $this->addFormMessages($filter);
            } else {
                $this->flashFormMessages($filter);
            }
            return false;
        }
    }

    /**
     * Iz forme vzame sporočila in jih pošlje v flash messenger
     *
     * @param Fieldset $form
     * @param EntityMetadata $meta
     */
    public function flashFormMessages($form)
    {

        $translator = $this->getServiceLocator()->get('translator');

        $messages = $form->getMessages();

        foreach ($messages as $field => $value) {
            $element = $form->get($field);
            if ($form->get($field) instanceof Fieldset) {
                $this->flashFormMessages($element);
            } else {
                $label = $element->getOption('label');
                if ($label) {
                    $label = $translator->translate($label, 'default');
                } else {
                    $label = $translator->translate($element->getName(), 'default');
                }
                foreach ($value as $mess) {
                    if (!is_array($mess)) {
                        $this->flashMessenger()->addErrorMessage($label . ": " . $translator->translate($mess));
                    } else {
                        foreach ($mess as $msg) {
                            $this->flashMessenger()->addErrorMessage($label . ": " . $translator->translate($msg));
                        }
                    }
                }
            }
        }
    }

    /**
     * 
     * 
     * @param Base $object
     * @param string $oper
     * @param string $class
     * @return boolean
     */
    public function flashShrani($object, $oper = 'update', $class = null)
    {
        $sr = $this->getRepository($class);
        $translator = $this->getServiceLocator()->get('translator');

        try {
            if (is_callable($this->shraniCallback)) {
                call_user_func($this->shraniCallback, $object, $data);
            } else {
                if ($oper == 'update') {
                    $sr->update($object);
                } else {
                    $sr->create($object);
                }
            }
            $this->getEm()->flush();
            $this->flashMessenger()->addSuccessMessage($translator->translate('Uspešno zapisano.'));
        } catch (\Exception $e) {
            $this->flashMessenger()->addErrorMessage($translator->translate('Zapisovanje ni uspelo!'));
            $this->flashMessenger()->addErrorMessage($e->getMessage());
            return false;
        }
        return true;
    }

   

    public function getPage()
    {
        return $this->page;
    }

    public function getSess()
    {
        return $this->sess;
    }

    public function getNast()
    {
        return $this->nast;
    }

    public function getPerm()
    {
        return $this->perm;
    }

    public function getOpts()
    {
        return $this->opts;
    }

    public function getHist()
    {
        return $this->hist;
    }

    function getAuthorizationService()
    {
        if (!$this->authorizationService) {
            $this->authorizationService = $this->serviceLocator->get('ZfcRbac\Service\AuthorizationService');
        }
        return $this->authorizationService;
    }

    function setAuthorizationService(AuthorizationService $authorizationService)
    {
        $this->authorizationService = $authorizatioService;
        return $this;
    }

    public function getEm()
    {
        if (!$this->em) {
            $this->em = $this->serviceLocator->get('doctrine.entitymanager.orm_default');
        }
        return $this->em;
    }

    public function setEm(EntityManager $em)
    {
        $this->em = $em;
        return $this;
    }

}
