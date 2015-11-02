<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta splošne dogodke
 * Dogodek, ki ni ne vaja, ne predstava, ne gostovanje, zaseda pa prostor
 *
 * @ORM\Entity(repositoryClass="Koledar\Repository\DogodkiSplosni")
 * @Max\I18n(label="Dogodek za izven",plural="Dogodki za izven")
 * @Max\Id(prefix="0030")
 *  */
class DogodekSplosni
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
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="splosni", cascade={"persist"})
     * @Max\I18n(label = "dogodekSplosni.dogodek", description = "dogodekSplosni.d.dogodek")
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
        $this->dogodek->setSplosni($this);
        $this->dogodek->setRazred(Dogodek::SPLOSNO);
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
