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
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Ime", description="Ime zvrsti SURS")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $ime;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Naziv", description="Naziv zvrsti SURS")
     * @Max\Ui(type="naziv" )
     * @var string
     */
    private $naziv;

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getIme()
    {
        return $this->ime;
    }

    public function getNaziv()
    {
        return $this->naziv;
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

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

}
