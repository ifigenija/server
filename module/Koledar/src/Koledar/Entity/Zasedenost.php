<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta za naslove
 *
 * @ORM\Entity(repositoryClass="Koledar\Repository\Zasedenosti")
 * @Max\I18n(label="Zasedenost",plural="Zasedenosti")
 * @Max\Id(prefix="0033")
 */
class Zasedenost
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID zasedenosti")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;
    
    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="zasedenost")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="zasedenost.oseba",  description="zasedenost.d.oseba")
     * @Max\Ui(type="toone", required=true)
     * @var \App\Entity\Oseba
     */
    protected $oseba;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="zasedenost")
     * @Max\I18n(label="Dogodek",  description="Dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    protected $dogodek;

    public function validate($mode = 'update')
    {
        $this->expect($this->oseba, "Oseba je obvezna", 1000900);
    }
    function getOseba()
    {
        return $this->oseba;
    }

    function setOseba(\App\Entity\Oseba $oseba = null)
    {
        $this->oseba = $oseba;
        return $this;
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
