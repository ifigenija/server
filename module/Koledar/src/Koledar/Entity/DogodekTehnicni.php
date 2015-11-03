<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta tehničnega dogodka
 * Dogodek, ki je namenjen planiranju tehhničnega osebja,
 * če ni drugih dogodkov, kamor bi lahko "pripeli" termine storitve
 * tehničnega osebja
 *
 * @ORM\Entity(repositoryClass="Koledar\Repository\DogodkiTehnicni")
 * @Max\I18n(label="Tehnični dogodek",plural="Tehnični dogodki")
 * @Max\Id(prefix="0068")
 *  */
class DogodekTehnicni
        extends \Max\Entity\Base
{

    use DogodekTrait;

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID dogodka za izven")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="tehnicni", cascade={"persist"})
     * @Max\I18n(label = "dogodekTehnicni.dogodek", description = "dogodekTehnicni.d.dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    protected $dogodek;

    public function validate($mode = 'update')
    {
        
    }

    function dodajDogodek()
    {
        $this->dogodek = new Dogodek();
        $this->dogodek->setTehnicni($this);
        $this->dogodek->setRazred(Dogodek::TEHNICNI);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getDogodek()
    {
        return $this->dogodek;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setDogodek(\Koledar\Entity\Dogodek $dogodek = null)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

}
