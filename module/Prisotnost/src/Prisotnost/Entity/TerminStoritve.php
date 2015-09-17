<?php

namespace Prisotnost\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

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
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Začetek", description="Začetek termina")
     * @var string
     */
    protected $zacetek;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Konec", description="Konec termina")
     * @var string
     */
    protected $konec;

    /**
     * @ORM\Column(type="decimal", nullable=true,scale=2, precision=15)
     * @Max\I18n(label="Planirano traja", description="Planirano traja")
     * @var double
     */
    protected $planiranoTraja;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Dogodek", inversedBy="terminiStoritve")
     * @ORM\JoinColumn(name="dogodek_id", referencedColumnName="id")
     * @Max\I18n(label="Dogodek",  description="Dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    protected $dogodek;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Alternacija", inversedBy="storitve")
     * @ORM\JoinColumn(name="alternacija_id", referencedColumnName="id")
     * @Max\I18n(label="Alternacija",  description="Alternacija")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Alternacija
     */
    protected $alternacija;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id", nullable=false)
     * @Max\I18n(label="Oseba",  description="Oseba")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Oseba
     */
    protected $oseba;

    public function validate($mode = 'update')
    {
        
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

    public function getZacetek()
    {
        return $this->zacetek;
    }

    public function getKonec()
    {
        return $this->konec;
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

    public function setZacetek($zacetek)
    {
        $this->zacetek = $zacetek;
        return $this;
    }

    public function setKonec($konec)
    {
        $this->konec = $konec;
        return $this;
    }

    public function setPlaniranoTraja($planiranoTraja)
    {
        $this->planiranoTraja = $planiranoTraja;
        return $this;
    }

    public function setDogodek(\Koledar\Entity\Dogodek $dogodek=null)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

    public function setAlternacija(\Produkcija\Entity\Alternacija $alternacija=null)
    {
        $this->alternacija = $alternacija;
        return $this;
    }

    public function setOseba(\App\Entity\Oseba $oseba=null)
    {
        $this->oseba = $oseba;
        return $this;
    }

}
