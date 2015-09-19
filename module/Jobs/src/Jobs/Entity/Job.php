<?php

namespace Jobs\Entity;

use Aaa\Entity\User;
use DateTime;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * Job, ki se izvaja v ozadju
 * @ORM\Entity(repositoryClass="Jobs\Repository\JobManager")
 * @ORM\Table(indexes={@ORM\Index(columns={"casIzvedbe"}),@ORM\Index(columns={"datum"}),@ORM\Index(columns={"izveden"})})
 * @Max\I18n(label="Job",plural="Jobs",description="Job queue")
 * @Max\Id(prefix="00ff")
 */
class Job extends Base
{
    
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @Max\Ui(type="id")
     * @Max\I18n(label="Identifikator", description="Identifikacijska številka v bazi")
     */
    protected $id;
    
    /**
     * Informativno ime joba
     * @ORM\Column(length=50, nullable=false)
     * @Max\I18n(label="Ime", description="Ime job-a")
     *
     * @var string
     */
    protected $name;
    
    /**
     * Task, ki ga job izvede
     * @ORM\Column(length=50, nullable=false)
     *
     * @var string
     */
    protected $task;
    
    /**
     * Status job-a
     * 0 - čaka na izvedbo
     * 1 - v obdelavi
     * 2 - končan
     * 3 - napaka
     * @ORM\Column(type="integer")
     *
     * @var int
     */
    protected $status;
    
    /**
     * Log sporočila
     * @ORM\Column(type="text", nullable=true)
     *
     * @var string
     */
    protected $log;
    
    /**
     * Seznam reportov (datotek)
     * @ORM\OneToMany(targetEntity="Jobs\Entity\Report", mappedBy="job", orphanRemoval=true )
     *
     * @var ArrayCollection
     */
    protected $reports;
    
    /**
     * Uporabnik, ki je sprožil job
     * @ORM\ManyToOne(targetEntity="Aaa\Entity\User")
     *
     * @var User
     */
    protected $user;
    
    /**
     * Datum ustvarjanja
     * @ORM\Column(type="datetime", nullable=false)
     *
     * @var DateTime
     */
    protected $datum;
    
    /**
     * Datum in čas, ko se job naj izvede
     * @ORM\Column(type="datetime", nullable=false)
     *
     * @var DateTime
     */
    protected $casIzvedbe;
    
    /**
     * Datum in čas, ko se job končal
     * @ORM\Column(type="datetime", nullable=true)
     *
     * @var DateTime
     */
    protected $izveden;
    
    /**
     * Podatki za task
     * @ORM\Column(type="object", nullable=true)
     *
     * @var array
     */
    protected $data;
    
    /**
     * Prikaži spremembo statusa uporabniku?
     * @ORM\Column(type="boolean", nullable=true)
     * 
     * @var boolean
     */
    protected $alert;
    
    /**
     * Ali je job skrit?
     * @ORM\Column(type="boolean", nullable=true)
     * 
     * @var boolean
     */
    protected $hidden;
    
    /**
     * Interno polje - uporabnik, ki je zadnji spreminjal entiteto
     * To polje se ne vnaša. Uporabnika dobimo iz prijave v aplikacijo.
     *
     *  @ORM\Column(length=10, nullable=true)
     */
    protected $upor;

    /**
     * Interno polje - datum in ura zadnjega spreminjanja entitete
     * To polje se ne vnaša. Podatek vzamemo iz tekočega datuma in ure.
     *
     * @ORM\Column(type="datetime", nullable=true)
     * @var string
     */
    protected $datKnj; 
        

    public function __construct()
    {
        $this->reports = new ArrayCollection();
    }

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
        return $this;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function setStatus($status)
    {
        $this->status = $status;
        return $this;
    }

    public function getLog()
    {
        return $this->log;
    }

    public function setLog($log)
    {
        $this->log = $log;
        return $this;
    }
    
    public function log ($message) {
        if (getenv('LOG_STDOUT')) {
            echo "$message\n";
        }
        $this->log .= "$message\n";
    }
    public function getReports()
    {
        return $this->reports;
    }

    public function setReports($reports)
    {
        $this->reports = $reports;
        return $this;
    }

    public function getDatum()
    {
        return $this->datum;
    }

    public function setDatum($datum)
    {
        $this->datum = $datum;
        return $this;
    }

    public function getTask()
    {
        return $this->task;
    }

    public function setTask($task)
    {
        $this->task = $task;
        return $this;
    }

    public function getCasIzvedbe()
    {
        return $this->casIzvedbe;
    }

    public function setCasIzvedbe($casIzvedbe)
    {
        $this->casIzvedbe = $casIzvedbe;
        return $this;
    }

    public function getIzveden()
    {
        return $this->izveden;
    }

    public function setIzveden($casIzvedbe)
    {
        $this->izveden = $casIzvedbe;
        return $this;
    }

    public function getData()
    {
        return $this->data;
    }

    public function setData($data)
    {
        $this->data = $data;
        return $this;
    }

    public function getUser()
    {
        return $this->user;
    }

    public function setUser($user)
    {
        $this->user = $user;
        return $this;
    }

    public function getAlert()
    {
        return $this->alert;
    }

    public function setAlert($alert)
    {
        $this->alert = $alert;
        return $this;
    }

    public function getHidden()
    {
        return $this->hidden;
    }

    public function setHidden($hidden)
    {
        $this->hidden = $hidden;
        return $this;
    }
}

