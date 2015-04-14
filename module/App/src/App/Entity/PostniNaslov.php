<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta za naslove
 *
 * @ORM\Entity(repositoryClass="App\Repository\PostniNaslovi")
 * @Max\I18n(label="Poštni naslov",plural="Poštni naslovi")
 * @ORM\Table(name="PostniNaslovi")
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
     * @var integer
     *
     * @Max\I18n(label="Id", hint="ID naslova", description="ID poštnega naslova")
     */
    protected $id;

    /**
     * Klient
     * 
     * @var \Max\Entity\Popa
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="naslovi")
     * @ORM\JoinColumn(name="klient_id", referencedColumnName="id")
     */
    protected $klient;

    /**
     * Naziv
     *
     * @ORM\Column(length=50, nullable=true)
     * @var string
     *
     * @Max\I18n(label="Naziv", hint="Text", description="Naziv naslova")
     * @Max\Ui(ident=true)
     */
    protected $naziv;

    /**
     * Dodatno polje za naziv (naziv2)
     *
     * @ORM\Column(length=50, nullable=true)
     * @var string
     *
     * @Max\I18n(label="Naziv", hint="Text", description="Dodatni naziv naslova")
     */
    protected $nazivDva;

    /**
     * Ulica naslovnika
     *
     * @ORM\Column(length=50, nullable=true)
     * @var string
     *
     * @Max\I18n(label="Ulica", hint="Text", description="Ulica naslova")
     */
    protected $ulica;

    /**
     * Dodatno polje za ulico (ulica2)
     *
     * @ORM\Column(length=50, nullable=true)
     * @var string
     *
     * @Max\I18n(label="Ulica", hint="Text", description="Dodatni podatki o ulici")
     */
    protected $ulicaDva;

    /**
     * Pošta
     *  poštna številka
     *
     * @ORM\Column(length=50, nullable=true)
     *
     * @Max\I18n(label="Pošta", hint="Poštna številka", description="Poštna številka")
     * @Max\Ui(group="posta")
     */
    protected $posta;

    /**
     * Pošta
     *  naziv pošte
     *
     * @ORM\Column(length=50, nullable=true)
     *
     * @Max\I18n(label="Naziv", hint="Naziv pošte", description="Naziv pošte")
     * @Max\Ui(group="posta")
     */
    protected $postaNaziv;

    /**
     * Pokrajina
     *
     * @ORM\Column(length=50, nullable=true)
     * @var string
     *
     * @Max\I18n(label="Pokrajina", hint="Pokrajina", description="Pokrajina")
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
     * @Max\I18n(label="Država", plural="Države", hint="ID Države", description="Država")
     */
    protected $drzava;

    /**
     * Je klient iz EU
     *  checkbox - Da, Ne
     *
     * @ORM\Column(length=1, nullable=true)
     * @var string
     *
     * @Max\Ui(type="checkbox",group="Davčni podatki")
     * @Max\I18n(label="Iz EU", description="Je klient iz EU")
     */
    protected $jeeu;

    /**
     * Oznaka ali je naslov privzet
     *  (npr. za poslovnega partnerja, ki lahko ima več naslovov)
     *
     * @ORM\Column(type="boolean", nullable=true)
     * @var boolean
     *
     * @Max\Ui(type="checkbox")
     * @Max\I18n(label="Iz EU", description="Je klient iz EU")
     */
    protected $privzeti;

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

    public function getFullPostaNaziv()
    {
        return "{$this->getPostaNaziv()} {$this->getPosta()}";
    }

    public function getId()
    {
        return $this->id;
    }

    public function getKlient()
    {
        return $this->klient;
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

    public function getUpor()
    {
        return $this->upor;
    }

    public function getDatKnj()
    {
        return $this->datKnj;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setKlient(\App\Entity\Popa $klient = null)
    {
        $this->klient = $klient;
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

    public function setUpor($upor)
    {
        $this->upor = $upor;
        return $this;
    }

    public function setDatKnj($datKnj)
    {
        $this->datKnj = $datKnj;
        return $this;
    }

}
