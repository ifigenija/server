<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta za države
 * @ORM\Entity(repositoryClass="App\Repository\Drzave")
 * @ORM\Table(name="drza")
 * @Max\Lookup
 * @Max\I18n(label="Država",plural="Države",description="Evidenca držav")
 *
 */
class Drzava
               extends \Max\Entity\Base

{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\Ui(type="id")
     * @Max\I18n(label="ID države", hint="ID države", description="ID države")
     * @var string
     */
    protected $id;

    /**
     * Šifra države
     * @ORM\Column(unique=true, length=2, nullable=true)
     * @var string
     * @Max\I18n(label="Koda države",hint="ISO koda države")
     * @Max\Ui(type="sifra",class="sifra",icon="fa fa-flag",ident=true)
     */
    protected $sifra;

    /**
     * Trimestna iso koda drzave
     * @ORM\Column(unique=true, length=3, nullable=true)
     * @var string
     * @Max\I18n(label="Trimestna koda",hint="Trimestna ISO koda države")
     * @Max\Ui(type="sifra",class="sifra",icon="fa fa-flag", required=true)
     */
    protected $sifraDolg;

    /**
     * Številčna iso koda drzave
     * @ORM\Column(unique=true, length=3, nullable=true)
     * @var string
     * @Max\I18n(label="Številčna koda",hint="Trimestna ISO številčna koda države")
     * @Max\Ui(class="sifra",icon="fa fa-flag", required=true)
     */
    protected $isoNum;

    /**
     * Iso Naziv države
     * @ORM\Column(unique=true, length=50, nullable=true)
     * @Max\I18n(label="Iso Naziv",hint="ISO Naziv države")
     * @var string
     */
    protected $isoNaziv;

    /**
     * Naziv države
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="Naziv",hint="Naziv države")
     * @var string
     */
    protected $naziv;

    /**
     * Naziv države
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Opomba",hint="Opis")
     * @var string
     */
    protected $opomba;

    /**
     * 
     * @Max\Exclude
     * @var string
     */
    protected $upor;

    /**
     * 
     * @Max\Exclude
     * @var string
     */
    protected $datKnj;

    public function getSifra()
    {
        return $this->sifra;
    }

    public function setSifra($sifra)
    {
        $this->sifra = $sifra;
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

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
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

    public function getSifraDolg()
    {
        return $this->sifraDolg;
    }

    public function setSifraDolg($sifraDolg)
    {
        $this->sifraDolg = $sifraDolg;
    }

    public function getIsoNum()
    {
        return $this->isoNum;
    }

    public function setIsoNum($isoNum)
    {
        $this->isoNum = $isoNum;
    }

    public function getIsoNaziv()
    {
        return $this->isoNaziv;
    }

    public function setIsoNaziv($isoNaziv)
    {
        $this->isoNaziv = $isoNaziv;
    }

    public function getOpomba()
    {
        return $this->opomba;
    }

    public function setOpomba($opomba)
    {
        $this->opomba = $opomba;
    }

}
