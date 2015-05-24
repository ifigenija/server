<?php

/*
 * Entiteta za številčenje dokumentov
 */

namespace Stevilcenje\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;    
use Stevilcenje\Repository\Stevilcenja;

/**
 * @ORM\Entity(repositoryClass="Stevilcenje\Repository\Stevilcenja")
 * @Max\I18n(label="Številčenje",plural="Šifrant številčenja")
 * @Max\Lookup
 * @Max\Id(prefix="000a")
 * @author boris
 */
class Stevilcenje
        extends \Max\Entity\Base
{

    /**
     * Ident
     * @ORM\Column(type="guid")
     * @ORM\Id
     */
    protected $id;

    /**
     * Šifra številčenja
     * @ORM\Column(length=8, unique=true)
     * @Max\Ui(type="sifra",ident=true, group="Številčenje")
     * @Max\I18n(label="Šifra", description="Oznaka za številčenje")
     *
     * @var string
     */
    protected $sifra;

    /**
     * Naziv številčenja
     * @ORM\Column(length=100)
     * @Max\Ui(type="naziv", group="Številčenje")
     * @Max\I18n(label="Naziv številčenja", description="Naziv številčenja")
     *
     * @var string
     */
    protected $naziv;

    /**
     * Prefix
     * @ORM\Column(length=5,nullable=true)
     * @Max\Ui(type="naziv", group="Številčenje")
     * @Max\I18n(label="Predpona številke", description="Predpona se prilepi na začetek številke dokumenta ")
     *
     * @var string
     */
    protected $prefix;

    /**
     * @ORM\Column(length=5, nullable=true)
     * @Max\Ui(type="naziv", group="Številčenje")
     * @Max\I18n(label="Pripona številke", description="Pridpona se prilepi na konec številke dokumenta ")
     *
     * @var string
     */
    protected $suffix;

    /**
     * Začetna številka številčenja dokumenta
     * @ORM\Column(type="integer")
     * @Max\I18n(label="Začetek",description="Začetna številka, od katere se šteje v novem letu")
     * @Max\Ui(type="integer")
     *
     * @var integer
     */
    protected $zacetek;

    /**
     * Željena dolžina številke
     * @ORM\Column(type="integer")
     * @Max\Ui(type="integer")
     * @Max\I18n(label="Dolžina",description="Dolžina številskega dela generirane številke dokumenta")
     *
     * @var integer
     */
    protected $dolzina;

    /**
     * Format generiranja številke
     * %p%l-%n%s.....
     * @ORM\Column(length=20)
     * @Max\I18n(label="Format", description="Oblika številčenja - uporabljajo se zamenjave %p %l %n %s")
     * @var string
     */
    protected $format;

    /**
     * Globalno številčenje - se ne ozira na tip dokumenta ko se generira nova številka
     *
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Številči globalno", description="Številčenje se nadaljuje ne glede na tip dokumenta, ki ga številčimo")
     * @var boolean
     */
    protected $globalno;

    /**
     * Globalno številčenje - se ne ozira na tip dokumenta ko se generira nova številka
     *
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Številči po letih", description="Številčenje se začne znova vsako poslovno leto")
     * @var boolean
     */
    protected $poLetih;


    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
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

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function getPrefix()
    {
        return $this->prefix;
    }

    public function setPrefix($prefix)
    {
        $this->prefix = $prefix;
        return $this;
    }

    public function getSuffix()
    {
        return $this->suffix;
    }

    public function setSuffix($suffix)
    {
        $this->suffix = $suffix;
        return $this;
    }

    public function getZacetek()
    {
        return $this->zacetek;
    }

    public function setZacetek($zacetek)
    {
        $this->zacetek = $zacetek;
        return $this;
    }

    public function getDolzina()
    {
        return $this->dolzina;
    }

    public function setDolzina($dolzina)
    {
        $this->dolzina = $dolzina;
        return $this;
    }

    public function getFormat()
    {
        return $this->format;
    }

    public function setFormat($format)
    {
        $this->format = $format;
        return $this;
    }


    public function getGlobalno()
    {
        return $this->globalno;
    }

    public function setGlobalno($globalno)
    {
        $this->globalno = $globalno;
        return $this;
    }

    public function getPoLetih()
    {
        return $this->poLetih;
    }

    public function setPoLetih($poLetih)
    {
        $this->poLetih = $poLetih;
        return $this;
    }



}
