<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta za države
 * @ORM\Entity(repositoryClass="App\Repository\Drzave")
 * @ORM\Table(name="drza")
 * @Max\I18n(label="Država",plural="Države",description="Evidenca držav")
 * @Max\Id(prefix="0004")
 * @Max\Lookup
 */
class Drzava
               extends \Max\Entity\Base

{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\Ui(type="id")
     * @Max\I18n(label="ID države",  description="ID države")
     * @var string
     */
    protected $id;

    /**
     * Šifra države
     * @ORM\Column(unique=true, length=2, nullable=true)
     * @Max\I18n(label="drzava.sifra",description="drzava.d.sifra")
     * @Max\Ui(type="sifra",class="sifra",icon="fa fa-flag",ident=true)
     * @var string
     */
    protected $sifra;

    /**
     * Trimestna iso koda drzave
     * @ORM\Column(unique=true, length=3, nullable=true)
     * @Max\I18n(label="drzava.sifraDolg",description="drzava.d.sifraDolg")
     * @Max\Ui(type="sifra",class="sifra",icon="fa fa-flag", required=true)
     * @var string
     */
    protected $sifraDolg;

    /**
     * Številčna iso koda drzave
     * @ORM\Column(unique=true, length=3, nullable=true)
     * @var string
     * @Max\I18n(label="drzava.isoNum",description="drzava.d.isoNum")
     * @Max\Ui(class="sifra",icon="fa fa-flag", required=true)
     * @var string
     *  */
    protected $isoNum;

    /**
     * Iso Naziv države
     * @ORM\Column(unique=true, length=50, nullable=true)
     * @Max\I18n(label="drzava.isoNaziv",description="drzava.d.isoNaziv")
     * @var string
     */
    protected $isoNaziv;

    /**
     * Naziv države
     * @ORM\Column(length=50, nullable=true)
     * @Max\I18n(label="drzava.naziv",description="drzava.d.naziv")
     * @Max\Ui(class="naziv", required=true)
     * @var string
     */
    protected $naziv;

    /**
     * Naziv države
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="drzava.opomba",description="drzava.d.opomba")
     * @var string
     */
    protected $opomba;

     public function validate($mode = 'update')
    {
    }
    
    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getSifraDolg()
    {
        return $this->sifraDolg;
    }

    public function getIsoNum()
    {
        return $this->isoNum;
    }

    public function getIsoNaziv()
    {
        return $this->isoNaziv;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getOpomba()
    {
        return $this->opomba;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

    public function setSifraDolg($sifraDolg)
    {
        $this->sifraDolg = $sifraDolg;
        return $this;
    }

    public function setIsoNum($isoNum)
    {
        $this->isoNum = $isoNum;
        return $this;
    }

    public function setIsoNaziv($isoNaziv)
    {
        $this->isoNaziv = $isoNaziv;
        return $this;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setOpomba($opomba)
    {
        $this->opomba = $opomba;
        return $this;
    }

}
