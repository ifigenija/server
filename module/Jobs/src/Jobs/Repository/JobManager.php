<?php

namespace Jobs\Repository;

use Aaa\Entity\User;
use DateTime;
use Doctrine\Common\Annotations\AnnotationReader;
use Doctrine\Common\Annotations\CachedReader;
use Doctrine\ORM\Tools\Pagination\Paginator;
use DoctrineORMModule\Paginator\Adapter\DoctrinePaginator;
use Jobs\Annotation\Task\Meta;
use Jobs\Entity\Job;
use Jobs\Exception\BadTaskDataException;
use Jobs\Task\AbstractTask;
use Max\Exception\MaxException;
use Max\Repository\AbstractMaxRepository;
use ReflectionClass;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use ZfcRbac\Service\AuthorizationService;

/**
 * Job manager - upravljalnik jobov
 */
class JobManager
    extends AbstractMaxRepository
    implements ServiceLocatorAwareInterface
{

    /**
     * Hrani default sort opcije, ki se uporabljajo na seznamih
     *
     * @var array
     */
    protected $sortOptions = [
        'default' => [
            'cas_izvedbe' => [
                'alias' => 'j.casIzvedbe'
            ]
        ]
    ];

    /**
     * A je bil kak job ustvarjen?
     * @var boolean
     */
    protected $created = false;

    /**
     * Iskanje za privzeto
     *
     * @param array $options
     * @param string $name
     * @return Paginator
     * @throws MaxException
     */
    public function getPaginator(array $options, $name = 'default')
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('j');
        $qb->from('\Jobs\Entity\Job', 'j');
        $qb->join('j.user', 'user');
        $qb->join('j.reports', 'reports');
        $sort = $this->getSort($name);
        $qb->orderBy($sort->order, $sort->dir);

        if ($srch) {

        }
        return new DoctrinePaginator(new Paginator($qb));
    }

    public function getInputHydrator()
    {
        return parent::getJsonHydrator([
            'exclude' => [
                'user',
                'reports',
                'data',
                'log',
                'name',
                'task',
                'status',
                'datum'
            ]
        ]);
    }

    /**
     * Uredi job
     *
     * @param Job $job
     * @param array $data
     * @throws MaxException
     */
    public function updateJob(Job $job, $data)
    {
        $job = $this->getInputHydrator()->hydrate($data, $job);

        if ($job->getStatus() < 0 || $job->getStatus() > 3)
            throw new MaxException('Status joba je neveljaven', 7700002);

        $this->getEntityManager()->flush($job);
    }

    public function getJsonHydrator($options = [])
    {
        return parent::getJsonHydrator(array_merge_recursive([
            'byValue' => [
                'user',
                'reports'
            ],
            'exclude' => [
                'data',
                'user.roles',
                'user.hierRoles',
                'user.groups',
                'user.email'
            ]
        ], $options));
    }

    /**
     * Pridobi seznam jobov
     * @param null $user
     * @param $options array options: active, since,all
     * @return array
     */
    public function listJobs($user = null, $options = [])
    {
        $qb = $this->getEntityManager()->createQueryBuilder();
        $e  = $qb->expr();
        $qb->select('j')->from('Jobs\Entity\Job', 'j');

        if ($user) {
            $qb->andWhere('j.user = :user');
            $qb->setParameter('user', $user);
        }

        if (isset($options['since']) && is_numeric($options['since'])) {
            $dat = new \DateTime();
            $dat->sub(new \DateInterval('PT' . intval(($options['since'] + 3000) / 1000) . 'S'));
            $qb->andWhere($e->orX($e->gte('j.datum', ':datum'), $e->gte('j.izveden', ':datum'), $e->eq('j.status', 1)));
            $qb->setParameter('datum', $dat->format(DATE_ISO8601), 'string');

            $qb->andWhere($e->orX($e->eq("j.hidden", "FALSE"), $e->isNull("j.hidden")));
        }
        if (isset($options['activeJobs']) && $options['activeJobs'] == 1) {
            $qb->andWhere($e->orX($e->eq("j.hidden", "FALSE"), $e->isNull("j.hidden")));
        }
        if (isset($options['all']) && $options['all'] == 1) {
            $qb->andWhere($e->eq("j.hidden", "TRUE"));
        }

        $qb->setMaxResults(12);
        $qb->orderBy('j.izveden', 'DESC');
        $qb->orderBy('j.casIzvedbe', 'DESC');

        return array_reverse($qb->getQuery()->getResult());
    }

    /**
     * Vrne seznam jobov, ki se morajo izvesti
     */
    public function listReadyJobs()
    {
        $qb = $this->getEntityManager()->createQueryBuilder();
        $qb->select('j')->from('Jobs\Entity\Job', 'j');

        $qb->where('j.status = 0');
        $qb->andWhere('j.casIzvedbe <= :now');
        $qb->setParameter(':now', new DateTime());

        $qb->orderBy('j.casIzvedbe');

        return $qb->getQuery()->getResult();
    }

    /**
     * Ustvari nov job
     * $data:
     * name: ime joba
     * task: job task
     * date: datum izvedbe
     * user: uporabnik, ki je prožil job
     * sync: proži job takoj?
     * data: podatki za task
     *
     * @param array $params
     * @return Job
     */
    public function createJob(array $params)
    {
        $job = new Job();
        // nastavi parametre za task in njihove defaulte
        $this->configureJob($job, $params);

        // Preveri pravilnost taska
        $this->checkTask($job);


        // če je zahtevana sinhrona izvedba, potem se job kar požene 
        if (isset($params['sync']) && $params['sync']) {
            $this->runJob($job);
            $job->setAlert(false);
        }

        return $job;
    }

    /**
     * Iz vhodnih parametrov nastavi vse potrebne parametre ali pa
     * sproži napako
     *
     * @param Job $job
     * @param array $params
     * @throws MaxException
     */
    public function configureJob($job, $params)
    {

        // če class taska ne obstaja, potem nimamo kaj delati
        if (empty($params['task']) || !class_exists($params['task'])) {

            throw new MaxException('Task ne obstaja' . $params['task'], 7700101);
        }

        $job->setTask($params['task']);

        // preberemo anotacije na tasku
        $meta = $this->getTaskMeta($job);

        /* @var $acl AuthorizationService */
        $acl = $this->getAuthorizationService();

        // nastavimo uporabnika joba - samodejno, ali pa iz parametrov
        if (!empty($params['user']) && $params['user'] instanceof User) {
            $job->setUser($params['user']);
        } else {
            $job->setUser($acl->getIdentity());
        }

        // preverim, če ima uporabnik dostop do zagona job-a
        if (!empty($meta->acl)) {
            if (!$acl->isGranted($meta->acl)) {
                throw new MaxException('Uporabnik nima dovoljenja za izvajanje taska', 7700056);
            }
        } else {
            throw new MaxException('Dovoljenje na tasku ni določeno', 7700054);
        }

        // nastacimo "lepo ime job-a
        if (!empty($params['name'])) {
            $job->setName($params['name']);
        } else {
            $job->setName($meta->name ?: $params['task']);
        }

        $job->setStatus(0);
        $job->setDatum(new DateTime());
        $job->setData($params['data']);

        if (isset($params['date']) && $params['date'] instanceof DateTime) {
            $job->setCasIzvedbe($params['date']);
        } else {
            $job->setCasIzvedbe(new DateTime());
        }

        $job->setHidden(isset($params['hidden']) ? true : false);
        $this->getEntityManager()->persist($job);
        $this->getEntityManager()->flush($job);
    }

    /**
     * Pridobivanje metapodatkov o tasku iz annotacija
     *
     * @param Job $job
     * @return Meta Task Metadata
     */
    public function getTaskMeta(Job $job)
    {
        $em    = $this->getEntityManager();
        $class = $job->getTask();

        $cache = $em->getConfiguration()->getMetadataCacheImpl();


        $meta = new Meta();

        if (class_exists($class)) {


            // naložim metapodatke iz anotacij
            $reader = new AnnotationReader();

            $annotationReader = new CachedReader($reader, $cache);

            $reflClass = new ReflectionClass($class);

            $classAnn = $annotationReader->getClassAnnotations($reflClass);

            // metapodatki za class
            if ($classAnn) {
                foreach ($classAnn as $ann) {
                    if ($ann instanceof Meta) {
                        $meta = $ann;
                    }
                }
            }
        }
        $meta->name = $meta->name ?: $class;
        return $meta;
    }

    /**
     * Preveri, ali je task joba izvedljiv
     *
     * @param Job $job
     * @return AbstractTask
     * @throws MaxException
     * @throws BadTaskDataException
     */
    public function checkTask(Job $job)
    {
        $task = $job->getTask();
        if (!class_exists($task)) {
            throw new MaxException('Task ne obstaja' . $task, 7700001);
        }

        if (!($job->getUser() instanceof User)) {
            throw new MaxException('Job nima nastavljenega uporabnika' . $task, 7700099);
        }

        try {
            /** @var AbstractTask $inst */
            $inst = new $task($job, $this->getEntityManager());
            $inst->setServiceLocator($this->getServiceLocator());
            $inst->checkData();
            return $inst;
        } catch (\Exception $e) {
            throw new BadTaskDataException('napačni podatki za task', 500, $e);
        }
        //  } else {
        //      throw new \Tip\Exception\DostopZavrnjen('Nimate dovoljenja ta izvajanje opravila', 7700099);
        //  }
    }

    /**
     * Poženi job (izvedi task)
     *
     * @param Job $job
     * @param array $args
     * @throws MaxException
     * @throws \Exception
     * @throws BadTaskDataException
     */
    public function runJob(Job $job, $args = [])
    {
        if ($job->getStatus() != 0)
            throw new MaxException('Neveljavno stanje joba', 7700006);

        $task = $this->checkTask($job);
        $task->runTask(isset($args['throw']));
    }

    /**
     * Vrne job v čakanje
     *
     * @param Job $job
     */
    public function resetJob(Job $job)
    {
        $job->setStatus(0);
        $job->setLog(null);

        // Pobrišem reporte
        $dr      = $this->getEntityManager()->getRepository('Zapisi\Entity\Datoteka');
        $reports = $job->getReports();
        $job->getReports()->clear();
        foreach ($reports as $rep) {
            $dr->brisiDatoteko($rep, null, $user);
        }

        $job->setIzveden(null);
        $job->setAlert(null);
        $this->getEntityManager()->flush($job);
    }

    /**
     * Spremeni status joba v napako, tudi če je v izvajanju
     *
     * @param Job $job
     * @param string $error Sporočilo napake
     */
    public function failJob(Job $job, $error)
    {
        $job->setStatus(3);
        $job->setLog("{$job->getLog()}$error");

        $job->setIzveden(new DateTime());
        $job->setAlert(true);
        $this->getEntityManager()->flush($job);
    }

    /**
     * Serializiraj entitete za vnos v bazo.
     * Vrne polje oblike
     * @param $entities
     * @return array
     */
    public function serializeEntities($entities)
    {
        $ent_out = [];
        foreach ($entities as $e)
            $ent_out[] = $e->getId();
        return $ent_out;
    }

    /**
     * Obstajajo čakajoči jobi za userja?
     * @return bool
     *
     */
    public function myJobsWaiting()
    {
        /* @var $acl \Tip\Service\ACLService */
        $acl = $this->getAuthorizationService();
        if ($acl->getIdentity()) {
            return $this->jobsWaiting($acl->getIdentity()->getId());
        }
        return false;
    }

    /**
     * Obstajajo čakajoči jobi za userja?
     *
     * @param string $user
     * @return boolean
     */
    public function jobsWaiting($user = null)
    {
        $qb = $this->getEntityManager()->createQueryBuilder();
        $e  = $qb->expr();
        $qb->select('j')->from('\Jobs\Entity\Job', 'j')->where($e->lt('j.status', 2));

        if ($user) {
            $qb->andWhere('j.user = :user');
            $qb->setParameter('user', $user);
        }

        $jobs = $qb->getQuery()->getResult();

        return count($jobs) > 0;
    }

    /**
     * Vrne extractano verzijo job-a
     *
     * @param Job $job
     * @return array
     */
    public function jobJson(Job $job)
    {
        $hydr = $this->getJsonHydrator();

        $meta               = $this->getTaskMeta($job);
        $jobArr             = $hydr->extract($job);
        $jobArr['taskName'] = $meta->name;
        $jobArr['taskMeta'] = $this->getTaskMeta($job);

        return $jobArr;
    }

}
