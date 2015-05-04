<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="App\Repository\Osebe")
 * 
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
     * @var string
     *
     * @Max\I18n(label="ID", description="ID kontaktne osebe")
     */
    protected $id;

    /**
     * Klient
     *  Poslovni partner od katerega je kontaktna oseba
     *
     * @var \App\Entity\Popa
     *
     * @Max\Ui(type="tomany")  
     * @Max\I18n(label="Klient",  description="Poslovni partner od katerega je kontaktna oseba")
     * @ORM\ManyToMany(targetEntity="\App\Entity\Popa", mappedBy="osebe")
     */
    protected $popa;

    /**
     * Naziv kontaktne osebe
     *
     * @var string
     *
     * @ORM\Column(length=40, nullable=true)
     *
     * @Max\I18n(label="Naziv", description="Naziv osebe  (g., dr., ga, prof.dr.) ")
     */
    protected $naziv;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Ime", description="Ime osebe ")
     * @var string
     */
    private $ime;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Priimek", description="Priimek osebe ")
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
     *
     * @Max\Ui(type="tomany")
     */
    protected $naslovi;

    /**
     * Elektronski naslov
     *  naslov e-pošte
     * Uporablja se tudi kot uporabniško ime pri prijavi v aplikacijo.
     *
     * @ORM\Column(length=40, nullable=true)
     * @var string
     *
     * @Max\I18n(label="E-pošta", description="Naslov elektronske pošte")   
     * @Max\Ui(type="email",icon="fa fa-afna")
     */
    protected $email = '';

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Datum rojstva", description="Rojstni datum oseba")   
     * @Max\Ui(icon="fa fa-birthday-cake")
     */
    private $datumRojstva;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Emšo", description="Enotna matična številka občana")   
     */
    private $emso;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Davčna", description="Davčna številka osebe")   
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
     */
    private $drzavaRojstva;

    /**
     * @ORM\Column(nullable=true)
     * @Max\I18n(label="Kraj rojstva", description="Kraj rojstva osebe")   
     */
    private $krajRojstva;

    /**
     * @ORM\OneToOne(targetEntity="\Aaa\Entity\User")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id", unique=true)
     * @Max\Ui(type="toone")
     * @var Aaa\Entity\User
     */
    private $user;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Telefonska", mappedBy="oseba", orphanRemoval=true)
     * @Max\Ui(type="tomany")
     * @var array
     */
    private $telefonske;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Trr", mappedBy="oseba", orphanRemoval=true)
     * @Max\Ui(type="tomany")
     * @var array
     */
    private $trrji;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="oseba")
     * @Max\Ui(type="tomany")
     * @var array
     */
    private $alternacije;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Pogodba", mappedBy="oseba")
     * @Max\Ui(type="tomany")
     * @var array
     */
    private $pogodbe;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Zaposlitev", mappedBy="oseba")
     * @Max\Ui(type="tomany")
     * @var array
     */
    private $sodelovanja;

    /**
     * 
     * 
     * @param string $mode
     */
    public function validate($mode = 'update')
    {
        $this->expect($this->ime, "Ime je obvezen podatek", 1000301);
        $this->expect($this->priimek, "Priimek je obvezen podatek", 1000302);
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

    public function getPopa()
    {
        return $this->popa;
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

    public function setPopa(App\Entity\Popa $popa)
    {
        $this->popa = $popa;
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

    public function setUser(Aaa\Entity\User $user)
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
