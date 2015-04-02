<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="\App\Repository\Osebe")
 * @ORM\Table(name="kose")
 *
 * @Max\I18n(label="Kontaktna oseba",plural="Kontaktne osebe")
 * @Max\Lookup(ident="email", search={"naziv"},required={"popa"})
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
     * 
     * 
     *
     * @Max\Ui(type="toone")
     * @Max\I18n(label="Klient", hint="ID klienta", description="Poslovni partner od katerega je kontaktna oseba")
     * @ORM\ManyToMany(targetEntity="App\Entity\Popa", mappedBy="oseba")
     */
    protected $popa;

    /**
     * Zaporedna številka kontaktne osebe pri klientu
     *
     * @var string
     *
     * 
     * @Max\I18n(label="Zaporedna")
     *
     * @Max\Ui(type="sifra")
     * @Max\I18n(label="Zaporedna številka", description="Zaporedna številka kontaktne osebe pri klientu")
     */
    protected $pozkose;

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
     * @ORM\Column(length=40, nullable=true)
     */
    private $funkcija;

    /**
     * Opis delovnega mesta
     *
     * @var string
     *
     * 
     *
     * @Max\I18n(label="Delovno mesto", description="Opis delovnega mesta")
     */
    protected $dela;

    /**
     * Telefonska številka kontaktne osebe
     *
     * @var string
     *
     * 
     *
     * @Max\I18n(label="Telefonska številka")
     * @Max\Ui(icon="fa fa-phone")
     */
    protected $tel = '';

    /**
     * Telefax kontaktne osebe
     *
     * @var string
     *
     * 
     *
     * @Max\I18n(label="Fax")
     * @Max\Ui(icon="fa fa-inbox")
     */
    protected $fax = '';

    /**
     * Mobilna številka kontaktne osebe
     *
     * @var string
     *
     * 
     *
     * @Max\I18n(label="Mobilna številka")
     * @Max\Ui(icon="fa fa-mobile-phone")
     */
    protected $mobi = '';

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
     * @ORM\OneToOne(targetEntity="Aaa\Entity\User", inversedBy="oseba")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id", unique=true)
     */
    private $user;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Telefonska", mappedBy="oseba")
     */
    private $telefonske;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="oseba")
     */
    private $alternacija;

    /**
     * Interno polje - uporabnik, ki je zadnji spreminjal entiteto
     * To polje se ne vnaša. Uporabnika dobimo iz prijave v aplikacijo.
     *
     *  
     */
    protected $upor;

    /**
     * Interno polje - datum in ura zadnjega spreminjanja entitete
     * To polje se ne vnaša. Podatek vzamemo iz tekočega datuma in ure.
     *
     * 
     * @var string
     */
    protected $datKnj;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Pogodba", mappedBy="oseba")
     */
    private $pogodba;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Sodelovanje", mappedBy="oseba")
     */
    private $sodelovanje;

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function getPopa()
    {
        return $this->popa;
    }

    public function setPopa($popa)
    {
        $this->popa = $popa;
        return $this;
    }

    public function getPozkose()
    {
        return $this->pozkose;
    }

    public function setPozkose($pozkose)
    {
        $this->pozkose = $pozkose;
        return $this;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function getDela()
    {
        return $this->dela;
    }

    public function setDela($dela)
    {
        $this->dela = $dela;
        return $this;
    }

    public function getTel()
    {
        return $this->tel;
    }

    public function setTel($tel)
    {
        $this->tel = $tel;
        return $this;
    }

    public function getFax()
    {
        return $this->fax;
    }

    public function setFax($fax)
    {
        $this->fax = $fax;
        return $this;
    }

    public function getMobi()
    {
        return $this->mobi;
    }

    public function setMobi($mobi)
    {
        $this->mobi = $mobi;
        return $this;
    }

    public function getNaslov()
    {
        return $this->naslov;
    }

    public function setNaslov($naslov)
    {
        $this->naslov = $naslov;
        return $this;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function setEmail($email)
    {
        $this->email = $email;
        return $this;
    }

    public function getUpor()
    {
        return $this->upor;
    }

    public function setUpor($upor)
    {
        $this->upor = $upor;
        return $this;
    }

    public function getDatKnj()
    {
        return $this->datKnj;
    }

    public function setDatKnj($datKnj)
    {
        $this->datKnj = $datKnj;
        return $this;
    }

}
