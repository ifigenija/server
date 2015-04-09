<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="App\Repository\Osebe")
 * @ORM\Table(name="kose")
 *
 * @Max\I18n(label="Kontaktna oseba",plural="Kontaktne osebe")
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
     * @Max\Ui(type="toone")
     * @Max\I18n(label="Klient", hint="ID klienta", description="Poslovni partner od katerega je kontaktna oseba")
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
     * @Max\I18n(label="Naziv", description="Naziv kontaktne osebe")
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
     * Naslov kontaktne osebe
     *
     * @ORM\ManyToOne(targetEntity="App\Entity\PostniNaslov")
     * @ORM\JoinColumn(name="naslov_id", referencedColumnName="id")
     *
     * @Max\Ui(targetEntity="Max\Entity\PostniNaslov",type="addresslookup", master="popa")
     */
    protected $naslov;

    /**
     * Elektronski naslov
     *  naslov e-pošte
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

    function getId()
    {
        return $this->id;
    }

    function getPopa()
    {
        return $this->popa;
    }

    function getNaziv()
    {
        return $this->naziv;
    }

    function getIme()
    {
        return $this->ime;
    }

    function getPriimek()
    {
        return $this->priimek;
    }

    function getPesvdonim()
    {
        return $this->pesvdonim;
    }

    function getFunkcija()
    {
        return $this->funkcija;
    }

    function getNaslov()
    {
        return $this->naslov;
    }

    function getEmail()
    {
        return $this->email;
    }

    function getDatumRojstva()
    {
        return $this->datumRojstva;
    }

    function getEmso()
    {
        return $this->emso;
    }

    function getDavcna()
    {
        return $this->davcna;
    }

    function getSpol()
    {
        return $this->spol;
    }

    function getOpombe()
    {
        return $this->opombe;
    }

    function getDrzavljanstvo()
    {
        return $this->drzavljanstvo;
    }

    function getDrzavaRojstva()
    {
        return $this->drzavaRojstva;
    }

    function getKrajRojstva()
    {
        return $this->krajRojstva;
    }

    function getUser()
    {
        return $this->user;
    }

    function getTelefonske()
    {
        return $this->telefonske;
    }

    function getTrrji()
    {
        return $this->trrji;
    }

    function getAlternacije()
    {
        return $this->alternacije;
    }

    function getPogodbe()
    {
        return $this->pogodbe;
    }

    function getSodelovanja()
    {
        return $this->sodelovanja;
    }

    function setId($id)
    {
        $this->id = $id;
    }

    function setPopa(Popa $popa)
    {
        $this->popa = $popa;
    }

    function setNaziv($naziv)
    {
        $this->naziv = $naziv;
    }

    function setIme($ime)
    {
        $this->ime = $ime;
    }

    function setPriimek($priimek)
    {
        $this->priimek = $priimek;
    }

    function setPesvdonim($pesvdonim)
    {
        $this->pesvdonim = $pesvdonim;
    }

    function setFunkcija($funkcija)
    {
        $this->funkcija = $funkcija;
    }

    function setNaslov($naslov)
    {
        $this->naslov = $naslov;
    }

    function setEmail($email)
    {
        $this->email = $email;
    }

    function setDatumRojstva($datumRojstva)
    {
        $this->datumRojstva = $datumRojstva;
    }

    function setEmso($emso)
    {
        $this->emso = $emso;
    }

    function setDavcna($davcna)
    {
        $this->davcna = $davcna;
    }

    function setSpol($spol)
    {
        $this->spol = $spol;
    }

    function setOpombe($opombe)
    {
        $this->opombe = $opombe;
    }

    function setDrzavljanstvo($drzavljanstvo)
    {
        $this->drzavljanstvo = $drzavljanstvo;
    }

    function setDrzavaRojstva($drzavaRojstva)
    {
        $this->drzavaRojstva = $drzavaRojstva;
    }

    function setKrajRojstva($krajRojstva)
    {
        $this->krajRojstva = $krajRojstva;
    }

    function setUser($user)
    {
        $this->user = $user;
    }

    function setTelefonske($telefonske)
    {
        $this->telefonske = $telefonske;
    }

    function setTrrji($trrji)
    {
        $this->trrji = $trrji;
    }

    function setAlternacije($alternacije)
    {
        $this->alternacije = $alternacije;
    }

    function setPogodbe($pogodbe)
    {
        $this->pogodbe = $pogodbe;
    }

    function setSodelovanja($sodelovanja)
    {
        $this->sodelovanja = $sodelovanja;
    }



}
