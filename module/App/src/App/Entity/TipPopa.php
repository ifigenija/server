<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;

/**
 * 
 * Tip poslovnega partnerja glede na potrebe posameznega gledališča
 * 
 * @ORM\Entity(repositoryClass="App\Repository\TipiPopa")
 * @Max\I18n(label="Tip poslovnega partnerja",plural="Tipi poslovnega partnerja")
 * @Max\Id(prefix="0064")
 * @Max\Lookup(ident="ime",label="sort",extra={"opis"},search={ "ime","opis"})
 */
class TipPopa
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
     * @Max\I18n(label="tipPopa.sifra", description="tipPopa.d.sifra")
     * @Max\Ui(type="sifra",ident=true, required=true, icon="fa fa-barcode")
     * @var string
     */
    protected $sifra;

    /**
     * Ime tipa klienta, npr. šola, gledalci,sponzorji
     * 
     * @ORM\Column( unique=true)
     * @Max\I18n(label="tipPopa.ime", description="tipPopa.d.ime")
     * @Max\Ui(type="naziv")
     * @var string
     */
    protected $ime;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="tipPopa.opis", description="tipPopa.d.opis")
     * @var string
     */
    protected $opis;

    /**
     * v kakšnem vrstnem redu naj se prikaže v izbirnem polju
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="tipPopa.sort", description="tipPopa.d.sort")
     * @Max\Ui(type="integer", icon="fa fa-sort")
     * @var integer
     */
    protected $sort;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Popa", mappedBy="tipkli", fetch="EXTRA_LAZY")
     * @var <Popa>
     */
    protected $popa;

    public function validate($mode = 'update')
    {
        $this->expect($this->ime, "Ime obvezen podatek", 1001070);
    }

    public function __construct()
    {
        $this->popa = new \Doctrine\Common\Collections\ArrayCollection();
    }

    function getId()
    {
        return $this->id;
    }

    function getIme()
    {
        return $this->ime;
    }

    function getOpis()
    {
        return $this->opis;
    }

    function getSort()
    {
        return $this->sort;
    }

    function getPopa()
    {
        return $this->popa;
    }

    function setId($id)
    {
        $this->id = $id;
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

    function setSort($sort)
    {
        $this->sort = $sort;
        return $this;
    }

    function setPopa($popa)
    {
        $this->popa = $popa;
        return $this;
    }

    function getSifra()
    {
        return $this->sifra;
    }

    function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

}
