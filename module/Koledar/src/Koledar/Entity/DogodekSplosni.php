<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta za naslove
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
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="splosni")
     * @Max\I18n(label="Dogodek", description="Dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    protected $dogodek;

    public function validate($mode = 'update')
    {
        
    }

    function dodajDogodek()
    {
        $dogodek = new Dogodek();
        $dogodek->setRazred(Dogodek::SPLOSNO);
        $dogodek->setSplosni($this);

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

    public function setDogodek(\Koledar\Entity\Dogodek $dogodek=null)
    {
        $this->dogodek = $dogodek;
        return $this;
    }


}
