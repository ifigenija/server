<?php

namespace Aaa\Controller;

use Aaa\Form\LoginForm;
use Aaa\Navigation\User;
use Doctrine\ORM\EntityRepository;
use Exception;
use Tip\Controller\AbstractTipController;
use Tip\Exception\EntitetaNeObstaja;
use Tip\Exception\NepopolniParametriZaAkcijo;
use Zend\Console\Prompt\Line;
use Zend\Session\Container;
use Zend\View\Model\JsonModel;
use Zend\View\Model\ViewModel;

/**
 * Kontroler za uporabnike
 */
class UserController
    extends AbstractTipController
{

    use \Tip\Controller\ActionTrait\EntityPaginator,
        \Tip\Controller\ActionTrait\EntityPregled,
        \Tip\Controller\ActionTrait\EntityUredi,
        \Tip\Controller\ActionTrait\EntityBrisi,
        \Aaa\Controller\ActionTrait\RoleSelect;

    protected $entityClass = 'Aaa\Entity\User';

    /**
     * Prikaže seznam entitet v paginatorju
     *
     * @return ViewModel
     */
    public function indexAction()
    {
        $vm = $this->handleEntityPaginator('\Aaa\Form\Filter\Simple');

        $toolbar = new User($this);
        $this->setToolbar($toolbar->getIndexPages());

        return $vm;
    }

    /**
     * Akcija za REST metodo get list
     * @return JsonModel
     */
    public function getListAction()
    {
        $cache = $this->getServiceLocator()->get('cache.service');
        if (!$cache->contains('tip.userlist')) {
            $list = $sr->getList();
            $vm = new JsonModel($list);
            $cache->save('tip.userlist', $vm);
        } else {
            $vm = $cache->fetch('tip.userlist');
        }


        return $vm;
    }

    /**
     * Akcija za pregled ene entitete.
     * Naredi privzeto formo za entiteto in jo poveže
     * z entiteto. Potrebuje Id parameter route. formo prikaže disablano.
     *
     * @return ViewModel
     */
    public function pregledAction()
    {
        $object = $this->loadEntity();
        $vm = $this->handleEntityPregled($object);
        $vm->addChild($this->assignedRoles($object), 'assignedRoles');
        $toolbar = new User($this);
        $this->setToolbar($toolbar->getPregledPages());

        return $vm;
    }

    /**
     * Naredi formo za dodjanje entitete.
     * Če se forma validira shrani spremembo
     *
     * @return ViewModel
     */
    public function dodajAction()
    {

        $object = new $this->entityClass;
        $vm = $this->handleEntityDodaj($object);
        if ($vm instanceof ViewModel) {
            $toolbar = new User($this);
            $this->setToolbar($toolbar->getDodajPages());
            $vm->setTemplate('aaa/user/form');
        }
        return $vm;
    }

    /**
     * Naredi formo, poveže obstoječo entiteto , s formo.
     * Pri posti formo validira in
     * shrani spremembe
     *
     * @return ViewModel
     */
    public function urediAction()
    {
        $object = $this->loadEntity();
        $vm = $this->handleEntityUredi($object);
        if ($vm instanceof ViewModel) {
            $vm->setTemplate('aaa/user/form');
            $toolbar = new User($this);
            $this->setToolbar($toolbar->getUrediPages());
        }
        return $vm;
    }

    /**
     * Pokaže seznam dovoljen, ki so že na vlogi in seznam dovoljenj, ki že obstajajo
     *
     *
     * @return ViewModel
     */
    public function urediDovoljenjaAction()
    {

        $object = $this->loadEntity();
        $vm = $this->handleEntityUredi($object);
        if ($vm instanceof ViewModel) {
            $vm->addChild($this->assignedRoles($object, 'uredi'), 'assignedRoles');
            $toolbar = new User($this);
            $vm->addChild($this->roleList($object), 'roleList');
            $this->setToolbar($toolbar->getPregledPages());
        }

        return $vm;
    }

    /**
     * Briše obstoječo entiteto
     *
     * @return ViewModel
     */
    public function brisiAction()
    {
        $object = $this->loadEntity();
        $vm = $this->potrdiBrisanje($object);
        if (!($vm instanceof ViewModel)) {
            if ($vm === true) {
                $this->izvediBrisanje($object);
            }
            return $this->redirect()->toRoute('aaa', ['action' => 'index', 'controller' => 'User']);
        }
        return $vm;
    }

    /**
     * Prijava v aplikacijo.
     * Preveri identiteto in preusmeri na defaultno stran nastavljeno v nastavitvah uporabnika
     */
    public function loginAction()
    {
        $authService = $this->getServiceLocator()->get('Zend\Authentication\AuthenticationService');
        if (!$authService->getIdentity()) {
            $sr = $this->getRepository();
            $this->layout('layout/regular');
            $login = new LoginForm();

            if ($this->getRequest()->isPost()) {
                if ($this->params()->fromPost('username') && $this->params()->fromPost('password')) {
                    $authenticate = $sr->login(
                        $this->params()->fromPost('username'), $this->params()->fromPost('password')
                    );
                    if ($authenticate) {
                        $route = $this->identity()->defaultRoute;
                        $params = array_filter(explode("\r\n", $this->identity()->defaultRouteParams));
                        if (!empty($params)) {
                            $param = [];
                            foreach ($params as $p) {
                                list ($k, $v) = explode('=>', $p);
                                $param[$k] = $v;
                            }
                            return $this->redirect()->toRoute($route, $param);
                        } else {
                            if ($route) {
                                return $this->redirect()->toRoute($route);
                            } else {
                                return $this->redirect()->toRoute('home');
                            }
                        }
                    } else {
                        $this->flashMessenger()->addErrorMessage('Prijavni podatki niso veljavni');
                    }
                } elseif ($this->params()->fromPost('nazaj')) {
                    unset($info->user);
                    return $this->redirect()->refresh();
                } elseif ($this->params()->fromPost('username')) {
                    $login->setData($this->request->getPost());
                    if ($login->isValid())
                        $info->user = $login->get('username')->getValue();
                    return $this->redirect()->refresh();
                }
            }
        } else {
            $msg = "Si že prijavljen. <a href=" 
                . $this->url()->fromRoute('login', ['action' => 'logout']) 
                . ">Klikni za odjavo</a>";
            $this->flashMessenger()->addErrorMessage($msg);
            return $this->redirect()->toRoute('home');
        }
        $v = new ViewModel([
            'form' => $login
        ]);

        return $v;
    }

    /**
     * Odjava iz aplikacije
     * @todo popolnoma izprazni session in session storage na brskalniku
     */
    public function logoutAction()
    {
        $info = new Container('login');
        unset($info->user);
        $authService = $this->getServiceLocator()->get('Zend\Authentication\AuthenticationService');
        $authService->clearIdentity();
        return $this->redirect()->toRoute('login');
    }

    /**
     * Omogoči/Onemogoči uporabnika
     *
     * @param string $usr
     *            Uporabniško ime
     *
     * @return string
     */
    public function enableAction()
    {
        $console = $this->getServiceLocator()->get('console');
        $request = $this->getRequest();
        $usr = $request->getParam('username');
        if ($request->getParam('mode') == 'enable') {
            $act = true;
            $msg = 'Omogočen';
        } else {
            $act = false;
            $msg = 'Onemogočen';
        }

        try {
            $sr->enable($usr, $act);
            $this->getEm()->flush();
        } catch (Exception $e) {
            $console->writeLine('Napaka - ' . $e->getMessage());
            return;
        }
        return "Uporabnik $usr $msg...\n";
    }

    /**
     * Akcija za spremembo uporabnikovega gesla
     *
     */
    public function changePasswordAction()
    {
        $authService = $this->getServiceLocator()->get('Zend\Authentication\AuthenticationService');
        $user = $authService->getIdentity();
        $fm = $this->serviceLocator->get('FormElementmanager');
        $form = $fm->get('Aaa\Form\ChangePasswordForm');

        if ($this->request->isPost()) {
            $form->setData($this->request->getPost());
            if ($form->isValid()) {
                $p1 = $form->get('password')->getValue();
                $p2 = $form->get('password2')->getValue();
                if ($p1 === $p2) {
                    $user->setPassword($p1);
                    try {
                        $this->getEm()->flush();
                        $this->flashMessenger()->addInfoMessage('Geslo uspešno zamenjano');
                    } catch (Exception $e) {
                        $this->flashMessenger()->addErrorMessage('Napaka pri menjavi gesla');
                        $this->flashMessenger()->addErrorMessage($e);
                    }
                } else {
                    $this->flashMessenger()->addErrorMessage('Gesli se ne ujemata!');
                }
            } else {
                $this->flashFormMessages($form);
            }
        }

        return new ViewModel(['form' => $form]);
    }

    /**
     * Menjava gesla
     *
     * @param string $username     Uporabniško ime
     *
     * @return string
     */
    public function passwordAction()
    {
        $console = $this->getServiceLocator()->get('console');
        $pass = Line::prompt('Vnesi geslo:', false, 20);
        $username = $this->getRequest()->getParam('username');

        try {
            $sr = $this->getRepository();
            $user = $sr->findOneBy(['username' => $username]);
        } catch (Exception $e) {
            $console->writeLine('Napaka - ' . $e->getMessage());
            return;
        }
        return "Geslo zamenjano\n";
    }

    /**
     * Sproži job za update vmesnih tabel uporabniških pravic 
     * 
     */
    public function updateCacheAction()
    {
                
        /* @var $jm \Workflow\Repository\JobManager */
        $jm = $this->serviceLocator->get('jobmanager.service');
        try {
            $job = $jm->createJob([
                'name' => 'Posodobi user cache',
                'task' => 'Aaa\Task\UpdateUserCacheTask',
                'data' => []
            ]);
            $jm->runJob($job, ['throw'=>1]);
            return $this->getErrors();
        } catch (\Exception $ex) {
            $this->addErrorFromException($ex);
            if ($ex->getPrevious()) {
                $this->addErrorFromException($ex->getPrevious());
            }
            return $this->getErrors();
        }

        
    }

}
