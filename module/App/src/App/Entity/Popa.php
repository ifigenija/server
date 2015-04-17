<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta za poslovne partnerje
 *
 * @ORM\Entity(repositoryClass="App\Repository\Popa")
 *
 * @ORM\Table(name="popa")
 * @Max\I18n(label="Poslovni partner",plural="Poslovni partnerji")
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
     * @var integer
     */
    protected $id;

    /**
     * Šifra klienta
     *
     * @ORM\Column(unique=true, length=4, nullable=false)
     * @Max\I18n(label="Šifra", description="Unikatna šifra klienta")
     * @Max\Ui(type="sifra",icon="fa fa-barcode",ident=true,group="Osnovni podatki")
     * @var string
     */
    protected $sifra;

    /**
     * Tip klienta
     *  K-kupec
     *  D-dobavitelj
     *  E-evidenčni partner
     *  K-koproducent
     * 
     *   $$rb: začasno sem dodal nullable = true 
     * @ORM\Column(length=1,nullable=true)
     * @Max\Ui(type="select",opts="popa.Maxkli",group="Osnovni podatki",required=true)
     * @Max\I18n(label="Tip klienta", hint="K-kupec, D-dobavitelj, E-evidenčno", description="Max klienta (kupec, dobavitelj, evidenčni partner)")
     * @var string
     */
    protected $tipkli;

    /**
     * Status klienta
     *  AK-aktiven
     *  NA-neaktiven
     *
     * @ORM\Column(length=2, nullable=true)
     * @Max\Ui(type="select",opts="popa.stakli",group="Osnovni podatki", required=true)
     * @Max\I18n(label="Status klienta", hint="AK-aktiven, NA-neaktiven")
     * @var string
     */
    protected $stakli;

    /**
     * Naziv klienta
     *
     * @ORM\Column(length=60, nullable=false)
     * @Max\Ui(type="naziv",group="Osnovni podatki")
     * @Max\I18n(label="Naziv", description="Naziv klienta")
     * @var string
     */
    protected $naziv;

    /**
     * Dodatno polje za naziv klienta
     *
     * @ORM\Column(length=60, nullable=true)
     * @Max\Ui(type="naziv",group="Osnovni podatki")
     * @Max\I18n(label="Dodatni naziv", description="Dodatni naziv za klienta")
     * @var string
     */
    protected $naziv1 = '';

    /**
     * Panoga
     *
     * @ORM\Column(length=60, nullable=true)
     * @Max\Ui(type="naziv",group="Osnovni podatki")
     * @Max\I18n(label="Panoga", description="Panoga")
     * @var string
     */
    protected $panoga = '';

    /**
     * Email naslov
     *
     * @ORM\Column(length=50, nullable=true)
     * @Max\Ui(type="email",group="Kontaktni podatki")
     * @Max\I18n(label="E-pošta", description="E-poštni naslov")
     * @var string
     */
    protected $email;

    /**
     * Url spletne strani
     *
     * @ORM\Column(length=100, nullable=true)
     * @Max\Ui(type="naziv",icon="fa fa-globe",group="Kontaktni podatki")
     * @Max\I18n(label="Spletna stran", description="URL naslov spletne strani")
     * @var string
     */
    protected $url = '';

    /**
     * Opomba
     *  tekstovno polje za dodatne podatke o klientu
     *
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Opomba", description="Opomba")
     * @var string
     */
    protected $opomba;

    /**
     * Država klienta
     *
     * @ORM\ManyToOne(targetEntity="App\Entity\Drzava")
     * @ORM\JoinColumn(name="drzava_id", referencedColumnName="id")
     * $$rb echo  nullable=false
     * @Max\Ui(group="Kontaktni podatki",required=true)
     * @Max\I18n(label="Država", description="Država klienta")
     */
    protected $drzava;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Oseba", inversedBy="popa")
     * @ORM\JoinTable(
     *     name="Oseba2Popa",
     *     joinColumns={@ORM\JoinColumn(name="popa_id", referencedColumnName="id", nullable=false)},
     *     inverseJoinColumns={@ORM\JoinColumn(name="oseba_id", referencedColumnName="id", nullable=false)}
     * )
     */
    private $osebe;

    /**
     * Klientovi naslovi
     *
     * @ORM\OneToMany(targetEntity="App\Entity\PostniNaslov", mappedBy="klient", orphanRemoval=true)

     */
    protected $naslovi;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Telefonska", mappedBy="popa", orphanRemoval=true)
     */
    private $telefonske;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Trr", mappedBy="popa")
     */
    private $trrji;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Pogodba", mappedBy="popa")
     */
    private $pogodbe;

    /**
     * ID za DDV klienta
     *
     * @var string
     *
     * @ORM\Column(length=18, nullable=true)
     * @Max\Ui(group="Davčni podatki")
     * @Max\I18n(label="ID za DDV", description="Davčna številka klienta")
     */
    protected $idddv;

    /**
     * Matična številka klienta
     *
     * @ORM\Column(length=20, nullable=true)
     * @Max\Ui(group="Davčni podatki")
     * @Max\I18n(label="Matična številka", description="Matična številka klienta")
     * @var string
     */
    protected $maticna;

    /**
     * Je zavezanec za DDV
     *  checkbox - Da, Ne
     *
     * @var string
     *
     * @ORM\Column(length=1, nullable=true)
     * @Max\Ui(type="checkbox",group="Davčni podatki")
     * @Max\I18n(label="Zavezanec za DV", description="Je klient zavezanec za DDV")
     */
    protected $zavezanec;

    /**
     * Je klient iz EU
     *  checkbox - Da, Ne
     *
     * @var string
     *
     * @ORM\Column(length=1, nullable=true)
     * @Max\Ui(type="checkbox",group="Davčni podatki")
     * @Max\I18n(label="Iz EU", description="Je klient iz EU")
     */
    protected $jeeu;

    /**
     * Zavezanec za DDV od
     *
     * @ORM\Column(type="date", nullable=true)
     * @Max\Ui(group="Davčni podatki")
     * @Max\I18n(label="Zavezanec za DDV od", hint="Datum", description="Zavezanec za DDV od dne")
     * @var string
     */
    protected $datZav;

    /**
     * Zavezanec za DDV do
     *
     * @todo polje je neuporabljeno
     *
     * @ORM\Column(type="date", nullable=true)
     * @Max\Ui(group="Davčni podatki")
     * @Max\I18n(label="Zavezanec za DDV do", hint="Datum", description="Zavezanec za DDV do dne")
     * @var string
     */
    protected $datnZav;

    /**
     * @ORM\Column(nullable=true)
     */
    private $zamejstvo;

    public function __construct()
    {
        $this->osebe   = new \Doctrine\Common\Collections\ArrayCollection();
        $this->trrji   = new \Doctrine\Common\Collections\ArrayCollection();
        $this->naslovi = new \Doctrine\Common\Collections\ArrayCollection();
        $this->pogodbe = new \Doctrine\Common\Collections\ArrayCollection();
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

    public function addKontaktne($emb)
    {
        if (!$this->kontaktne->contains($emb)) {
            $this->kontaktne->add($emb);
        }
    }

    public function removeKontaktne($emb)
    {
        if ($this->kontaktne->contains($emb)) {
            $this->kontaktne->removeElement($emb);
        }
    }

    public function getKlasifikacija()
    {
        return $this->klasifikacija;
    }

    public function setKlasifikacija($klasifikacija)
    {
        $this->klasifikacija = $klasifikacija;
        return $this;
    }

    public function getKontaktne()
    {
        return $this->kontaktne;
    }

    public function setKontaktne($kontaktne)
    {
        $this->kontaktne = $kontaktne;
        return $this;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

    public function getMaxkli()
    {
        return $this->Maxkli;
    }

    public function setMaxkli($Maxkli)
    {
        $this->Maxkli = $Maxkli;
        return $this;
    }

    public function getStakli()
    {
        return $this->stakli;
    }

    public function setStakli($stakli)
    {
        $this->stakli = $stakli;
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

    public function getNaziv1()
    {
        return $this->naziv1;
    }

    public function setNaziv1($naziv1)
    {
        $this->naziv1 = $naziv1;
        return $this;
    }

    public function getPanoga()
    {
        return $this->panoga;
    }

    public function setPanoga($panoga)
    {
        $this->panoga = $panoga;
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

    public function getEmail()
    {
        return $this->email;
    }

    public function setEmail($email)
    {
        $this->email = $email;
        return $this;
    }

    public function getTrr1()
    {
        return $this->trr1;
    }

    public function setTrr1($trr1)
    {
        $this->trr1 = $trr1;
        return $this;
    }

    public function getTrr2()
    {
        return $this->trr2;
    }

    public function setTrr2($trr2)
    {
        $this->trr2 = $trr2;
        return $this;
    }

    public function getTrr3()
    {
        return $this->trr3;
    }

    public function setTrr3($trr3)
    {
        $this->trr3 = $trr3;
        return $this;
    }

    public function getTrr4()
    {
        return $this->trr4;
    }

    public function setTrr4($trr4)
    {
        $this->trr4 = $trr4;
        return $this;
    }

    public function getOpomba()
    {
        return $this->opomba;
    }

    public function setOpomba($opomba)
    {
        $this->opomba = $opomba;
        return $this;
    }

    public function getRokPlacilaK()
    {
        return $this->rokPlacilaK;
    }

    public function setRokPlacilaK($rokPlacilaK)
    {
        $this->rokPlacilaK = $rokPlacilaK;
        return $this;
    }

    public function getRokPlacilaD()
    {
        return $this->rokPlacilaD;
    }

    public function setRokPlacilaD($rokPlacilaD)
    {
        $this->rokPlacilaD = $rokPlacilaD;
        return $this;
    }

    public function getDniPotrditve()
    {
        return $this->dniPotrditve;
    }

    public function setDniPotrditve($dniPotrditve)
    {
        $this->dniPotrditve = $dniPotrditve;
        return $this;
    }

    public function getRabat()
    {
        return $this->rabat;
    }

    public function setRabat($rabat)
    {
        $this->rabat = $rabat;
        return $this;
    }

    public function getDrzava()
    {
        return $this->drzava;
    }

    public function setDrzava($drzava)
    {
        $this->drzava = $drzava;
        return $this;
    }

    public function getPotnik()
    {
        return $this->potnik;
    }

    public function setPotnik($potnik)
    {
        $this->potnik = $potnik;
        return $this;
    }

    public function getIzjava()
    {
        return $this->izjava;
    }

    public function setIzjava($izjava)
    {
        $this->izjava = $izjava;
        return $this;
    }

    public function getIdddv()
    {
        return $this->idddv;
    }

    public function setIdddv($idddv)
    {
        $this->idddv = $idddv;
        return $this;
    }

    public function getMaticna()
    {
        return $this->maticna;
    }

    public function setMaticna($maticna)
    {
        $this->maticna = $maticna;
        return $this;
    }

    public function getZavezanec()
    {
        return $this->zavezanec;
    }

    public function setZavezanec($zavezanec)
    {
        $this->zavezanec = $zavezanec;
        return $this;
    }

    public function getJeeu()
    {
        return $this->jeeu;
    }

    public function setJeeu($jeeu)
    {
        $this->jeeu = $jeeu;
        return $this;
    }

    public function getDatZav()
    {
        return $this->datZav;
    }

    public function setDatZav($datZav)
    {
        $this->datZav = $datZav;
        return $this;
    }

    public function getDatnZav()
    {
        return $this->datnZav;
    }

    public function setDatnZav($datnZav)
    {
        $this->datnZav = $datnZav;
        return $this;
    }

    public function getUrl()
    {
        return $this->url;
    }

    public function setUrl($url)
    {
        $this->url = $url;
        return $this;
    }

    public function getNaslovi()
    {
        return $this->naslovi;
    }

    public function setNaslovi($naslovi)
    {
        $this->naslovi = $naslovi;
        return $this;
    }

    public function getPotnikKontakt()
    {
        return $this->potnikKontakt;
    }

    public function setPotnikKontakt($potnikKontakt)
    {
        $this->potnikKontakt = $potnikKontakt;
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

    function getTipkli()
    {
        return $this->tipkli;
    }

    function getOsebe()
    {
        return $this->osebe;
    }

    function getTelefonske()
    {
        return $this->telefonske;
    }

    function getTrrji()
    {
        return $this->trrji;
    }

    function getPogodbe()
    {
        return $this->pogodbe;
    }

    function getZamejstvo()
    {
        return $this->zamejstvo;
    }

    function setTipkli($tipkli)
    {
        $this->tipkli = $tipkli;
    }

    function setOsebe($osebe)
    {
        $this->osebe = $osebe;
    }

    function setTelefonske($telefonske)
    {
        $this->telefonske = $telefonske;
    }

    function setTrrji($trrji)
    {
        $this->trrji = $trrji;
    }

    function setPogodbe($pogodbe)
    {
        $this->pogodbe = $pogodbe;
    }

    function setZamejstvo($zamejstvo)
    {
        $this->zamejstvo = $zamejstvo;
    }

}
