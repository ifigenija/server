<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * Entiteta za naslove
 *
 * @ORM\Entity(repositoryClass="App\Repository\PostniNaslovi")
 * @ORM\Table(name="PostniNaslovi")
 * @Max\I18n(label="Poštni naslov",plural="Poštni naslovi")
 * @Max\Lookup(ident="naziv", label="ulica", search={"naziv", "ulica", "posta", "postaNaziv"})
 * @Max\Id(prefix="0006")
 *  */
class PostniNaslov
        extends \Max\Entity\Base
{

    /**
     * ID naslova
     *
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID poštnega naslova")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * Lastnik postnega naslova če gre za klienta 
     * 
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="naslovi")
     * @ORM\JoinColumn(name="klient_id", referencedColumnName="id")
     * 
     * @Max\I18n(label="postniNaslov.popa",  description="postniNaslov.d.popa")
     * @Max\Ui(type="hiddenid") 
     * @var Popa
     */
    protected $popa;

    /**
     * Lastnik poštnega naslova če gre ze osebo 
     * 
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="naslovi")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="postniNaslov.oseba",  description="postniNaslov.d.oseba")
     * @Max\Ui(type="hiddenid")
     * @var Oseba
     */
    protected $oseba;

    /**
     * Naziv
     *
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="postniNaslov.naziv", description="postniNaslov.d.naziv")
     * @Max\Ui(type="naziv",ident=true, required=true )
     * @var string
     */
    protected $naziv;

    /**
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="postniNaslov.nazivDva", description="postniNaslov.d.nazivDva")
     * @var string
     */
    protected $nazivDva;

    /**
     * Ulica naslovnika
     *
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="postniNaslov.ulica",  description="postniNaslov.d.ulica")
     * @Max\Ui(required=true)
     * @var string
     */
    protected $ulica;

    /**
     * Dodatno polje za ulico (ulica2)
     *
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="postniNaslov.ulicaDva",  description="postniNaslov.d.ulicaDva")
     * @var string
     */
    protected $ulicaDva;

    /**
     * Pošta
     *  poštna številka
     *
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="postniNaslov.posta", description="postniNaslov.d.posta")
     * @Max\Ui(group="posta", required=true)
     * @var string
     */
    protected $posta;

    /**
     * Pošta
     *  naziv pošte
     *
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="postniNaslov.postaNaziv", description="postniNaslov.d.postaNaziv")
     * @Max\Ui(group="posta", required=true)
     * @var string
     */
    protected $postaNaziv;

    /**
     * Pokrajina
     *
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="postniNaslov.pokrajina",  description="Pokrajina v kateri je ta naslov")
     * @var string
     */
    protected $pokrajina;

    /**
     * Država naslova
     *
     * 
     * @ORM\ManyToOne(targetEntity="App\Entity\Drzava")
     * @ORM\JoinColumn(name="drzava_id", referencedColumnName="id")
     * @Max\I18n(label="postniNaslov.drzava", description="postniNaslov.d.drzava")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Drzava
     */
    protected $drzava;

    /**
     * Je klient iz EU
     *  checkbox 
     *
     * @ORM\Column(type="boolean", length=1, nullable=true)
     * @Max\I18n(label="postniNaslov.jeeu", description="postniNaslov.d.jeeu")
     * @Max\Ui(type="boolcheckbox",group="Davčni podatki")
     * @var boolean
     */
    protected $jeeu = true;

    /**
     * Oznaka ali je naslov privzet
     *  (npr. za poslovnega partnerja, ki lahko ima več naslovov)
     *
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="postniNaslov.privzeti", description="postniNaslov.d.privzeti")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $privzeti = false;

    /**
     * Prostori s tem naslovom
     * 
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Prostor", mappedBy="naslov")
     * @var <Prostori>
     */
    protected $prostori;

    public function __construct()
    {
        $this->prostori = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->oseba || $this->popa, "Naslov nima lastnika. Oseba ali poslovni partner sta obvezna", 1000304);
        $this->expect(!($this->popa && $this->oseba), "Nalov je lahko samo ali poslovni partner ali oseba", 1000305);
        $this->expect($this->naziv, "naziv je obvezen podatek", 1000306);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getPopa()
    {
        return $this->popa;
    }

    public function getOseba()
    {
        return $this->oseba;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getNazivDva()
    {
        return $this->nazivDva;
    }

    public function getUlica()
    {
        return $this->ulica;
    }

    public function getUlicaDva()
    {
        return $this->ulicaDva;
    }

    public function getPosta()
    {
        return $this->posta;
    }

    public function getPostaNaziv()
    {
        return $this->postaNaziv;
    }

    public function getPokrajina()
    {
        return $this->pokrajina;
    }

    public function getDrzava()
    {
        return $this->drzava;
    }

    public function getJeeu()
    {
        return $this->jeeu;
    }

    public function getPrivzeti()
    {
        return $this->privzeti;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setPopa(Popa $popa=null)
    {
        $this->popa = $popa;
        return $this;
    }

    public function setOseba(Oseba $oseba=null)
    {
        $this->oseba = $oseba;
        return $this;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setNazivDva($nazivDva)
    {
        $this->nazivDva = $nazivDva;
        return $this;
    }

    public function setUlica($ulica)
    {
        $this->ulica = $ulica;
        return $this;
    }

    public function setUlicaDva($ulicaDva)
    {
        $this->ulicaDva = $ulicaDva;
        return $this;
    }

    public function setPosta($posta)
    {
        $this->posta = $posta;
        return $this;
    }

    public function setPostaNaziv($postaNaziv)
    {
        $this->postaNaziv = $postaNaziv;
        return $this;
    }

    public function setPokrajina($pokrajina)
    {
        $this->pokrajina = $pokrajina;
        return $this;
    }

    public function setDrzava(\App\Entity\Drzava $drzava=null)
    {
        $this->drzava = $drzava;
        return $this;
    }

    public function setJeeu($jeeu)
    {
        $this->jeeu = $jeeu;
        return $this;
    }

    public function setPrivzeti($privzeti)
    {
        $this->privzeti = $privzeti;
        return $this;
    }

}
