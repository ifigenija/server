<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * Entiteta za poslovne partnerje
 *
 * @ORM\Entity(repositoryClass="App\Repository\Popa")
 * @ORM\Table(name="popa")
 * @Max\I18n(label="Poslovni partner",plural="Poslovni partnerji")
 * @Max\Lookup
 * @Max\Id(prefix="0008")
 */
class Popa
        extends \Max\Entity\Base
{

    /**
     * ID klienta
     *
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="ID", description="ID poslovnega partnerja")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * Šifra klienta
     *
     * @ORM\Column(unique=true, length=4, nullable=false)
     * @Max\I18n(label="popa.sifra", description="popa.d.sifra")
     * @Max\Ui(ident=true, type="sifra",icon="fa fa-barcode",group="Osnovni podatki")
     * @var string
     */
    protected $sifra;

    /**
     * Status klienta
     *  AK-aktiven
     *  NA-neaktiven
     *
     * @ORM\Column(length=2, nullable=true)
     * @Max\Ui(type="select",opts="popa.stakli",group="Osnovni podatki", required=true)
     * @Max\I18n(label="popa.stakli", description="popa.d.stakli")
     * @var string
     */
    protected $stakli;

    /**
     * Tip klienta - označuje vrsto poslovnega partnerja. 
     * 
     * dodano glede na potrebno LGLJ , ker rabijo statistike glede na
     * šole, gledalci, sponzorji,...
     * 
     * @ORM\ManyToOne(targetEntity="App\Entity\TipPopa", inversedBy="popa", fetch="EAGER")
     * @ORM\Column( nullable=true)
     * @Max\I18n(label = "popa.tipkli", description = "popa.d.tipkli")
     * @Max\Ui(type="select", empty="Izberite tip poslovnega partnerja", required=false)
     * @Max\Ui(type="lookupselect", empty="Izberi zaposlitev", required=false, filters={"oseba":{"element":"oseba"}})
     * @var \App\Entity\TipPopa
     */
    protected $tipkli;

    /**
     * Naziv klienta
     *
     * @ORM\Column(length=60, nullable=false) 
     * @Max\I18n(label="popa.naziv", description="popa.d.naziv")
     * @Max\Ui(type="naziv",group="Osnovni podatki") 
     * @var string
     */
    protected $naziv;

    /**
     * Dodatno polje za naziv klienta
     *
     * @ORM\Column(length=60, nullable=true)
     * @Max\Ui(type="naziv",group="Osnovni podatki")
     * @Max\I18n(label="popa.naziv1", description="popa.d.naziv1")
     * @var string
     */
    protected $naziv1 = '';

    /**
     * @ORM\Column(length=60, nullable=true)
     * @Max\I18n(label="popa.panoga", description="popa.d.panoga")
     * @var string
     */
    protected $panoga;

    /**
     * Email naslov
     *
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="popa.email", description="popa.d.email")
     * @Max\Ui(type="email",group="Kontaktni podatki")
     * @var string
     */
    protected $email;

    /**
     * Url spletne strani
     *
     * @ORM\Column(length=100, nullable=true)
     * @Max\I18n(label="popa.url", description="popa.d.url")
     * @Max\Ui(type="naziv",icon="fa fa-globe",group="Kontaktni podatki")
     * @var string
     */
    protected $url = '';

    /**
     * Opomba
     *  tekstovno polje za dodatne podatke o klientu
     *
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="popa.opomba", description="popa.d.opomba")
     * @var string
     */
    protected $opomba;

    /**
     * Država klienta
     *
     * @ORM\ManyToOne(targetEntity="App\Entity\Drzava")
     * @ORM\JoinColumn(name="drzava_id", referencedColumnName="id", nullable=false) 
     * @Max\I18n(label="popa.drzava", description="popa.d.drzava")
     * @Max\Ui(type="toone",group="Kontaktni podatki",required=true)
     * @var \App\Entity\Drzava
     */
    protected $drzava;

    /**
     * 
     * 
     * @var <Osebe>
     */
    protected $osebe;

    /**
     * Klientovi naslovi
     * 
     * @ORM\OneToMany(targetEntity="App\Entity\PostniNaslov", mappedBy="popa", orphanRemoval=true)
     * @var <Naslovi>
     */
    protected $naslovi;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Telefonska", mappedBy="popa", orphanRemoval=true)
     * @var <Telefonske>
     */
    protected $telefonske;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Trr", mappedBy="popa")
     * @var <Trrji>
     */
    protected $trrji;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\KontaktnaOseba", mappedBy="popa")
     * var <KontaktneOsebe>
     */
    protected $kontaktneOsebe;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Prostor", mappedBy="popa")
     * var <Prostori>
     */
    protected $prostori;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Pogodba", mappedBy="popa")
     * @var <Pogodbe>
     */
    protected $pogodbe;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\StrosekUprizoritve", mappedBy="popa")
     * @var <Stroski>
     */
    protected $stroski;

    /**
     * ID za DDV klienta
     *
     *
     * @ORM\Column(length=18, nullable=true)
     * @Max\I18n(label="popa.idddv", description="popa.d.idddv")
     * @Max\Ui(group="Davčni podatki")
     * @var string
     */
    protected $idddv;

    /**
     * Matična številka klienta
     *
     * @ORM\Column(length=20, nullable=true)
     * @Max\I18n(label="popa.maticna", description="popa.d.maticna")
     * @Max\Ui(type="sifra",group="Davčni podatki")
     * @var string
     */
    protected $maticna;

    /**
     * Je zavezanec za DDV
     *  checkbox - Da, Ne
     *
     * 
     * @ORM\Column(length=1, nullable=true)
     * @Max\I18n(label="popa.zavezanec", description="popa.d.zavezanec")
     * @Max\Ui(type="checkbox",group="Davčni podatki")      //$$ rb verjetno potrebne select opcije
     * @var string
     */
    protected $zavezanec;

    /**
     * Je klient iz EU
     *  checkbox - Da, Ne
     *
     *
     * @ORM\Column(length=1, nullable=true)
     * @Max\I18n(label="popa.jeeu", description="popa.d.jeeu")
     * @Max\Ui(type="checkbox",group="Davčni podatki")      //$$ rb verjetno potrebne select opcije
     * @var string
     */
    protected $jeeu;

    /**
     * Zavezanec za DDV od
     *
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="popa.datZav",  description="popa.d.datZav")
     * @Max\Ui(group="Davčni podatki")
     * @var string
     */
    protected $datZav;

    /**
     * Zavezanec za DDV do
     *
     * @todo polje je neuporabljeno
     *
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="popa.datnZav", description="popa.d.datnZav")
     * @Max\Ui(group="Davčni podatki")
     * @var string
     */
    protected $datnZav;

    /**
     * A je poslovni partner iz zamejstva 
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="popa.zamejstvo", description="popa.d.zamejstvo")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $zamejstvo = false;

    /**
     * A je poslovni partner NVO - nevladna organizacija
     * 
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="popa.nvo", description="popa.d.nvo")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $nvo = false;

    /**
     * @ORM\OneToOne(targetEntity="ProgramDela\Entity\ProdukcijskaHisa", mappedBy="popa")
     * @Max\I18n(label="popa.producent",  description="popa.d.producent")
     * @Max\Ui(type="toone")
     * @var \ProgramDela\Entity\ProdukcijskaHisa
     */
    protected $producent;

    /**
     * @ORM\OneToOne(targetEntity="Prodaja\Entity\Kupec", mappedBy="popa")
     * @Max\I18n(label="popa.kupec",  description="popa.d.kupec")
     * @Max\Ui(type="toone")
     * @var \Prodaja\Entity\Kupec
     */
    protected $kupec;

    public function __construct()
    {
        $this->naslovi        = new ArrayCollection();
        $this->telefonske     = new ArrayCollection();
        $this->trrji          = new ArrayCollection();
        $this->kontaktneOsebe = new ArrayCollection();
        $this->pogodbe        = new ArrayCollection();
        $this->stroski        = new ArrayCollection();
        $this->prostori       = new ArrayCollection();
    }

    public function __toString()
    {
        return $this->getSifra() . ' ' . $this->getNaziv();
    }

    public function addNaslovi($emb)
    {
        if (!$this->getNaslovi()->contains($emb)) {
            $this->naslovi->add($emb);
        }
    }

    public function removeNaslovi($emb)
    {
        if ($this->naslovi->contains($emb)) {
            $this->naslovi->removeElement($emb);
        }
    }

    /**
     * 
     * @param string $mode
     */
    public function validate($mode = 'update')
    {

        $this->expect($this->sifra, "Šifra je obvezen podatek", 1000310);
//      če je na polju nastavljena anotacija @ORM\Column( nullable=false) , 
//      potem bi moral že prej biti error in do sem sploh ne bi smel priti
        $this->expect($this->naziv, "Naziv je obvezen podatek", 1000311);
        $this->expect($this->drzava, "Država je obvezen podatek", 1000312);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getStakli()
    {
        return $this->stakli;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getNaziv1()
    {
        return $this->naziv1;
    }

    public function getPanoga()
    {
        return $this->panoga;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function getUrl()
    {
        return $this->url;
    }

    public function getOpomba()
    {
        return $this->opomba;
    }

    public function getDrzava()
    {
        return $this->drzava;
    }

    public function getOsebe()
    {
        return $this->osebe;
    }

    public function getNaslovi()
    {
        return $this->naslovi;
    }

    public function getTelefonske()
    {
        return $this->telefonske;
    }

    public function getTrrji()
    {
        return $this->trrji;
    }

    public function getKontaktneOsebe()
    {
        return $this->kontaktneOsebe;
    }

    public function getPogodbe()
    {
        return $this->pogodbe;
    }

    public function getStroski()
    {
        return $this->stroski;
    }

    public function getIdddv()
    {
        return $this->idddv;
    }

    public function getMaticna()
    {
        return $this->maticna;
    }

    public function getZavezanec()
    {
        return $this->zavezanec;
    }

    public function getJeeu()
    {
        return $this->jeeu;
    }

    public function getDatZav()
    {
        return $this->datZav;
    }

    public function getDatnZav()
    {
        return $this->datnZav;
    }

    public function getZamejstvo()
    {
        return $this->zamejstvo;
    }

    public function getProducent()
    {
        return $this->producent;
    }

    public function getKupec()
    {
        return $this->kupec;
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

    public function setStakli($stakli)
    {
        $this->stakli = $stakli;
        return $this;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setNaziv1($naziv1)
    {
        $this->naziv1 = $naziv1;
        return $this;
    }

    public function setPanoga($panoga)
    {
        $this->panoga = $panoga;
        return $this;
    }

    public function setEmail($email)
    {
        $this->email = $email;
        return $this;
    }

    public function setUrl($url)
    {
        $this->url = $url;
        return $this;
    }

    public function setOpomba($opomba)
    {
        $this->opomba = $opomba;
        return $this;
    }

    public function setDrzava(\App\Entity\Drzava $drzava = null)
    {
        $this->drzava = $drzava;
        return $this;
    }

    public function setOsebe($osebe)
    {
        $this->osebe = $osebe;
        return $this;
    }

    public function setNaslovi($naslovi)
    {
        $this->naslovi = $naslovi;
        return $this;
    }

    public function setTelefonske($telefonske)
    {
        $this->telefonske = $telefonske;
        return $this;
    }

    public function setTrrji($trrji)
    {
        $this->trrji = $trrji;
        return $this;
    }

    public function setKontaktneOsebe($kontaktneOsebe)
    {
        $this->kontaktneOsebe = $kontaktneOsebe;
        return $this;
    }

    public function setPogodbe($pogodbe)
    {
        $this->pogodbe = $pogodbe;
        return $this;
    }

    public function setStroski($stroski)
    {
        $this->stroski = $stroski;
        return $this;
    }

    public function setIdddv($idddv)
    {
        $this->idddv = $idddv;
        return $this;
    }

    public function setMaticna($maticna)
    {
        $this->maticna = $maticna;
        return $this;
    }

    public function setZavezanec($zavezanec)
    {
        $this->zavezanec = $zavezanec;
        return $this;
    }

    public function setJeeu($jeeu)
    {
        $this->jeeu = $jeeu;
        return $this;
    }

    public function setDatZav($datZav)
    {
        $this->datZav = $datZav;
        return $this;
    }

    public function setDatnZav($datnZav)
    {
        $this->datnZav = $datnZav;
        return $this;
    }

    public function setZamejstvo($zamejstvo)
    {
        $this->zamejstvo = $zamejstvo;
        return $this;
    }

    public function setProducent(\ProgramDela\Entity\ProdukcijskaHisa $producent = null)
    {
        $this->producent = $producent;
        return $this;
    }

    public function setKupec(\Prodaja\Entity\Kupec $kupec = null)
    {
        $this->kupec = $kupec;
        return $this;
    }

    public function getNvo()
    {
        return $this->nvo;
    }

    public function setNvo($nvo)
    {
        $this->nvo = $nvo;
        return $this;
    }

    public function getProstori()
    {
        return $this->prostori;
    }

    public function setProstori($prostori)
    {
        $this->prostori = $prostori;
        return $this;
    }

    function getTipkli()
    {
        return $this->tipkli;
    }

    function setTipkli(\App\Entity\TipPopa $tipkli = null)
    {
        $this->tipkli = $tipkli;
        return $this;
    }

}
