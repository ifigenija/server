<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * 
 * Tip funkcije / vloge, ki je standariziran v skladu s SLOGI (Slovenski gledališki inštitut)
 * 
 * @ORM\Entity(repositoryClass="Produkcija\Repository\TipiFunkcije")
 * @Max\I18n(label="Tip funkcije",plural="Tipi funkcije")
 * @Max\Id(prefix="0015")
 * @Max\Lookup(ident="sifra",label="ime",extra={"opis","podrocje"},search={"sifra", "ime","opis","podrocje"})
 */
class TipFunkcije
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID tipa funkcije")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * @ORM\Column(unique=true)
     * @Max\I18n(label="tipFunkcije.sifra", description="tipFunkcije.d.sifra")
     * @Max\Ui(type="sifra",ident=true, required=true)
     * @var string
     */
    protected $sifra;

    /**
     * @ORM\Column( unique=true)
     * @Max\I18n(label="tipFunkcije.ime", description="tipFunkcije.d.ime")
     * @Max\Ui(type="naziv")
     * @var string
     */
    protected $ime;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="tipFunkcije.opis", description="tipFunkcije.d.opis")
     * @var string
     */
    protected $opis;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="tipFunkcije.zenskoIme", description="tipFunkcije.d.zenskoIme")
     * @Max\Ui(required=true)
     * @var string
     */
    protected $imeZenski;

    /**
     * $$ isto kot pri Funkcija
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="tipFunkcije.podrocje", description="tipFunkcije.d.podrocje")
     * @Max\Ui(type="select", opts="tipfunkcije.podrocje")
     * @var string
     */
    protected $podrocje;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Funkcija", mappedBy="tipFunkcije", fetch="EXTRA_LAZY")
     * @var <Funkcije>
     */
    protected $funkcije;

    public function validate($mode = 'update')
    {
        
    }

    public function __construct()
    {
        $this->funkcije = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function getId()
    {
        return $this->id;
    }

    public function getIme()
    {
        return $this->ime;
    }

    public function getOpis()
    {
        return $this->opis;
    }

    public function getImeZenski()
    {
        return $this->imeZenski;
    }

    public function getPodrocje()
    {
        return $this->podrocje;
    }

    public function getFunkcije()
    {
        return $this->funkcije;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setIme($ime)
    {
        $this->ime = $ime;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

    public function setImeZenski($imeZenski)
    {
        $this->imeZenski = $imeZenski;
        return $this;
    }

    public function setPodrocje($podrocje)
    {
        $this->podrocje = $podrocje;
        return $this;
    }

    public function setFunkcije($funkcije)
    {
        $this->funkcije = $funkcije;
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


}
