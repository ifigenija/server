<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="\App\Repository\Osebe")
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
     * @ORM\OneToMany(targetEntity="App\Entity\Telefonska", mappedBy="oseba")
     */
    private $telefonske;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Trr", mappedBy="oseba")
     */
    private $trrji;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="oseba")
     */
    private $alternacija;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Pogodba", mappedBy="oseba")
     */
    private $pogodba;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Zaposlitev", mappedBy="oseba")
     */
    private $sodelovanje;

    function getId()
    {
        return $this->id;
    }

    function getPopa()
    {
        return $this->popa;
    }

    function getPozkose()
    {
        return $this->pozkose;
    }

    function getNaziv()
    {
        return $this->naziv;
    }

    function getFunkcija()
    {
        return $this->funkcija;
    }

    function getDela()
    {
        return $this->dela;
    }

    function getNaslov()
    {
        return $this->naslov;
    }

    function getEmail()
    {
        return $this->email;
    }

    function getUser()
    {
        return $this->user;
    }

    function getTelefonske()
    {
        return $this->telefonske;
    }

    function getAlternacija()
    {
        return $this->alternacija;
    }

    function getPogodba()
    {
        return $this->pogodba;
    }

    function getSodelovanje()
    {
        return $this->sodelovanje;
    }

    function setId($id)
    {
        $this->id = $id;
    }

    function setPopa(Popa $popa)
    {
        $this->popa = $popa;
    }

    function setPozkose($pozkose)
    {
        $this->pozkose = $pozkose;
    }

    function setNaziv($naziv)
    {
        $this->naziv = $naziv;
    }

    function setFunkcija($funkcija)
    {
        $this->funkcija = $funkcija;
    }

    function setDela($dela)
    {
        $this->dela = $dela;
    }

    function setNaslov($naslov)
    {
        $this->naslov = $naslov;
    }

    function setEmail($email)
    {
        $this->email = $email;
    }

    function setUser($user)
    {
        $this->user = $user;
    }

    function setTelefonske($telefonske)
    {
        $this->telefonske = $telefonske;
    }

    function setAlternacija($alternacija)
    {
        $this->alternacija = $alternacija;
    }

    function setPogodba($pogodba)
    {
        $this->pogodba = $pogodba;
    }

    function setSodelovanje($sodelovanje)
    {
        $this->sodelovanje = $sodelovanje;
    }

}
