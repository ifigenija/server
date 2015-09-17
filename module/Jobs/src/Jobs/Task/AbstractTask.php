<?php

namespace Jobs\Task;

use DateTime;
use Doctrine\ORM\EntityManager;
use Max\Expect\ExpectTrait;
use Max\Entity\Job;
use Zapisi\Entity\Datoteka;
use Zend\ServiceManager\ServiceLocatorAwareInterface;
use Zend\ServiceManager\ServiceLocatorAwareTrait;

/**
 * Abstraktni razred za job taske
 * Vsebuje funkcionalnosti zagona taska, logiranja in dodajanja reportov
 * 
 * @author g1smo
 */
abstract class AbstractTask implements ServiceLocatorAwareInterface
{
    use ServiceLocatorAwareTrait;
    use ExpectTrait;
    
    /**
     * Podatki za task
     */
    protected $data;
    
    /**
     * Job, ki izvaja task
     * 
     * @var Job
     */
    protected $job;
    
    /**
     * Entity manager
     * 
     * @var EntityManager
     */
    protected $em;


     
    public function __construct(Job $job, EntityManager $em)
    {
        $this->job = $job;
        $this->data = $job->getData();
        $this->em = $em;
        $this->jobManager = $this->em->getRepository('Jobs\Entity\Job');
    }

    /**
     * Zagon taska (poskrbi za spremembe status, lovljenje napak...
     * @param bool $throw
     * @throws \Exception
     */
    public function runTask($throw = false)
    {
        try {
            $this->job->setStatus(1);
            $this->em->flush();
            
            $this->taskBody();
            
            // Označi job kot uspešno končan
            $this->job->setStatus(2);
            $this->job->setAlert(true);
            $this->job->setIzveden(new DateTime());

            $this->em->flush();

        } catch (\Exception $e) {

            $msg = "Napaka pri izvajanju joba";
                $msg .= " ({$e->getCode()})";
            $msg .= ": " . $e->getMessage() . "\n";
            $msg .= $e->getTraceAsString();
            
            // Označi stanje napake in logiraj exception
            $this->log($msg);
            $this->job->setStatus(3);
            $this->job->setAlert(true);
            $this->job->setIzveden(new DateTime());
            
            $this->em->flush();
            
            if ($throw) {
                throw $e;
            }
        }
    }

    /**
     * Mora implementirat task class
     */
    abstract public function taskBody();

    /**
     * Dodaj log sporočilo na job
     * 
     * @param string $message
     */
    public function log($message)
    {
        $this->job->log($message);
    }

    /**
     * Dodaj report file na job
     *
     * @param string $name Ime reporta
     * @param array $file Datoteka reporta
     * @param string $filename Želeno ime datoteke reporta
     * @return Datoteka
     */
    public function addReport($name, array $file, $filename = null)
    {
        /* @var $dr \Zapisi\Repository\Datoteke */
        $dr = $this->em->getRepository('\Zapisi\Entity\Datoteka');
        $dr->setServiceLocator($this->serviceLocator);
        
        $report = new Datoteka();
        $report->setTitle($name);
        $report->setOwner($this->job->getUser());
        $report->setTransfers(0);
        $report->setCreatedAt(new DateTime());
        $report->setUploadedAt(new DateTime());
        
        $dr->shraniDatoteko($file, $report, $filename);
        $this->em->persist($report);
        $this->job->getReports()->add($report);
        
        return $report;
    }
    
    /**
     * Preveri, ali imamo primerne podatke za task
     */
    abstract public function checkData();
    

}