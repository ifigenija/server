<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * Zvrst po klasifikaciji Statističnega urada Slovenije
 * 
 * @ORM\Entity(repositoryClass="Produkcija\Repository\ZvrstiSurs")
 * @Max\I18n(label="Zvrst",plural="Zvrst SURS")
 * @Max\Id(prefix="0020")
 * @Max\Lookup(ident="sifra", label="naziv", search={"sifra","naziv","opis"})
 */
class ZvrstSurs
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID zvrsti SURS")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * @ORM\Column(type="string", unique=true, nullable=false)
     * @Max\I18n(label="zvrstSurs.sifra", description="Šifra zvrsti po SURS-u")
     * @Max\Ui(type="sifra",ident=true )
     * @var string
     */
    private $sifra;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="zvrstSurs.naziv", description="Naziv zvrsti po SURS-u")
     * @Max\Ui(type="naziv" )
     * @var string
     */
    private $naziv;

    /**
     * ...
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="zvrstSurs.opis", description="Opis zvrsti")
     * @var string
     */
    protected $opis;

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

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getOpis()
    {
        return $this->opis;
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

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

}
