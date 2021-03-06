<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * Entiteta za osebe
 * 
 * @ORM\Entity(repositoryClass="App\Repository\Osebe")
 * @Max\I18n(label="Oseba",plural="Osebe")
 * @Max\Id(prefix="0009")
 * @Max\Lookup(ident="sifra", label="polnoIme", search={"sifra","ime","priimek","psevdonim", "polnoIme"}, extra={"priimek","ime","psevdonim"})
 */
class Oseba
        extends \Max\Entity\Base
{

    /**
     * ID kontaktne osebe
     *
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="ID", description="ID kontaktne osebe")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * Šifra osebe
     *
     * @ORM\Column(unique=true, nullable=false)
     * @Max\I18n(label="oseba.sifra", description="oseba.d.sifra")
     * @Max\Ui(ident=true, type="sifra",icon="fa fa-barcode",group="Osnovni podatki")
     * @var string
     */
    protected $sifra;

    /**
     * Naziv kontaktne osebe
     *
     * @ORM\Column(length=40, nullable=true)
     * @Max\I18n(label="oseba.naziv", description="oseba.d.naziv")
     * @Max\Ui(type="naziv")  
     * @var string
     */
    protected $naziv;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.ime", description="oseba.d.ime")
     * @Max\Ui(type="naziv")       // npr. Homer je brez imena  
     * @var string
     */
    protected $ime;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.priimek", description="oseba.d.priimek")
     * @Max\Ui(type="naziv", required=true)  
     * @var string
     */
    protected $priimek;

    /**
     * @ORM\Column(length=40, nullable=true)
     * @Max\I18n(label="oseba.funkcija", description="oseba.d.funkcija")
     * @Max\Ui(required=false)
     * @var string
     */
    protected $funkcija;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.srednjeIme", description="oseba.d.srednjeIme")
     * @var string
     */
    protected $srednjeIme;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.polnoIme", description="oseba.d.polnoIme")
     * @var string
     */
    protected $polnoIme;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.psevdonim", description="oseba.d.psevdonim")
     * @var string
     */
    protected $psevdonim;

    /**
     * Naslov kontaktne osebe
     *
     * @ORM\OneToMany(targetEntity="App\Entity\PostniNaslov", mappedBy="oseba", orphanRemoval=true)
     * @var <Naslovi>
     */
    protected $naslovi;

    /**
     * Naslov e-pošte
     * Uporablja se tudi kot uporabniško ime pri prijavi v aplikacijo.
     *
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.email", description="oseba.d.email")   
     * @Max\Ui(type="email")
     * @var string
     */
    protected $email = '';

    /**
     * twitter naslov 
     *
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.twitter", description="oseba.d.twitter")   
     * @Max\Ui(type="twitter")
     * @var string
     */
    protected $twitter = '';

    /**
     * skype naslov /Skype name
     *
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.skype", description="oseba.d.skype")   
     * @Max\Ui(type="skype")
     * @var string
     */
    protected $skype = '';

    /**
     * facebook naslov /Facebook account?
     *
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.fb", description="oseba.d.fb")   
     * @Max\Ui(type="facebook")
     * @var string
     */
    protected $fb = '';

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="oseba.datumRojstva", description="oseba.d.datumRojstva")   
     * @Max\Ui(icon="fa fa-birthday-cake")
     * @var string
     */
    protected $datumRojstva;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.emso", description="oseba.d.emso")   
     * @Max\Ui(type="sifra")
     * @var string
     */
    protected $emso;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.davcna", description="oseba.d.davcna")   
     * @Max\Ui(type="sifra")
     * @var string
     */
    protected $davcna;

    /**
     * @ORM\Column(type="string", length=1, nullable=true)
     * @Max\I18n(label="oseba.spol", description="oseba.d.spol")   
     * @Max\Ui(type="select",opts="oseba.spol",group="Osnovni podatki",required=true)
     * @var string
     */
    protected $spol;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="oseba.opombe", description="oseba.d.opombe")   
     * @var string
     */
    protected $opombe;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.drzavljanstvo", description="oseba.d.drzavljanstvo")   
     * @var string
     */
    protected $drzavljanstvo;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.drzavaRojstva", description="oseba.d.drzavaRojstva")   
     * @var string
     */
    protected $drzavaRojstva;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="oseba.krajRojstva", description="oseba.d.krajRojstva")   
     * @var string
     */
    protected $krajRojstva;

    /**
     * @ORM\OneToOne(targetEntity="Aaa\Entity\User")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id", unique=true)
     * @Max\Ui(type="toone")
     * @var \Aaa\Entity\User
     */
    protected $user;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Telefonska", mappedBy="oseba", orphanRemoval=true)
     * @Max\I18n(label="Telefonske številke", description="Telefonske številke osebe")   
     * @Max\Ui(type="tomany")
     * @var <Telefonske>
     */
    protected $telefonske;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Trr", mappedBy="oseba", orphanRemoval=true)
     * @Max\I18n(label="Trr-ji", description="Transaksijski računi osebe")   
     * @Max\Ui(type="tomany")
     * @var <Trrji>
     */
    protected $trrji;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\KontaktnaOseba", mappedBy="oseba")
     * var <KontaktneOsebe>
     */
    protected $kontaktneOsebe;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="oseba")
     * @Max\I18n(label="Alternacije", description="Alternacije osebe")   
     * @Max\Ui(type="tomany")
     * @var <Alternacije>
     */
    protected $alternacije;

    /**
     * @ORM\OneToMany(targetEntity="Prisotnost\Entity\TerminStoritve", mappedBy="oseba")
     * @Max\I18n(label="Termini storitev", description="Termini storitev")   
     * @Max\Ui(type="tomany")
     * @var <TerminiStoritev>
     */
    protected $terminiStoritev;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\AvtorBesedila", mappedBy="oseba")
     * @Max\I18n(label="Avtorji besedil", description="Avtorji besedil")   
     * @Max\Ui(type="tomany")
     * @var <AvtorjiBesedil>
     */
    protected $avtorjiBesedil;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Pogodba", mappedBy="oseba")
     * @Max\I18n(label="Pogodbe", description="Pogodbe osebe")   
     * @Max\Ui(type="tomany")
     * @var <Pogodbe>
     */
    protected $pogodbe;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Zaposlitev", mappedBy="oseba")
     * @Max\I18n(label="Zaposlitve", description="Zaposlitve osebe")   

     * @var <Zaposlitve>
     */
    protected $zaposlitve;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\PostniNaslov")
     * @ORM\JoinColumn(name="naslov_id", referencedColumnName="id")
     * @Max\I18n(label="oseba.naslov", description="oseba.d.naslov")
     */
    protected $naslov;

    public function __construct($name = '')
    {
        $this->naslovi        = new ArrayCollection();
        $this->telefonske     = new ArrayCollection();
        $this->trrji          = new ArrayCollection();
        $this->kontaktneOsebe = new ArrayCollection();
        $this->alternacije    = new ArrayCollection();
        $this->pogodbe        = new ArrayCollection();
        $this->zaposlitve     = new ArrayCollection();
        $this->avtorjiBesedil = new ArrayCollection();
    }

    public function preracunaj($smer = false)
    {
        /**
         * smer up pomeni oseba->avtorbesedila->besedilo->uprizoritve
         */
        if ($smer == \Max\Consts::UP) {
            foreach ($this->getAvtorjiBesedil() as $avtor) {
                $avtor->preracunaj(\Max\Consts::UP);
            }
        }
    }

    /**
     * 
     * @param string $mode
     */
    public function validate($mode = 'update')
    {
//        $this->expect($this->ime, "Ime je obvezen podatek", 1000301);     //npr. Homer je brez imena
        $this->expect($this->priimek, "Priimek je obvezen podatek", 1000302);
        $this->expect($this->sifra, "Šifra je obvezen podatek", 1000303);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getIme()
    {
        return $this->ime;
    }

    public function getPriimek()
    {
        return $this->priimek;
    }

    public function getFunkcija()
    {
        return $this->funkcija;
    }

    public function getSrednjeIme()
    {
        return $this->srednjeIme;
    }

    public function getPolnoIme()
    {
        return $this->polnoIme;
    }

    public function getPsevdonim()
    {
        return $this->psevdonim;
    }

    public function getNaslovi()
    {
        return $this->naslovi;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function getDatumRojstva()
    {
        return $this->datumRojstva;
    }

    public function getEmso()
    {
        return $this->emso;
    }

    public function getDavcna()
    {
        return $this->davcna;
    }

    public function getSpol()
    {
        return $this->spol;
    }

    public function getOpombe()
    {
        return $this->opombe;
    }

    public function getDrzavljanstvo()
    {
        return $this->drzavljanstvo;
    }

    public function getDrzavaRojstva()
    {
        return $this->drzavaRojstva;
    }

    public function getKrajRojstva()
    {
        return $this->krajRojstva;
    }

    public function getUser()
    {
        return $this->user;
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

    public function getAlternacije()
    {
        return $this->alternacije;
    }

    public function getPogodbe()
    {
        return $this->pogodbe;
    }

    public function getZaposlitve()
    {
        return $this->zaposlitve;
    }

    public function getNaslov()
    {
        return $this->naslov;
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

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setIme($ime)
    {
        $this->ime = $ime;
        return $this;
    }

    public function setPriimek($priimek)
    {
        $this->priimek = $priimek;
        return $this;
    }

    public function setFunkcija($funkcija)
    {
        $this->funkcija = $funkcija;
        return $this;
    }

    public function setSrednjeIme($srednjeIme)
    {
        $this->srednjeIme = $srednjeIme;
        return $this;
    }

    public function setPolnoIme($polnoIme)
    {
        $this->polnoIme = $polnoIme;
        return $this;
    }

    public function setPsevdonim($psevdonim)
    {
        $this->psevdonim = $psevdonim;
        return $this;
    }

    public function setNaslovi($naslovi)
    {
        $this->naslovi = $naslovi;
        return $this;
    }

    public function setEmail($email)
    {
        $this->email = $email;
        return $this;
    }

    public function setDatumRojstva($datumRojstva)
    {
        $this->datumRojstva = $datumRojstva;
        return $this;
    }

    public function setEmso($emso)
    {
        $this->emso = $emso;
        return $this;
    }

    public function setDavcna($davcna)
    {
        $this->davcna = $davcna;
        return $this;
    }

    public function setSpol($spol)
    {
        $this->spol = $spol;
        return $this;
    }

    public function setOpombe($opombe)
    {
        $this->opombe = $opombe;
        return $this;
    }

    public function setDrzavljanstvo($drzavljanstvo)
    {
        $this->drzavljanstvo = $drzavljanstvo;
        return $this;
    }

    public function setDrzavaRojstva($drzavaRojstva)
    {
        $this->drzavaRojstva = $drzavaRojstva;
        return $this;
    }

    public function setKrajRojstva($krajRojstva)
    {
        $this->krajRojstva = $krajRojstva;
        return $this;
    }

    public function setUser(\Aaa\Entity\User $user = null)
    {
        $this->user = $user;
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

    public function setAlternacije($alternacije)
    {
        $this->alternacije = $alternacije;
        return $this;
    }

    public function setPogodbe($pogodbe)
    {
        $this->pogodbe = $pogodbe;
        return $this;
    }

    public function setZaposlitve($zaposlitve)
    {
        $this->zaposlitve = $zaposlitve;
        return $this;
    }

    public function setNaslov($naslov)
    {
        $this->naslov = $naslov;
        return $this;
    }

    public function getAvtorjiBesedil()
    {
        return $this->avtorjiBesedil;
    }

    public function setAvtorjiBesedil($avtorjiBesedil)
    {
        $this->avtorjiBesedil = $avtorjiBesedil;
        return $this;
    }

    function getTwitter()
    {
        return $this->twitter;
    }

    function getSkype()
    {
        return $this->skype;
    }

    function getFb()
    {
        return $this->fb;
    }

    function setTwitter($twitter)
    {
        $this->twitter = $twitter;
        return $this;
    }

    function setSkype($skype)
    {
        $this->skype = $skype;
        return $this;
    }

    function setFb($fb)
    {
        $this->fb = $fb;
        return $this;
    }

}
