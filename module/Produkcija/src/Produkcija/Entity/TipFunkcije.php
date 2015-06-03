<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * 
 * Tip funkcije / vloge, ki je standariziran v skladu s SLOGI (Slovenski gledališki inštitut)
 * 
 * @ORM\Entity(repositoryClass="Produkcija\Repository\TipiFunkcije")
 * @Max\I18n(label="Tip funkcije",plural="Tipi funkcije")
 * @Max\Id(prefix="0015")
 * @Max\Lookup(ident="",label="ime", extra={"opis","podrocje","nastopajoc"},search={"ime","opis","podrocje"})
 * @todo $$ rb preveri fixturje oz. TestZaFixture, ali sploh rabimo maksimalno število prekrivanj, razvrščenost v področje ipd.
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
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="entiteta.ime", description="Ime tipa funkcije")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $ime;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="entiteta.opis", description="Opis tipa funkcije")
     * @var string
     */
    private $opis;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="tipFunkcije.nastopajoc", description="Nastopajoč")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $nastopajoc;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="tipFunkcije.zenskoIme", description="Žensko ime funkcije")
     * @var string
     */
    private $imeZenski;

    /**
     * $$ isto kot pri Funkcija
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="entiteta.podrocje", description="Področje")
     * @Max\Ui(type="select", opts="tipfunkcije.podrocje")
     * @var string
     */
    private $podrocje;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Funkcija", mappedBy="tipFunkcije", fetch="EXTRA_LAZY")
     * @var <Funkcije>
     */
    private $funkcije;

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

    public function getNastopajoc()
    {
        return $this->nastopajoc;
    }

    public function setNastopajoc($nastopajoc)
    {
        $this->nastopajoc = $nastopajoc;
        return $this;
    }

}
