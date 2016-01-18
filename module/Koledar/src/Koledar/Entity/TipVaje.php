<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;

/**
 * 
 * Tip vaja
 * 
 * @ORM\Entity(repositoryClass="Koledar\Repository\TipiVaje")
 * @Max\I18n(label="Tip vaje",plural="Tipi vaje")
 * @Max\Id(prefix="0066")
 * @Max\Lookup(ident="ime",label="sifra",extra={"opis"},search={ "sifra","ime","opis"})
 */
class TipVaje
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
     * @Max\I18n(label="tipVaje.sifra", description="tipVaje.d.sifra")
     * @Max\Ui(type="sifra",ident=true, required=true, icon="fa fa-barcode")
     * @var string
     */
    protected $sifra;

    /**
     * Ime tipa vaje, npr. prva vaja, tehnična vaja, čučna vaja, 1. generalka
     * 
     * @ORM\Column( unique=true)
     * @Max\I18n(label="tipVaje.ime", description="tipVaje.d.ime")
     * @Max\Ui(type="naziv")
     * @var string
     */
    protected $ime;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="tipVaje.opis", description="tipVaje.d.opis")
     * @var string
     */
    protected $opis;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Vaja", mappedBy="tipvaje", fetch="EXTRA_LAZY")
     * @var <Vaje>
     */
    protected $vaje;

    public function validate($mode = 'update')
    {
        $this->expect($this->ime, "Ime je obvezen podatek", 1001150);
    }

    public function __construct()
    {
        $this->vaje = new \Doctrine\Common\Collections\ArrayCollection();
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

    function getVaje()
    {
        return $this->vaje;
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

    function setVaje($vaje)
    {
        $this->vaje = $vaje;
        return $this;
    }


}
