<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass="Koledar\Repository\Sezone")
 * @Max\I18n(label="Sezona",plural="Sezone")
 * @Max\Id(prefix="0031")
 */
class Sezona
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID sezone")
     * @Max\Ui(type="id")
     * @var string     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="entiteta.ime", description="entiteta.ime")
     * @Max\Ui(type="naziv",ident=true )
     * @var string     
     */
    private $imeSezone;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="entiteta.zacetek", description="entiteta.zacetek")
     * @var string
     */
    private $zacetek;

    /**
     * @ORM\Column(type="date", nullable=true)
     * @Max\I18n(label="entiteta.konec", description="entiteta.zacetek")
     * @var string
     */
    private $konec;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="entiteta.aktivna", description="sezona.d.aktivna")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $aktivna;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Dogodek", mappedBy="sezona")
     * @var <Dogodki>
     */
    private $dogodki;

    public function __construct()
    {
        $this->dogodki = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getImeSezone()
    {
        return $this->imeSezone;
    }

    public function getZacetek()
    {
        return $this->zacetek;
    }

    public function getKonec()
    {
        return $this->konec;
    }

    public function getAktivna()
    {
        return $this->aktivna;
    }

    public function getDogodki()
    {
        return $this->dogodki;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setImeSezone($imeSezone)
    {
        $this->imeSezone = $imeSezone;
        return $this;
    }

    public function setZacetek($zacetek)
    {
        $this->zacetek = $zacetek;
        return $this;
    }

    public function setKonec($konec)
    {
        $this->konec = $konec;
        return $this;
    }

    public function setAktivna($aktivna)
    {
        $this->aktivna = $aktivna;
        return $this;
    }

    public function setDogodki($dogodki)
    {
        $this->dogodki = $dogodki;
        return $this;
    }

}
