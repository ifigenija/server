<?php

namespace Prodaja\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 *
 * @ORM\Entity(repositoryClass="Prodaja\Repository\Prostori")
 * @Max\I18n(label="Prostor",plural="Prostori")
 * @Max\Id(prefix="0034")
 * @Max\Lookup(extra={"kapacitetea","jePrizorisce"})
 *  */
class Prostor
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID poštnega naslova")
     * @Max\Ui(type="id")
     * @var string     
     */
    private $id;
    
    
    /**
     * @ORM\Column(type="string", unique=true, nullable=false)
     * @Max\I18n(label="Šifra", description="Enolična Oznaka prostora")
     * @Max\Ui(type="sifra",ident=true )
     * @var string
     */
    private $sifra;

    /**
     * @ORM\Column(type="string", unique=true, nullable=false)
     * @Max\I18n(label="Ime", description="Ime prostora")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $naziv;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Prizorišče", description="Ali je prizorišče")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $jePrizorisce;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Prizorišče", description="Ali je prizorišče")
     * @var integer
     */
    private $kapaciteta;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Opis", description="Opis prostora")
     * @var string
     */
    private $opis;

    
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

    public function getJePrizorisce()
    {
        return $this->jePrizorisce;
    }

    public function getKapaciteta()
    {
        return $this->kapaciteta;
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

    public function setJePrizorisce($jePrizorisce)
    {
        $this->jePrizorisce = $jePrizorisce;
        return $this;
    }

    public function setKapaciteta($kapaciteta)
    {
        $this->kapaciteta = $kapaciteta;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }


}
