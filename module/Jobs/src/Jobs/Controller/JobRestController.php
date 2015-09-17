<?php

namespace Jobs\Controller;

use Jobs\Repository\JobManager;
use Max\Controller\Traits\EntityTrait;
use Max\Controller\Traits\JsonErrorsTrait;
use Zend\Mvc\Controller\AbstractRestfulController;
use Zend\View\Model\JsonModel;

/**
 * Controller za pregled čakalnice opravil
 *
 * @author g1smo
 */
class JobRestController
    extends AbstractRestfulController
{

    use JsonErrorsTrait;
    use EntityTrait;


    /**
     * JSON hidrator za jobe
     */
    protected $hydr;

    /**
     * @return mixed
     */
    public function getHydrator()
    {

        /** @var JobManager $jr */
        $jr = $this->getServiceLocator()->get('jobmanager.service');
        return $jr->getJsonHydrator(['exclude' => 'user.roles']);
    }

    /**
     * Ustvari nov job glede na prejete podatke
     *
     * @param array $data
     * @return JsonModel
     */
    public function create($data)
    {
        try {

            if (!$this->isGranted('Job-write')) {
                $this->addError('Dostop zavrnjen!', 'TIP-DAT-0103');
                return $this->getErrors();
            }
            /** @var JobManager $jr */
            $jr = $this->getServiceLocator()->get('jobmanager.service');


            $job = $jr->createJob($data);
            $this->em->flush();
            $j = $jr->getHydrator()->extract($job);
            $this->getResponse()->setStatusCode(201);
            return new JsonModel($j);
        } catch (\Exception $e) {
            $this->addErrorFromException($e);
            return $this->getErrors();
        }
    }

    /**
     * Spremeni job
     * @param string $id
     * @param array $data
     * @return JsonModel
     * @throws EntitetaNeObstaja
     */
    public function update($id, $data)
    {
        try {
            if (!$this->isGranted('Job-write')) {
                $this->addError('Dostop zavrnjen!', 'TIP-DAT-0103');
                return $this->getErrors();
            }

            $user = $this->authorization->getIdentity();
            /** @var JobManager $jr */
            $jr = $this->getServiceLocator()->get('jobmanager.service');


            $job = $jr->find($id);
            if (!$job) {
                throw new EntitetaNeObstaja();
            }
            // Preverim, ali user lahko ureja job

            if (($job->getUser() !== $user) && !$this->isGranted('Job-admin')) {
                $this->addError('Dostop zavrnjen!', 'TIP-DAT-0103');
                return $this->getErrors();
            }

            $jr->updateJob($job, $data);

            $this->em->flush();

            $j = $jr->getHydrator()->extract($job);

            //$this->getResponse()->setStatusCode(200);
            return new JsonModel($j);
        } catch (\Exception $e) {
            $this->addErrorFromException($e);
            return $this->getErrors();
        }
    }

    /**
     * Vrne seznam vseh jobov uporabnika (ali pa vseh, če je admin)
     *
     * @return JsonModel
     */
    public function getList()
    {
        try {
            if (!$this->isGranted('Job-read')) {
                $this->addError('Dostop zavrnjen!', 'TIP-DAT-0103');
                return $this->getErrors();
            }
            /** @var JobManager $jr */
            $jr = $this->getServiceLocator()->get('jobmanager.service');

            // ACL ček za vse ali uporabnikove jobe
            if (!$this->isGranted('Job-admin')) {
                $user = $this->authorization->getIdentity();
            } else {
                $user = null;
            }
            $options = $this->params()->fromQuery();
            $jobs = $jr->listJobs($user, $options);

            $joblist = [];
            if (count($jobs) > 0) {
                $hydr = $jr->getJsonHydrator();

                foreach ($jobs as $job) {
                    $arr = $hydr->extract($job);

                    $arr['taskMeta'] = $jr->getTaskMeta($job);
                    $joblist[] = $arr;
                }
            }
            return new JsonModel($joblist);
        } catch (\Exception $e) {
            $this->addErrorFromException($e);
            return $this->getErrors();
        }
    }

    /**
     * Vrne posamezen job
     *
     * @param mixed $id
     * @return JsonModel
     */
    public function get($id)
    {
        try {
            if (!$this->isGranted('Job-read')) {
                $this->addError('Dostop zavrnjen!', 'TIP-DAT-0103');
                return $this->getErrors();
            }
            /** @var JobManager $jr */
            $jr = $this->getServiceLocator()->get('jobmanager.service');

            $job = $jr->find($id);

            // ACL ček za vse ali uporabnikove jobe
            $res = 'Job-admin';
            if (!$this->isGranted($res)) {
                $user = $this->authorization->getIdentity();

                if (!($user === $job->getUser())) {
                    $this->addError('Dostop zavrnjen!', 'TIP-DAT-0103');
                    return $this->getErrors();
                }
            }
            return $jr->jobJson($job);
        } catch (\Exception $e) {
            $this->addErrorFromException($e);
            return $this->getErrors();
        }
    }

}
