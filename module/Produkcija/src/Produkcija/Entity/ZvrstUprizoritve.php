<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * Zvrst uprizoritve
 * 
 * @ORM\Entity(repositoryClass="Produkcija\Repository\ZvrstiUprizoritve")
 * @Max\I18n(label="Zvrst",plural="Zvrst uprizoritve")
 * @Max\Id(prefix="0021")
 * @Max\Lookup(ident="sifra", label="naziv", search={"sifra","naziv","opis"})
 */
class ZvrstUprizoritve
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID vrste uprizoritve")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * @ORM\Column(type="string", unique=true, nullable=false)
     * @Max\I18n(label="zvrstUprizoritve.sifra", description="Šifra vrste uprizoritve")
     * @Max\Ui(type="sifra",ident=true )
     * @var string
     */
    private $sifra;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="zvrstUprizoritve.naziv", description="Naziv vrste uprizoritve")
     * @Max\Ui(type="naziv" )
     * @var string
     */
    private $naziv;

    /**
     * ...
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="zvrstUprizoritve.opis", description="Opis vrste uprizoritve")
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
