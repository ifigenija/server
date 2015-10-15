<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;
use Prodaja\Entity\ProdajaPredstave;
use Prodaja\Entity\Prostor;
use Produkcija\Entity\Uprizoritev;
use Zend\I18n\Validator\DateTime;

/**
 * Dogodek uprizoritve - ali vaja ali predstava
 *
 * @ORM\Entity(repositoryClass="Koledar\Repository\Dogodki")
 * @ORM\Table(indexes={
 *    @ORM\Index(name="dogodki_zacetek", columns={"zacetek"}),
 *    @ORM\Index(name="dogodki_konec", columns={"konec"}),
 *    @ORM\Index(name="dogodki_razred", columns={"razred"})})
 * })
 * @Max\I18n(label="Dogodek",plural="Dogodki")
 * @Max\Id(prefix="0024")
 */
class Dogodek
        extends \Max\Entity\Base
{

    const PREDSTAVA  = "100s";
    const VAJA       = "200s";
    const GOSTOVANJE = "300s";
    const SPLOSNO    = "400s";
    const ZASEDENOST = "500s";
    const DOLGOROCNO    = "100s";
    const PLANIRAN      = "200s";
    const FIKSIRAN      = "300s";
    const POTRJEN       = "400s";
    const POTRJEN_JAVNO = "500s";
    const ODPOVEDAN     = "610s";
    const ZAKLJUCEN     = "600s";
    const OBDELAN       = "700s";

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID dogodka")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     *
     * @ORM\Column(type="boolean", options = {"default"=false}, nullable=true)
     * @Max\I18n(label="Celodnevni", description="Dogodek se razteza skozi cel dan")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $allDay = false;

    /**
     *
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Začetek", description="Začetek dogodka")
     * @var \DateTime
     */
    protected $zacetek;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label="Konec", description="Konec dogodka")
     * @var \DateTime
     */
    protected $konec;

    /**
     * @ORM\Column(type="string", length=4, nullable=true)
     * @Max\I18n(label="Status", description="Status dogodka")
     * @Max\Ui(type="select", opts="dogodek.status")
     * @var string
     */
    protected $status;

    /**
     * @ORM\Column(type="string", length=4, nullable=true)
     * @Max\I18n(label="Razred", description="Razred dogodka")
     * @Max\Ui(type="hidden", opts="dogodek.razred")
     * @var string
     */
    protected $razred;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Termin", description="Termin dogodka")
     * @var string
     */
    protected $termin;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Ime", description="Ime dogodka")
     * @var string
     */
    protected $title;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Predstava", inversedBy="dogodek")
     * @ORM\JoinColumn(name="predstava_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Predstava",  description="Predstava")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Predstava
     */
    protected $predstava;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Zasedenost", inversedBy="dogodek")
     * @ORM\JoinColumn(name="zasedenost_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Zasedenost",  description="Zasedenost")
     * @Max\Ui(type="toone")
     * @var Zasedenost
     */
    protected $zasedenost;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Vaja", inversedBy="dogodek")
     * @ORM\JoinColumn(name="vaja_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Vaja",  description="Vaja")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Vaja
     */
    protected $vaja;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Gostovanje", inversedBy="dogodek")
     * @ORM\JoinColumn(name="gostovanje_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Gostovanje",  description="Gostovanje")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Gostovanje
     */
    protected $gostovanje;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\DogodekSplosni", inversedBy="dogodek")
     * @ORM\JoinColumn(name="dogodek_splosni_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Splošni dogodek",  description="Dogodek, ki ni ne vaja, ne predstava, ne gostovanje, zaseda pa prostor")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\DogodekSplosni
     */
    protected $splosni;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Prostor")
     * @Max\I18n(label="Prostor",  description="Prostor")
     * @Max\Ui(type="toone")
     * @var \Prodaja\Entity\Prostor
     */
    protected $prostor;

    /**
     * @ORM\OneToMany(targetEntity="Prisotnost\Entity\TerminStoritve", mappedBy="dogodek")
     * @var <TerminiStoritve>
     */
    protected $terminiStoritve;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\ProdajaPredstave", mappedBy="dogodek")
     * @var <ProdajaPredstave>
     */
    protected $prodajaPredstave;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Sezona", inversedBy="dogodki")
     * @ORM\JoinColumn(name="sezona_id", referencedColumnName="id")
     * @Max\I18n(label="Sezona",  description="Sezona")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Sezona
     */
    protected $sezona;
    private $razredi  = [self::PREDSTAVA, self::VAJA, self::GOSTOVANJE, self::SPLOSNO, self::ZASEDENOST];

    public function __construct()
    {
        $this->terminiStoritve  = new ArrayCollection();
        $this->prodajaPredstave = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        if ($this->zacetek && $this->konec) {
            $this->expect($this->zacetek <= $this->konec, "Datum konca mora biti za datumom začetka", 1000469);
        };

        $this->expect($this->razred, "Razred dogodka ne sme biti prazen", 1000464);
        $this->expect(array_search($this->razred, $this->razredi) > -1, "Razred dogodka ni pravilen", 1000462);

        if ($this->razred === self::VAJA) {
            $this->expect($this->vaja, "Dogodek razreda vaja zahteva referenco na vajo", 1000463);
        }
        if ($this->razred === self::PREDSTAVA) {
            $this->expect($this->predstava, "Dogodek razreda predstva zahteva referenco na predstavo", 1000465);
        }
        if ($this->razred === self::GOSTOVANJE) {
            $this->expect($this->gostovanje, "Dogodek razreda gostovanje zahteva referenco na gostovanje", 1000466);
        }
        if ($this->razred === self::SPLOSNO) {
            $this->expect($this->splosni, "Dogodek razreda splošno zahteva referenco dogodekSplosni", 1000467);
            $this->expect($this->prostor, "Dogodek razreda splošno zahteva referenco Prostor", 1001050);
        }
        if ($this->razred === self::ZASEDENOST) {
            $this->expect($this->zasedenost, "Dogodek razreda zasedenost zahteva referenco zasedenost", 1000468);
            $this->expect($this->terminiStoritve->count() === 0, "Dogodek razreda zasedenost ne dovoljuje terminov storitve", 1001051);
            $this->expect(!$this->prostor, "Dogodek razreda zasedenost ne dovoljuje reference Prostor", 1001052);
        }


        $i = 0;
        if ($this->vaja) {
            $i++;
        }
        if ($this->predstava) {
            $i++;
        }
        if ($this->zasedenost) {
            $i++;
        }
        if ($this->gostovanje) {
            $i++;
        }
        if ($this->splosni) {
            $i++;
        }


        $this->expect($i === 1, "Napaka - napačno število referenc na podrobnosti dogodka $i", 1000361);
    }

    /**
     * @return  Uprizoritev|null
     *
     */
    public function getUprizoritev()
    {
        switch ($this->razred) {
            case Dogodek::VAJA:
                return $this->getVaja() !== null ? $this->getVaja()->getUprizoritev() : null;
            case Dogodek::PREDSTAVA:
                return $this->getPredstava() !== null ? $this->getPredstava()->getUprizoritev() : null;
        }

        return null;
    }

    /**
     * Vrne podrobne podatke od dogodku, sktruktura glede na vrsto dogodka
     *
     * @return DogodekSplosni|Gostovanje|Predstava|Vaja|Zasedenost
     */
    public function getPodrobno()
    {
        switch ($this->razred) {
            case self::PREDSTAVA:
                return $this->predstava;
            case self::VAJA:
                return $this->vaja;
            case self::GOSTOVANJE:
                return $this->gostovanje;
            case self::ZASEDENOST:
                return $this->zasedenost;
            case self::SPLOSNO:
                return $this->splosni;
        }
    }

    /**
     * @return string
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param string $id
     * @return Dogodek
     */
    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    /**
     * @return boolean
     */
    public function getAllDay()
    {
        return $this->allDay;
    }

    /**
     * @param boolean $allDay
     * @return Dogodek
     */
    public function setAllDay($allDay)
    {
        $this->allDay = $allDay;
        return $this;
    }

    /**
     * @return \DateTime
     */
    public function getZacetek()
    {
        return $this->zacetek;
    }

    /**
     * @param \DateTime $zacetek
     * @return Dogodek
     */
    public function setZacetek(\DateTime $zacetek)
    {
        $this->zacetek = $zacetek;
        return $this;
    }

    /**
     * @return \DateTime
     */
    public function getKonec()
    {
        return $this->konec;
    }

    /**
     * @param \DateTime $konec
     * @return Dogodek
     */
    public function setKonec($konec)
    {
        $this->konec = $konec;
        return $this;
    }

    /**
     * @return string
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * @param string $status
     * @return Dogodek
     */
    public function setStatus($status)
    {
        $this->status = $status;
        return $this;
    }

    /**
     * @return string
     */
    public function getRazred()
    {
        return $this->razred;
    }

    /**
     * @param string $razred
     * @return Dogodek
     */
    public function setRazred($razred)
    {
        $this->razred = $razred;
        return $this;
    }

    /**
     * @return string
     */
    public function getTermin()
    {
        return $this->termin;
    }

    /**
     * @param string $termin
     * @return Dogodek
     */
    public function setTermin($termin)
    {
        $this->termin = $termin;
        return $this;
    }

    /**
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @param string $title
     * @return Dogodek
     */
    public function setTitle($title)
    {
        $this->title = $title;
        return $this;
    }

    /**
     * @return Predstava
     */
    public function getPredstava()
    {
        return $this->predstava;
    }

    /**
     * @param Predstava $predstava
     * @return Dogodek
     */
    public function setPredstava(Predstava $predstava = null)
    {
        $this->predstava = $predstava;
        return $this;
    }

    /**
     * @return Zasedenost
     */
    public function getZasedenost()
    {
        return $this->zasedenost;
    }

    /**
     * @param Zasedenost $zasedenost
     * @return Dogodek
     */
    public function setZasedenost(Zasedenost $zasedenost = null)
    {
        $this->zasedenost = $zasedenost;
        return $this;
    }

    /**
     * @return Vaja
     */
    public function getVaja()
    {
        return $this->vaja;
    }

    /**
     * @param Vaja $vaja
     * @return Dogodek
     */
    public function setVaja(Vaja $vaja = null)
    {
        $this->vaja = $vaja;
        return $this;
    }

    /**
     * @return Gostovanje
     */
    public function getGostovanje()
    {
        return $this->gostovanje;
    }

    /**
     * @param Gostovanje $gostovanje
     * @return Dogodek
     */
    public function setGostovanje(Gostovanje $gostovanje = null)
    {
        $this->gostovanje = $gostovanje;
        return $this;
    }

    /**
     * @return DogodekSplosni
     */
    public function getSplosni()
    {
        return $this->splosni;
    }

    /**
     * @param DogodekSplosni $splosni
     * @return Dogodek
     */
    public function setSplosni(DogodekSplosni $splosni)
    {
        $this->splosni = $splosni;
        return $this;
    }

    /**
     * @return \Prodaja\Entity\Prostor
     */
    public function getProstor()
    {
        return $this->prostor;
    }

    /**
     * @param \Prodaja\Entity\Prostor $prostor
     * @return Dogodek
     */
    public function setProstor(Prostor $prostor = null)
    {
        $this->prostor = $prostor;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getTerminiStoritve()
    {
        return $this->terminiStoritve;
    }

    /**
     * @param ArrayCollection  $terminiStoritve
     * @return Dogodek
     */
    public function setTerminiStoritve($terminiStoritve)
    {
        $this->terminiStoritve = $terminiStoritve;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getProdajaPredstave()
    {
        return $this->prodajaPredstave;
    }

    /**
     * @param ProdajaPredstave $prodajaPredstave
     * @return Dogodek
     */
    public function setProdajaPredstave(ProdajaPredstave $prodajaPredstave = null)
    {
        $this->prodajaPredstave = $prodajaPredstave;
        return $this;
    }

    /**
     * @return Sezona
     */
    public function getSezona()
    {
        return $this->sezona;
    }

    /**
     * @param Sezona $sezona
     * @return Dogodek
     */
    public function setSezona(Sezona $sezona = null)
    {
        $this->sezona = $sezona;
        return $this;
    }

}
