<?php

namespace Prisotnost\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="Prisotnost\Repository\TipiDodatka")
 * @Max\I18n(label="Tip dodatka",plural="Tipi dodatkov")
 * @Max\Id(prefix="0070")
 * @Max\Lookup(ident="ime",label="sifra",extra={"opis"},search={ "sifra","ime","opis"})
 */
class TipDodatka
        extends Base
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
     * @Max\I18n(label="tipdodatka.sifra", description="tipdodatka.d.sifra")
     * @Max\Ui(type="sifra",ident=true, required=true, icon="fa fa-barcode")
     * @var string
     */
    protected $sifra;

    /**
     * Ime tipa dodatka, npr. višina 20%, izmensko delo 
     * 
     * @ORM\Column(unique=true)
     * @Max\I18n(label="tipdodatka.ime", description="tipdodatka.d.ime")
     * @Max\Ui(type="naziv")
     * @var string
     */
    protected $ime;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="tipdodatka.opis", description="tipdodatka.d.opis")
     * @var string
     */
    protected $opis;

    /**
     * @ORM\OneToMany(targetEntity="Prisotnost\Entity\Dodatek", mappedBy="tipdodatka", fetch="EXTRA_LAZY")
     * @var <Dodatki>
     */
    protected $dodatki;

    public function __construct()
    {
        $this->dodatki = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->ime, "Ime je obvezen podatek", 1001740);
    }

    function getId()
    {
        return $this->id;
    }

    function getSifra()
    {
        return $this->sifra;
    }

    function getIme()
    {
        return $this->ime;
    }

    function getOpis()
    {
        return $this->opis;
    }

    function getDodatki()
    {
        return $this->dodatki;
    }

    function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

    function setIme($ime)
    {
        $this->ime = $ime;
        return $this;
    }

    function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

    function setDodatki($dodatki)
    {
        $this->dodatki = $dodatki;
        return $this;
    }

}
