<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta za naslove
 *
 * @ORM\Entity(repositoryClass="App\Repository\PostniNaslovi")
 * @ORM\Table(name="PostniNaslovi")
 * @Max\I18n(label="Poštni naslov",plural="Poštni naslovi")
 *
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
     *
     * @Max\I18n(label="Id", description="ID poštnega naslova")
     * @var integer
     */
    protected $id;

    /**
     * Lastnik postnega naslova če gre za klienta 
     * 
     * @var \Max\Entity\Popa
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa")
     * @ORM\JoinColumn(name="klient_id", referencedColumnName="id")
     * @Max\Ui(type="toone")
     */
    protected $popa;

    /**
     * Lastnik poštnega naslova če gre ze osebo 
     * 
     * @var \Max\Entity\Oseba
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="naslovi")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\Ui(type="toone")
     */
    protected $oseba;

    /**
     * Naziv
     *
     * @ORM\Column(length=50, nullable=true)
     *
     * @Max\I18n(label="Naziv", description="Naziv naslova")
     * @Max\Ui(ident=true)
     * @var string
     */
    protected $naziv;

    /**
     * @ORM\Column(length=50, nullable=true)
     */
    private $nazivDva;

    /**
     * Ulica naslovnika
     *
     * @ORM\Column(length=50, nullable=true)
     * @var string
     *
     * @Max\I18n(label="Ulica",  description="Ulica naslova")
     */
    protected $ulica;

    /**
     * Dodatno polje za ulico (ulica2)
     *
     * @ORM\Column(length=50, nullable=true)
     * @var string
     *
     * @Max\I18n(label="Ulica",  description="Dodatni podatki o ulici")
     */
    protected $ulicaDva;

    /**
     * Pošta
     *  poštna številka
     *
     * @ORM\Column(length=50, nullable=true)
     *
     * @Max\I18n(label="Pošta", description="Poštna številka")
     * @Max\Ui(group="posta")
     */
    protected $posta;

    /**
     * Pošta
     *  naziv pošte
     *
     * @ORM\Column(length=50, nullable=true)
     *
     * @Max\I18n(label="Naziv", description="Naziv pošte")
     * @Max\Ui(group="posta")
     */
    protected $postaNaziv;

    /**
     * Pokrajina
     *
     * @ORM\Column(length=50, nullable=true)
     * @var string
     *
     * @Max\I18n(label="Pokrajina",  description="Pokrajina v kateri je ta naslov")
     */
    protected $pokrajina;

    /**
     * Država naslova
     *
     * @var string
     * 
     * @ORM\ManyToOne(targetEntity="App\Entity\Drzava")
     * @ORM\JoinColumn(name="drzava_id", referencedColumnName="id")
     *
     * @Max\I18n(label="Država", description="Država")
     */
    protected $drzava;

    /**
     * Je klient iz EU
     *  checkbox 
     *
     * @ORM\Column(type="boolean", length=1, nullable=true)
     * @var bool
     *
     * @Max\Ui(type="boolcheckbox",group="Davčni podatki")
     * @Max\I18n(label="Iz EU", description="Je klient iz EU")
     */
    protected $jeeu = true;

    /**
     * Oznaka ali je naslov privzet
     *  (npr. za poslovnega partnerja, ki lahko ima več naslovov)
     *
     * @ORM\Column(type="boolean", nullable=true)
     * @var boolean
     *
     * @Max\Ui(type="boolcheckbox")
     * @Max\I18n(label="Privzeti naslov", description="A je to privzeti naslov za poslovnega partnerja")
     */
    protected $privzeti = false;

    public function validate($mode = 'update')
    {
        $this->expect($this->oseba || $this->popa, "Naslov nima lastnika. Oseba ali poslovni partner sta obvezna", 1000304);
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

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setPopa(\Max\Entity\Popa $popa)
    {
        $this->popa = $popa;
        return $this;
    }

    public function setOseba(\Max\Entity\Oseba $oseba)
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

    public function setDrzava($drzava)
    {
        $this->drzava = $drzava;
        return $this;
    }




}
