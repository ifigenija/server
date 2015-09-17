<?php

namespace Produkcija\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Rekviziti")
 * @Max\I18n(label="Rekvizit",plural="Rekviziti")
 * @Max\Id(prefix="0018")
 */
class Rekvizit
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID rekvizita")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Ime", description="Ime rekvizita")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    protected $ime;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Vrsta", description="Vrsta rekvizita")
     * @var string
     */
    protected $vrsta;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    protected $status;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Rekviziterstvo", mappedBy="rekvizit")
     * @var <Rekviziterstva>
     */
    protected $rekviziterstva;

    public function __construct()
    {
        $this->rekviziterstva = new ArrayCollection();
    }

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

    public function getVrsta()
    {
        return $this->vrsta;
    }

    public function getRekviziterstva()
    {
        return $this->rekviziterstva;
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

    public function setVrsta($vrsta)
    {
        $this->vrsta = $vrsta;
        return $this;
    }

    public function setRekviziterstva($rekviziterstva)
    {
        $this->rekviziterstva = $rekviziterstva;
        return $this;
    }

}
