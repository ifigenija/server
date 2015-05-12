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
 */
class ZvrstUprizoritve
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID zvrsti uprizoritve")
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
     * @Max\I18n(label="Opis", description="Opis zvrsti uprizoritve")
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

    public function getIme()
    {
        return $this->ime;
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

    public function setIme($ime)
    {
        $this->ime = $ime;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

}
