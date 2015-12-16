<?php

namespace Produkcija\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Zaposlitve")
 * @Max\I18n(label="Zaposlitev",plural="Zaposlitve")
 * @Max\Lookup(ident="sifra", label="oseba.polnoIme", search={"oseba.sifra", "oseba.priimek", "oseba.polnoIme", "oseba.ime"}, extra={"status","delovnoMesto","organizacijskaEnota.id"})
 * @Max\Id(prefix="0016")
 */
class Zaposlitev
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID zaposlitve")
     * @Max\Ui(type="id")
     * @var string     
     */
    protected $id;
    
    /**
     * $$ morali bi spremeniti v unique, ampak potem več ne sme šifre avtomatsko prenašati iz osebe
     * 
     * @ORM\Column( length=4, nullable=false)
     * @Max\I18n(label="zaposlitev.sifra",  description="zaposlitev.d.sifra")
     * @Max\Ui(ident=true, type="sifra",icon="fa fa-barcode")
     * @var string
     */
    protected $sifra;

    /**
     * @ORM\Column(type="string", length=10)
     * @Max\I18n(label="zaposlitev.status",  description="zaposlitev.d.status")
     * @Max\Ui(type="select",opts="zaposlitev.status")
     * @var string
     */
    protected $status;

    /**
     * @ORM\Column(type="string")
     * @Max\I18n(label="zaposlitev.delovnoMesto",  description="zaposlitev.d.delovnoMesto")
     * 
     * @var string
     */
    protected $delovnoMesto;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="zaposlitev.zacetek",  description="zaposlitev.d.zacetek")
     * @Max\Ui(required=true)
     * @var string
     */
    protected $zacetek;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="zaposlitev.konec",  description="zaposlitev.d.konec")
     * @Max\Ui(required=false)
     * @var string
     */
    protected $konec;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="zaposlitev.tip",  description="zaposlitev.d.tip")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $tip;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="zaposlitev.delovnaObveza",  description="zaposlitev.d.delovnaObveza")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $delovnaObveza;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="zaposlitev.malica",  description="zaposlitev.d.malica")
     * @var string
     */
    protected $malica;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="zaposlitev.izmenskoDelo", description="zaposlitev.d.izmenskoDelo")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $izmenskoDelo;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="zaposlitev.individualnaPogodba", description="zaposlitev.d.individualnaPogodb")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $individualnaPogodba;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="zaposlitev.jeZaposlenVdrugemJZ", description="zaposlitev.d.jeZaposlenVdrugemJZ")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $jeZaposlenVdrugemJz;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="zaposlitev.jeNastopajoci", description="zaposlitev.d.jeNastopajoci")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $jeNastopajoci;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="zaposlitev")
     * 
     * @var <Alternacije>
     */
    protected $alternacije;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="zaposlitve")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="zaposlitev.oseba",  description="zaposlitev.d.oseba")
     * @Max\Ui(type="toone", required=true)
     * @var \App\Entity\Oseba
     */
    protected $oseba;

    /**
     * 
     * @ORM\ManyToOne(targetEntity="App\Entity\OrganizacijskaEnota", inversedBy="zaposlitve")
     * @Max\I18n(label="zaposlitev.organizacijskaEnota",  description="zaposlitev.d.organizacijskaEnota")
     * @Max\Ui(type="toone",required=false);
     * @var \App\Entity\OrganizacijskaEnota
     */
    protected $organizacijskaEnota;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\OrganizacijskaEnota", mappedBy="vodja")
     * @Max\Ui(type="hiddenid");
     * @var <VodjaOrganizacijskihEnot>
     */
    protected $vodjaOrganizacijskihEnot;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\OrganizacijskaEnota", mappedBy="namestnik")
     * @Max\Ui(type="hiddenid");
     * @var <NamestnikOrganizacijskihEnot>
     */
    protected $namestnikOrganizacijskihEnot;

    public function __construct()
    {
        $this->alternacije                  = new ArrayCollection();
        $this->vodjaOrganizacijskihEnot     = new ArrayCollection();
        $this->namestnikOrganizacijskihEnot = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->oseba, "Oseba je obvezna", 1000333);
        $this->setSifra($this->oseba->getSifra());
    }

    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getZacetek()
    {
        return $this->zacetek;
    }

    public function getKonec()
    {
        return $this->konec;
    }

    public function getTip()
    {
        return $this->tip;
    }

    public function getDelovnaObveza()
    {
        return $this->delovnaObveza;
    }

    public function getMalica()
    {
        return $this->malica;
    }

    public function getIzmenskoDelo()
    {
        return $this->izmenskoDelo;
    }

    public function getIndividualnaPogodba()
    {
        return $this->individualnaPogodba;
    }

    public function getJeZaposlenVdrugemJz()
    {
        return $this->jeZaposlenVdrugemJz;
    }

    public function getJeNastopajoci()
    {
        return $this->jeNastopajoci;
    }

    public function getAlternacije()
    {
        return $this->alternacije;
    }

    public function getOseba()
    {
        return $this->oseba;
    }

    function getOrganizacijskaEnota()
    {
        return $this->organizacijskaEnota;
    }

    function getVodjaOrganizacijskihEnot()
    {
        return $this->vodjaOrganizacijskihEnot;
    }

    function getNamestnikOrganizacijskihEnot()
    {
        return $this->namestnikOrganizacijskihEnot;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

    public function setStatus($status)
    {
        $this->status = $status;
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

    public function setTip($tip)
    {
        $this->tip = $tip;
        return $this;
    }

    public function setDelovnaObveza($delovnaObveza)
    {
        $this->delovnaObveza = $delovnaObveza;
        return $this;
    }

    public function setMalica($malica)
    {
        $this->malica = $malica;
        return $this;
    }

    public function setIzmenskoDelo($izmenskoDelo)
    {
        $this->izmenskoDelo = $izmenskoDelo;
        return $this;
    }

    public function setIndividualnaPogodba($individualnaPogodba)
    {
        $this->individualnaPogodba = $individualnaPogodba;
        return $this;
    }

    public function setJeZaposlenVdrugemJz($jeZaposlenVdrugemJz)
    {
        $this->jeZaposlenVdrugemJz = $jeZaposlenVdrugemJz;
        return $this;
    }

    public function setJeNastopajoci($jeNastopajoci)
    {
        $this->jeNastopajoci = $jeNastopajoci;
        return $this;
    }

    public function setAlternacije($alternacije)
    {
        $this->alternacije = $alternacije;
        return $this;
    }

    public function setOseba(\App\Entity\Oseba $oseba = null)
    {
        $this->oseba = $oseba;
        return $this;
    }

    public function getDelovnoMesto()
    {
        return $this->delovnoMesto;
    }

    public function setDelovnoMesto($delovnoMesto)
    {
        $this->delovnoMesto = $delovnoMesto;
        return $this;
    }

    function setOrganizacijskaEnota(\App\Entity\OrganizacijskaEnota $organizacijskaEnota = null)
    {
        $this->organizacijskaEnota = $organizacijskaEnota;
        return $this;
    }

    function setVodjaOrganizacijskihEnot($vodjaOrganizacijskihEnot)
    {
        $this->vodjaOrganizacijskihEnot = $vodjaOrganizacijskihEnot;
        return $this;
    }

    function setNamestnikOrganizacijskihEnot($namestnikOrganizacijskihEnot)
    {
        $this->namestnikOrganizacijskihEnot = $namestnikOrganizacijskihEnot;
        return $this;
    }

}
