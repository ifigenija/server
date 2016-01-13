<?php

namespace Prisotnost\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass="Prisotnost\Repository\TerminiStoritve")
 * @Max\I18n(label="Termin storitve",plural="Termini storitve")
 * @Max\Id(prefix="0026")
 */
class TerminStoritve
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID termina storitve")
     * @Max\Ui(type="id")
     * @var string   
     */
    protected $id;

    /**
     * @ORM\Column(type="dateinterval", nullable=true)
     * @Max\I18n(label="Planiran začetek", description="Planiran začetek termina")
     * @var string
     */
    protected $deltaPlaniranZacetek;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Planiran začetek", description="Planiran začetek termina")
     * @var string
     */
    protected $planiranZacetek;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Planiran konec", description="Planiran konec termina")
     * @var string
     */
    protected $planiranKonec;

    /**
     * @ORM\Column(type="decimal", nullable=true,scale=2, precision=15)
     * @Max\I18n(label="Planirano traja", description="Planirano traja")
     * @var double
     */
    protected $planiranoTraja;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Dogodek", inversedBy="terminiStoritve")
     * @ORM\JoinColumn(name="dogodek_id", referencedColumnName="id")
     * @Max\I18n(label="terminStoritve.dogodek",  description="terminStoritve.d.dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    protected $dogodek;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Alternacija", inversedBy="storitve")
     * @ORM\JoinColumn(name="alternacija_id", referencedColumnName="id")
     * @Max\I18n(label="terminStoritve.alternacija",  description="terminStoritve.d.alternacija")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Alternacija
     */
    protected $alternacija;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id", nullable=false)
     * @Max\I18n(label="terminStoritve.oseba",  description="terminStoritve.d.oseba")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Oseba
     */
    protected $oseba;

    /**
     * Ali je dežurni na predstavi?
     * 
     * $$ razčistiti še moramo, ali bo pripet na alternacijo ali ne. 
     * V SLOGI-jevem hierarhičnem seznamu funkcij dežurnega ni
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="terminStoritve.dezurni",  description="terminStoritve.d.dezurni")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $dezurni;

    /**
     * Ali je gost na vaji?
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="terminStoritve.oseba",  description="terminStoritve.d.oseba")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $gost;

    /**
     * @ORM\OneToOne(targetEntity="Prisotnost\Entity\Prisotnost",inversedBy="terminStoritve")
     * @ORM\JoinColumn(name="prisotnost_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label = "terminStoritve.prisotnost", description = "terminStoritve.d.prisotnost")
     * @Max\Ui(type="toone")
     * @var \Prisotnost\Entity\Prisotnost
     */
    protected $prisotnost;

    public function validate($mode = 'update')
    {
        $i = 0;
        if ($this->alternacija) {
            $i++;
        }
        if ($this->dezurni) {
            $i++;
        }
        if ($this->gost) {
            $i++;
        }
        $this->expect($i === 1, "Napačno število referenc ($i) v terminu storitve. Dovoljen natanko eden od alternacija/dezurni/gost", 1001080);

        if ($this->alternacija) {
            $this->oseba = $this->alternacija->getOseba();
        }
    }

    public function getId()
    {
        return $this->id;
    }

    public function getPlaniranZacetek()
    {
        return $this->planiranZacetek;
    }

    public function getPlaniranKonec()
    {
        return $this->planiranKonec;
    }

    public function getPlaniranoTraja()
    {
        return $this->planiranoTraja;
    }

    public function getDogodek()
    {
        return $this->dogodek;
    }

    public function getAlternacija()
    {
        return $this->alternacija;
    }

    public function getOseba()
    {
        return $this->oseba;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setPlaniranZacetek($planiranZacetek)
    {
        $this->planiranZacetek = $planiranZacetek;
        return $this;
    }

    public function setPlaniranKonec($planiranKonec)
    {
        $this->planiranKonec = $planiranKonec;
        return $this;
    }

    public function setPlaniranoTraja($planiranoTraja)
    {
        $this->planiranoTraja = $planiranoTraja;
        return $this;
    }

    public function setDogodek(\Koledar\Entity\Dogodek $dogodek = null)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

    public function setAlternacija(\Produkcija\Entity\Alternacija $alternacija = null)
    {
        $this->alternacija = $alternacija;
        return $this;
    }

    public function setOseba(\App\Entity\Oseba $oseba = null)
    {
        $this->oseba = $oseba;
        return $this;
    }

    function getDezurni()
    {
        return $this->dezurni;
    }

    function getGost()
    {
        return $this->gost;
    }

    function setDezurni($dezurni)
    {
        $this->dezurni = $dezurni;
        return $this;
    }

    function setGost($gost)
    {
        $this->gost = $gost;
        return $this;
    }

    function getPrisotnost()
    {
        return $this->prisotnost;
    }

    function setPrisotnost(\Prisotnost\Entity\Prisotnost $prisotnost = null)
    {
        $this->prisotnost = $prisotnost;
        return $this;
    }

    function getDeltaPlaniranZacetek()
    {
        return $this->deltaPlaniranZacetek;
    }

    function setDeltaPlaniranZacetek($deltaPlaniranZacetek)
    {
        $this->deltaPlaniranZacetek = $deltaPlaniranZacetek;
        return $this;
    }

}
