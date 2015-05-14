<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta za naslove
 *
 * @ORM\Entity(repositoryClass="Koledar\Repository\DogodkiIzven")
 * @Max\I18n(label="Dogodek za izven",plural="Dogodki za izven")
 * @Max\Id(prefix="0030")
 *  */
class DogodekIzven
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID dogodka za izven")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="dogodekIzven")
     * @Max\I18n(label="Dogodek", description="Dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    private $dogodek;

    public function validate($mode = 'update')
    {
        
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

    public function setDogodek(\Koledar\Entity\Dogodek $dogodek)
    {
        $this->dogodek = $dogodek;
        return $this;
    }


}
