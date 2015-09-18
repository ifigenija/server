<?php

namespace Jobs\Task;

use DateTime;
use Doctrine\ORM\EntityManager;
use Jobs\Entity\Report;
use Jobs\Repository\Reports;
use Max\Exception\MaxException;
use Max\Expect\ExpectTrait;
use Jobs\Entity\Job;
use Zapisi\Entity\Datoteka;
use Zend\Filter\Word\SeparatorToSeparator;
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
        $this->job        = $job;
        $this->data       = $job->getData();
        $this->em         = $em;
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
        /* @var $dr Reports */
        $dr = $this->em->getRepository('Jobs\Entity\Report');
        $dr->setServiceLocator($this->serviceLocator);

        $report = new Report();
        $report->setTitle($name);
        $report->setTransfers(0);
        $report->setCreatedAt(new DateTime());

        $this->shraniDatoteko($file, $report, $filename);
        $this->em->persist($report);
        $this->job->getReports()->add($report);

        return $report;
    }

    /**
     * Shrani vsebino datoteke na pravo mesto
     * Uporablja se pri uploadu datoteke in v v drugih delih
     *
     * @param array $file
     * @param Report $report objekt datoteke
     * @param string $filename Želeno ime datoteke (privzeto je isto kot datoteka, ki jo dodajamo)
     */
    public function shraniDatoteko($file, Report $report = null, $filename = null)
    {
        if (array_key_exists('tmp_name', $file)) { // uploaded file array...
            $src  = $file['tmp_name'];
            $name = $file['name'];
        } else {
            $name = basename($file['name']);
            $src  = $file['name'];
        }

        if (array_key_exists('type', $file)) {
            $type = $file['type'];
        } else {
// boljše ugotovi tip s Fileinfo - php extensionom
            $type = 'application/octet-stream';
        }
        $stat = stat($src);
        $hash = hash_file('md5', $src);

        if (!$report) {
            $report = new Report();
            $report->setTitle($filename);
            $report->setTransfers(0);

            $report->setCreatedAt(new \DateTime());
        }

        $report->setHash($hash);
        if ($filename) {
            $report->setFilename($filename);
        } else {
            $report->setFilename($name);
        }
        $report->setFormat($type);
        $report->setSize($stat['size']);

        if (!$this->checkSameFileExists($hash, $stat['size'])) {
            $destFileName = $this->zagotoviFolder($hash);
            if (is_uploaded_file($src)) {
                move_uploaded_file($src, $destFileName);
            } else {
                rename($src, $destFileName);
            }
            chmod($destFileName, '0775');
        }
    }

    /**
     * Vrne privzeti root upload direktorija
     *
     * @param $hash
     * @return string
     * @throws MaxException
     * @todo - zagotovi možnost določitve upload direktorija v konfigu
     */
    public function getUploadDirectory($hash)
    {
        $dir = 'data/upload';

        if (!is_dir($dir)) {
            throw new MaxException('Upload direktorij ne obstaja', 'TIP-DAT-0113');
        }

        if (!is_writable($dir)) {
            throw new MaxException("Upload direktorij $dir ni zapisljiv", '0114');
        }

        for ($ii = 1; $ii <= 4; $ii++) {
            $dir .= '/' . substr($hash, $ii - 1, 1);
        }

        return $dir;
    }


    /**
     * Kreira folder za uploadano datoteko in vrne destination filename za uploadano datoteko
     *
     * @param string $hash
     * @return string polni file name kamor se shrani datoteka
     * @throws MaxException
     */
    public function zagotoviFolder($hash)
    {
        $dir = $this->getUploadDirectory($hash);

        if (!is_dir($dir)) {
            $success = mkdir($dir, 02775, true);
            if (!$success) {
                throw new MaxException("Ne morem ustvariti direktorija $dir", 'TIP-DAT-0115');
            }
        } else {
            if (!is_writable($dir)) {
                throw new MaxException("Direktorij $dir ni zapisljiv", 'TIP-DAT-0114');
            }
        }

        return $this->getFileName($hash);
    }


    /**
     * Preveri ali obstaja katera druga datoteka z istim hashom
     *
     * @param string $hash
     * @param int $size
     * @return bool
     * @throws MaxException
     */
    public function checkSameFileExists($hash, $size = 0)
    {
        $filename = $this->getFileName($hash);
        if (file_exists($filename)) {
            $stat = stat($filename);
            if ($stat['size'] !== $size) {
                throw new MaxException("Isti hash, različna velikost... h: $hash  datoteka id: $object->id", 7701112);
            }
        }
    }

    /**
     * Vrne filename za datoteko z znanim hashom
     *
     * @param string $hash
     * @return string
     */
    public function getFileName($hash)
    {
        $f    = new SeparatorToSeparator('-', '');
        $hash = $f->filter($hash);
        $dir  = $this->getUploadDirectory($hash);
        return $dir . '/' . $hash;
    }

    /**
     * Preveri, ali imamo primerne podatke za task
     */
    abstract public function checkData();


}