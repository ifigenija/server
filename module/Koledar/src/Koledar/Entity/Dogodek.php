<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * Dogodek uprizoritve - ali vaja ali predstava
 * 
 * @ORM\Entity(repositoryClass="Koledar\Repository\Dogodki")
 * @ORM\Table(indexes={@ORM\Index(name="zacetek", columns={"zacetek"}),@ORM\Index(name="konec", columns={"konec"})})
 * @Max\I18n(label="Dogodek",plural="Dogodki")
 * @Max\Id(prefix="0024")
 */
class Dogodek
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID dogodka")
     * @Max\Ui(type="id")
     * @var string     
     */
    private $id;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Planiran začetek", description="Planiran začetek dogodka")
     * @var string
     */
    private $planiranZacetek;

    /**
     * 
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Začetek", description="Začetek dogodka")
     * @var string
     */
    private $zacetek;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Konec", description="Konec dogodka")
     * @var string
     */
    private $konec;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Status", description="Status dogodka")
     * @Max\Ui(type="integer")
     * @var integer     
     */
    private $status;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     * @Max\I18n(label="Razred", description="Razred dogodka")
     * @var string
     */
    private $razred;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Termin", description="Termin dogodka")
     * @var string
     */
    private $termin;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Ime", description="Ime dogodka")
     * @var string
     */
    private $ime;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Predstava", inversedBy="dogodek")
     * @ORM\JoinColumn(name="predstava_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Predstava",  description="Predstava")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Predstava
     */
    private $predstava;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Zasedenost", inversedBy="dogodek")
     * @ORM\JoinColumn(name="zasedenost_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Zasedenost",  description="Zasedenost")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Zasedenost
     */
    private $zasedenost;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Vaja", inversedBy="dogodek")
     * @ORM\JoinColumn(name="vaja_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Vaja",  description="Vaja")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Vaja
     */
    private $vaja;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Gostovanje", inversedBy="dogodek")
     * @ORM\JoinColumn(name="gostovanje_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Gostovanje",  description="Gostovanje")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Gostovanje
     */
    private $gostovanje;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\DogodekIzven", inversedBy="dogodek")
     * @ORM\JoinColumn(name="dogodek_izven_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Dogodek za izven",  description="Dogodek za izven")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\DogodekIzven
     */
    private $dogodekIzven;

    /**
     * @ORM\OneToOne(targetEntity="Prodaja\Entity\Prostor")
     * @ORM\JoinColumn(name="prostor_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Prostor",  description="Prostor")
     * @Max\Ui(type="toone")
     * @var \Prodaja\Entity\Prostor
     */
    private $prostor;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Arhivalija", mappedBy="dogodek")
     * @var <Arhiv>
     */
    private $arhiv;

    /**
     * @ORM\OneToMany(targetEntity="Prisotnost\Entity\TerminStoritve", mappedBy="dogodek")
     * @var <TerminiStoritve>
     */
    private $terminiStoritve;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\ProdajaPredstave", mappedBy="dogodek")
     * @var <ProdajaPredstave>
     */
    private $prodajaPredstave;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Sezona", inversedBy="dogodki")
     * @ORM\JoinColumn(name="sezona_id", referencedColumnName="id")
     * @Max\I18n(label="Sezona",  description="Sezona")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Sezona
     */
    private $sezona;

    public function validate($mode = 'update')
    {
        $this->expect($this->vaja || $this->predstava, "Vaja ali predstava sta obvezna", 1000361);
        $this->expect(!($this->vaja && $this->predstava), "Dogodek je lahko le samo vaja ali samo predstava", 1000362);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getPlaniranZacetek()
    {
        return $this->planiranZacetek;
    }

    public function getZacetek()
    {
        return $this->zacetek;
    }

    public function getKonec()
    {
        return $this->konec;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getRazred()
    {
        return $this->razred;
    }

    public function getTermin()
    {
        return $this->termin;
    }

    public function getIme()
    {
        return $this->ime;
    }

    public function getPredstava()
    {
        return $this->predstava;
    }

    public function getZasedenost()
    {
        return $this->zasedenost;
    }

    public function getVaja()
    {
        return $this->vaja;
    }

    public function getGostovanje()
    {
        return $this->gostovanje;
    }

    public function getDogodekIzven()
    {
        return $this->dogodekIzven;
    }

    public function getProstor()
    {
        return $this->prostor;
    }

    public function getArhiv()
    {
        return $this->arhiv;
    }

    public function getTerminiStoritve()
    {
        return $this->terminiStoritve;
    }

    public function getProdajaPredstave()
    {
        return $this->prodajaPredstave;
    }

    public function getSezona()
    {
        return $this->sezona;
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

    public function setStatus($status)
    {
        $this->status = $status;
        return $this;
    }

    public function setRazred($razred)
    {
        $this->razred = $razred;
        return $this;
    }

    public function setTermin($termin)
    {
        $this->termin = $termin;
        return $this;
    }

    public function setIme($ime)
    {
        $this->ime = $ime;
        return $this;
    }

    public function setPredstava(\Koledar\Entity\Predstava $predstava)
    {
        $this->predstava = $predstava;
        return $this;
    }

    public function setZasedenost(\Koledar\Entity\Zasedenost $zasedenost)
    {
        $this->zasedenost = $zasedenost;
        return $this;
    }

    public function setVaja(\Koledar\Entity\Vaja $vaja)
    {
        $this->vaja = $vaja;
        return $this;
    }

    public function setGostovanje($gostovanje)
    {
        $this->gostovanje = $gostovanje;
        return $this;
    }

    public function setDogodekIzven(\Koledar\Entity\DogodekIzven $dogodekIzven)
    {
        $this->dogodekIzven = $dogodekIzven;
        return $this;
    }

    public function setProstor(\Prodaja\Entity\Prostor $prostor)
    {
        $this->prostor = $prostor;
        return $this;
    }

    public function setArhiv($arhiv)
    {
        $this->arhiv = $arhiv;
        return $this;
    }

    public function setTerminiStoritve($terminiStoritve)
    {
        $this->terminiStoritve = $terminiStoritve;
        return $this;
    }

    public function setProdajaPredstave($prodajaPredstave)
    {
        $this->prodajaPredstave = $prodajaPredstave;
        return $this;
    }

    public function setSezona(\Koledar\Entity\Sezona $sezona)
    {
        $this->sezona = $sezona;
        return $this;
    }

}
