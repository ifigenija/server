<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta za osebe
 * 
 * @ORM\Entity(repositoryClass="App\Repository\Osebe")
 * @Max\Lookup(ident="sifra",label="naziv",search={"ime","priimek","email"},extra={"ime","priimek", "email"})
 * @Max\I18n(label="Kontaktna oseba",plural="Kontaktne osebe")
 * @Max\Id(prefix="0009")
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
     * @ORM\Column(unique=true, length=4, nullable=false)
     * @Max\I18n(label="Šifra", description="Unikatna šifra osebe")
     * @Max\Ui(ident=true, type="sifra",icon="fa fa-barcode",group="Osnovni podatki")
     * @var string
     */
    protected $sifra;

    /**
     * Naziv kontaktne osebe
     *
     * @ORM\Column(length=40, nullable=true)
     * @Max\I18n(label="Naziv", description="Naziv osebe  (g., dr., ga, prof.dr.) ")
     * @Max\Ui(type="naziv")  
     * @var string
     */
    protected $naziv;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Ime", description="Ime osebe ")
     * @Max\Ui(type="naziv")  
     * @var string
     */
    private $ime;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Priimek", description="Priimek osebe ")
     * @Max\Ui(type="naziv")  
     * @var string
     */
    private $priimek;

    /**
     * @ORM\Column(length=40, nullable=true)
     * @Max\I18n(label="Funkcija", description="Funkcija osebe ")
     * @var string
     */
    private $funkcija;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Srednje ime", description="Srednje ime osebe ")
     * @var string
     */
    private $srednjeIme;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Psevdonim", description="Psevdonim osebe ")
     * @var string
     */
    private $psevdonim;

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
     * @ORM\Column(length=40, nullable=true)
     * @Max\I18n(label="E-pošta", description="Naslov elektronske pošte")   
     * @Max\Ui(type="email",icon="fa fa-afna")
     * @var string
     */
    protected $email = '';

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="Datum rojstva", description="Rojstni datum oseba")   
     * @Max\Ui(icon="fa fa-birthday-cake")
     * @var string
     */
    private $datumRojstva;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Emšo", description="Enotna matična številka občana")   
     * @Max\Ui(type="sifra")
     * @var string
     */
    private $emso;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Davčna", description="Davčna številka osebe")   
     * @Max\Ui(type="sifra")
     * @var string
     */
    private $davcna;

    /**
     * @ORM\Column(type="string", length=1, nullable=true)
     * @Max\I18n(label="Spol", description="Spol osebe")   
     * @Max\Ui(type="select",opts="oseba.spol",group="Osnovni podatki",required=true)
     * @var string
     */
    private $spol;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Opombe", description="Opombe za osebo")   
     * @var string
     */
    private $opombe;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Državljanstvo", description="Državljanstvo osebe")   
     * @var string
     */
    private $drzavljanstvo;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Država rojstva", description="Država rojstva osebe")   
     * @var string
     */
    private $drzavaRojstva;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Kraj rojstva", description="Kraj rojstva osebe")   
     * @var string
     */
    private $krajRojstva;

    /**
     * @ORM\OneToOne(targetEntity="Aaa\Entity\User")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id", unique=true)
     * @Max\Ui(type="toone")
     * @var \Aaa\Entity\User
     */
    private $user;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Telefonska", mappedBy="oseba", orphanRemoval=true)
     * @Max\I18n(label="Telefonske številke", description="Telefonske številke osebe")   
     * @Max\Ui(type="tomany")
     * @var <Telefonske>
     */
    private $telefonske;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Trr", mappedBy="oseba", orphanRemoval=true)
     * @Max\I18n(label="Trr-ji", description="Transaksijski računi osebe")   
     * @Max\Ui(type="tomany")
     * @var <Trrji>
     */
    private $trrji;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\KontaktnaOseba", mappedBy="oseba")
     * var <KontaktneOsebe>
     */
    private $kontaktneOsebe;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="oseba")
     * @Max\I18n(label="Alternacije", description="Alternacije osebe")   
     * @Max\Ui(type="tomany")
     * @var <Alternacije>
     */
    private $alternacije;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Pogodba", mappedBy="oseba")
     * @Max\I18n(label="Pogodbe", description="Pogodbe osebe")   
     * @Max\Ui(type="tomany")
     * @var <Pogodbe>
     */
    private $pogodbe;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Zaposlitev", mappedBy="oseba")
     * @Max\I18n(label="Sodelovanja", description="Sodelovanja osebe")   
     * @Max\Ui(type="tomany")
     * @var <Sodelovanja>
     */
    private $sodelovanja;

    /**
     * 
     * @param string $mode
     */
    public function validate($mode = 'update')
    {
        $this->expect($this->ime, "Ime je obvezen podatek", 1000301);
        $this->expect($this->priimek, "Priimek je obvezen podatek", 1000302);
        $this->expect($this->sifra, "Šifra je obvezen podatek", 1000303);
    }

    /**
     * Vrne polno ime Osebe. Uporablja se za prikaze v seznamih 
     * 
     * @return type
     */
    function getPolnoIme()
    {
        return sprintf("%s %s %s", $this->ime, $this->srednjeIme, $this->priimek);
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

    public function getSodelovanja()
    {
        return $this->sodelovanja;
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

    public function setUser(\Aaa\Entity\User $user)
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

    public function setSodelovanja($sodelovanja)
    {
        $this->sodelovanja = $sodelovanja;
        return $this;
    }

}
