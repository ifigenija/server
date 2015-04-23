<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="App\Repository\Osebe")
 * 
 * @Max\I18n(label="Kontaktna oseba",plural="Kontaktne osebe")
 * @Max\Id(prefix="0003")
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
     * @var Popa
     *
     * @Max\Ui(type="toone")  //$$ rb začasno odstranil
     * @Max\I18n(label="Klient",  description="Poslovni partner od katerega je kontaktna oseba")
     * @ORM\ManyToMany(targetEntity="App\Entity\Popa", mappedBy="osebe")
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
     * @Max\Ui(ident=true)
     */
    protected $naziv;

    /**
     * @ORM\Column(nullable=true)
     */
    private $ime;

    /**
     * @ORM\Column(nullable=true)
     */
    private $priimek;

    /**
     * @ORM\Column(nullable=true)
     */
    private $pesvdonim;

    /**
     * @ORM\Column(length=40, nullable=true)
     */
    private $funkcija;

    /**
     * @ORM\Column(nullable=true)
     */
    private $srednjeIme;

    /**
     * @ORM\Column(nullable=true)
     */
    private $psevdonim;

    /**
     * Naslov kontaktne osebe
     *
     * @ORM\OneToMany(targetEntity="App\Entity\PostniNaslov", mappedBy="oseba")
     *
     * @Max\Ui(targetEntity="App\Entity\PostniNaslov", master="oseba")
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
     * @Max\Ui(type="email",icon="fa fa-afna")
     */
    protected $email = '';

    /**
     * @ORM\Column(nullable=true)
     */
    private $datumRojstva;

    /**
     * @ORM\Column(nullable=true)
     */
    private $emso;

    /**
     * @ORM\Column(nullable=true)
     */
    private $davcna;

    /**
     * @ORM\Column(type="string", length=1, nullable=true)
     * @Max\Ui(type="select",opts="oseba.spol",group="Osnovni podatki",required=true)
     */
    private $spol;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $opombe;

    /**
     * @ORM\Column(nullable=true)
     */
    private $drzavljanstvo;

    /**
     * @ORM\Column(nullable=true)
     */
    private $drzavaRojstva;

    /**
     * @ORM\Column(nullable=true)
     */
    private $krajRojstva;

    /**
     * @ORM\OneToOne(targetEntity="Aaa\Entity\User")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id", unique=true)
     */
    private $user;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Telefonska", mappedBy="oseba", orphanRemoval=true)
     */
    private $telefonske;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Trr", mappedBy="oseba")
     */
    private $trrji;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="oseba")
     */
    private $alternacije;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Pogodba", mappedBy="oseba")
     */
    private $pogodbe;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Zaposlitev", mappedBy="oseba")
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

    public function getPesvdonim()
    {
        return $this->pesvdonim;
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

    public function setPopa(Popa $popa)
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

    public function setPesvdonim($pesvdonim)
    {
        $this->pesvdonim = $pesvdonim;
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

    public function setUser($user)
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
