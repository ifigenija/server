<?php

namespace Jobs\Controller;

use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Jobs\Entity\Job;
use Jobs\Repository\JobManager;
use Max\Controller\ActionController;
use Max\Exception\MaxException;
use Max\Form\JsonForm;
use Zend\Console\ColorInterface;
use Zend\Console\Request;
use Zend\Paginator\Paginator;
use Zend\View\Model\ConsoleModel;
use Zend\View\Model\ViewModel;

/**
 * Controller za pregled čakalnice opravil
 *
 * @author g1smo
 */
class JobController extends ActionController
{

    /**
     * Tip session
     */
    public $sess;
    /**
     * Repozitorij entitet
     *
     * @var JobManager
     */
    protected $jr;
    /**
     * Razred entitete
     * @var string
     */
    protected $entityClass = 'Jobs\Entity\Job';
    /**
     * Filter za parsanje imena entitet
     *
     * @var \App\Filter\StripEntity
     */
    protected $f;
    /**
     * Filter za parsanje imena entitet kratko -> polno
     *
     * @var \App\Filter\DecorateEntity
     */
    protected $f1;

    /**
     * Prikaže seznam vseh jobov
     */
    public function listAction()
    {
        $formManager = $this->serviceLocator->get('FormElementManager');

        /** @var JsonForm $form */
        $form        = $formManager->get('Tip\Form\Filter\Simple');

        $form->setName('filter');

        if ($this->request->isPost()) {
            return $this->redirect()->refresh();
        }

        /** @var JobManager $jr */
        $jr = $this->getServiceLocator()->get('jobmanager.service');

        $form->setData($this->request->getPost());
        if ($form->isValid()) {
            $list      = $jr->getPaginator($form->getData());
            $paginator = new Paginator(new DoctrinePaginator(($list)));

            $page = ($this->request->getQuery('page')) ? $this->request->getQuery('page') : 1;
            $paginator->setCurrentPageNumber($page);

        } else {
            $paginator = null;
        }

        $vm = new ViewModel([
            'filter'    => $form,
            'paginator' => $paginator
        ]);
        return $vm;
    }

    /**
     * Izpiše seznam čakajočih jobov (command line ukaz)
     */
    public function cmdListAction()
    {
        if (!$this->getRequest() instanceof Request)
            return 'Akcija je namenjena konzoli';

        $console = $this->getServiceLocator()->get('console');

        /** @var JobManager $jr */
        $jr = $this->getServiceLocator()->get('jobmanager.service');

        $jobs   = $jr->findBy(['status' => '0']);
        $output = "";
        /** @var Job $job */
        foreach ($jobs as $job) {
            $output .= "{$job->getId()}\t";
            $output .= "{$console->colorize($job->getUser()->getEmail(), ColorInterface::RED)}\t";
            $output .= "{$job->getName()}\n";
        }
        return $output;
    }

    /**
     * Izpiše seznam jobov v izvajanju (command line ukaz)
     */
    public function cmdListRunningAction()
    {
        if (!$this->getRequest() instanceof Request) {
            return 'Akcija je namenjena konzoli';
        }

        $console = $this->getServiceLocator()->get('console');
        /** @var JobManager $jr */
        $jr = $this->getServiceLocator()->get('jobmanager.service');

        $jobs = $jr->findByStatus(1);

        $output = "";
        /** @var Job $job */
        foreach ($jobs as $job) {
            $output .= "{$job->getId()}\t";
            $output .= "{$console->colorize($job->getUser()->getEmail(), ColorInterface::RED)}\t";
            $output .= "{$job->getName()}\n";
        }
        return $output;
    }

    /**
     * Poženi job, ki čaka (command line ukaz)
     */
    public function cmdRunAction()
    {
        $console = $this->getServiceLocator()->get('console');

        if (!$this->getRequest() instanceof Request) {
            return 'Akcija je namenjena konzoli';
        }

        $id = $this->getRequest()->getParam('id');

        try {
            /** @var JobManager $jr */
            $jr = $this->getServiceLocator()->get('jobmanager.service');


            $job = $jr->find($id);
            if (!$job)
                throw new MaxException('Job ne obstaja', 7700005);

            if ($job->getStatus() != 0)
                throw new \Exception("Zaganjamo lahko samo čakajoče jobe");
        } catch (\Exception $e) {
            return $console->colorize("Napaka: {$e->getMessage()}\n", ColorInterface::RED);
        }

        $jr->runJob($job);

        if ($job->getStatus() == 2) {
            return $console->colorize("Job uspešno izveden\n", ColorInterface::GREEN);
        } else {
            return $console->colorize("Prišlo je do napake. Log lahko pogledaš z ukazom \"tip2 job log {$job->getId()}\"\n", ColorInterface::RED);
        }
    }


