<?php

namespace Tip\Controller;

use Exception;
use Tip\Annotation\EntityMetadata;
use Tip\Service\ACLService;
use Zend\Form\Fieldset;
use Zend\Mvc\MvcEvent;
use Zend\Paginator\Paginator;
use Zend\View\Model\JsonModel;

class AbstractRestfulController extends \Zend\Mvc\Controller\AbstractRestfulController
{
    /**
     * Vračanje napak ajax klicov
     */
    use JsonErrorsTrait;

    

    /**
     *  Servis za dostop do ACL-jev
     * @var \ZfcRbac\Service\AuthorizationService
     */
    protected $authorization;

    /**
     *  @var EntityManager

      protected $em;
     */

    /**
     * Ali getList vrne seznam objektov če je query prazen
     *
     * @var boolean
     */
    protected $listAllIfEmptyQuery = false;

    public function init() {}

    /**
     * Dispatch metoda
     *
     * @param MvcEvent $e
     * @return mixed
     */
    public function onDispatch(MvcEvent $e)
    {
        $this->authorization = $this->serviceLocator->get('ZfcRbac\Service\AuthorizationService');
        $this->em = $this->serviceLocator->get('doctrine.entitymanager.orm_default');

        $this->init();
        return parent::onDispatch($e);
    }

    /**
     * Vrne metapodatke iz paginatorja za enkodiranje v JSON
     *
     * @param Paginator $paginator
     */
    public function getPaginatorArray($paginator)
    {
        if ($paginator instanceof Paginator) {
            if ($paginator->getItemCountPerPage() < 1) {
                $lastPage = 1;
            } else {
                $lastPage = ceil($paginator->getTotalItemCount() / $paginator->getItemCountPerPage());
            }
            return [ 'currentPage' => $paginator->getCurrentPageNumber(),
                'totalRecords' => $paginator->getTotalItemCount(),
                'lastPage' => $lastPage,
                'pageSize' => $paginator->getItemCountPerPage(),
            ];
        } else {
            $c = count($paginator);
            return ['currentPage' => 1,
                'totalRecords' => $c,
                'lastPage' => 1,
                'pageSize' => max($c,1)];
        }
    }

    /**
     * Nastavi stran in količino na stran iz query parametrov
     *
     * @param Paginator $paginator
     */
    public function setPaginatorParams($paginator)
    {
        if ($paginator->getDefaultItemCountPerPage() > 1) {
            $paginator->setCurrentPageNumber($this->params()->fromQuery('page', 1));
            $paginator->setItemCountPerPage($this->params()->fromQuery('per_page', $paginator->getItemCountPerPage()));
        }
    }



    /**
     * Posreduje podatke o zahtevanem sortu v repositorij
     * Poskrbi za persistenco sort podatkov v sessionu
     *
     * @param AbstractTipRepository $repository
     * @param string $paginatorName
     */
    public function manageSort($repository, $paginatorName = 'default',  $suffix = 'sort')
    {

        if ($this->params()->fromQuery('sort_by')) {
            $field = $this->params()->fromQuery('sort_by');
            $dir = $this->params()->fromQuery('order');
            if (!$dir) {
                $so = $repository->getSort();
                if (isset($so->options[$field]['dir']))
                    $dir = $so->options[$field]['dir'];
                else
                    $dir = 'ASC';
            }
            $repository->setSort($field, $dir, $paginatorName);
        }
    }

}

