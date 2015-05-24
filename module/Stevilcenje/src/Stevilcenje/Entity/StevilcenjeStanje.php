<?php

namespace Stevilcenje\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity
 * @Max\I18n(label="Številčenje",plural="Načini številčenja")
 * @Max\Id(prefix="000c")
 */
class StevilcenjeStanje
        extends \Max\Entity\Base
{

    /**
     * ID
     * @ORM\Id
     * @ORM\Column(type="guid", nullable=false)
     * @Max\I18n(label="ID koledarja")
     *
     * @var string
     */
    protected $id;

    /**
     * Id entite
     * @ORM\Column(type="guid", nullable=false)
     *
     * @var string
     */
    protected $objId;


    /**
     * @ORM\Column(type="integer", nullable=false)
     *
     * @var integer
     */
    protected $leto = 0;

    /**
     * @ORM\Column(type="integer")
     *
     * @var integer
     */
    protected $stevilka = 0;

  

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function getObjId()
    {
        return $this->objId;
    }

    public function setObjId($objId)
    {
        $this->objId = $objId;
        return $this;
    }

    public function getStevilcenje()
    {
        return $this->stevilcenje;
    }

    public function setStevilcenje(\Stevilcenje\Entity\Stevilcenje $stevilcenje)
    {
        $this->stevilcenje = $stevilcenje;
        return $this;
    }

    public function getLeto()
    {
        return $this->leto;
    }

    public function setLeto($leto)
    {
        $this->leto = $leto;
        return $this;
    }

    public function getStevilka()
    {
        return $this->stevilka;
    }

    public function setStevilka($stevilka)
    {
        $this->stevilka = $stevilka;
        return $this;
    }

  

}