    /**
     * Poženi vse jobe v čakanju (command line ukaz)
     */
    public function cmdRunAllAction()
    {
        $console = $this->getServiceLocator()->get('console');

        if (!$this->getRequest() instanceof Request)
            return 'Akcija je namenjena konzoli';

        $output = "";
        /** @var JobManager $jr */
        $jr = $this->getServiceLocator()->get('jobmanager.service');


        $jobs = $jr->listReadyJobs();
        foreach ($jobs as $job) {
            $jr->runJob($job);
            if ($job->getStatus() == 2) {
                $output .= $console->colorize("Job uspešno izveden\n", ColorInterface::GREEN);
            } else {
                $output .= $console->colorize("Prišlo je do napake. Log lahko pogledaš z ukazom \"tip2 job log {$job->getId()}\"\n", ColorInterface::RED);
            }
        }
        return $output;
    }

    /**
     * Preglej log joba (command line ukaz)
     */
    public function cmdLogAction()
    {
        $console = $this->getServiceLocator()->get('console');
        if (!$this->getRequest() instanceof Request) {
            return 'Akcija je namenjena konzoli';
        }

        $id = $this->getRequest()->getParam('id');
        try {
            /** @var JobManager $jr */
            $jr = $this->getServiceLocator()->get('jobmanager.service');


            $job = $jr->find($id);
            if (!$job) {
                throw new MaxException('Job ne obstaja', 7700305);
            }
            $log = $job->getLog();
            return !$log ? "Log je prazen\n" : $log;
        } catch (\Exception $e) {
            return $console->colorize("Napaka: {$e->getMessage()}\n", ColorInterface::RED);
        }

    }

    /**
     * Vrni job v čakanje (command line ukaz)
     */
    public function cmdResetAction()
    {
        $console = $this->getServiceLocator()->get('console');
        if (!$this->getRequest() instanceof Request) {
            return 'Akcija je namenjena konzoli';
        }

        $id = $this->getRequest()->getParam('id');

        try {
            /** @var JobManager $jr */
            $jr = $this->getServiceLocator()->get('jobmanager.service');


            $job = $jr->find($id);
            if (!$job) {
                throw new MaxException('Job ne obstaja', 7700205);
            }

            $jr->resetJob($job);

            if ($job->getStatus() == 0) {
                return $console->colorize("Job vrnjen v čakanje\n", ColorInterface::GREEN);
            }
        } catch (\Exception $e) {
            $output = new ConsoleModel();
            $output->setResult($console->colorize("Napaka: {$e->getMessage()}\n", ColorInterface::RED));
            $output->setErrorLevel(1);

            return $output;
        }
    }

    /**
     * Sproži napako v jobu
     */
    public function cmdFailAction()
    {
        $console = $this->getServiceLocator()->get('console');
        if (!$this->getRequest() instanceof Request) {
            return 'Akcija je namenjena konzoli';
        }

        $id      = $this->getRequest()->getParam('id');
        $message = $this->getRequest()->getParam('error');

        try {
            /** @var JobManager $jr */
            $jr = $this->getServiceLocator()->get('jobmanager.service');

            $job = $jr->find($id);
            if (!$job) {
                throw new MaxException('Job ne obstaja', 7700405);
            }
            $jr->failJob($job, $message);

            return $console->colorize("Job postavljen v stanje neuspešno zaključen\n", ColorInterface::RED);
        } catch (\Exception $e) {
            $output = new ConsoleModel();
            $output->setResult($console->colorize("Napaka: {$e->getMessage()}\n", ColorInterface::RED));
            $output->setErrorLevel(1);
            return $output;
        }
    }

}
