<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\Rekviziterstva")
 * @Max\I18n(label="Rekviziterstvo",plural="Rekviziterstva")
 * @Max\Id(prefix="0019")
 */
class Rekviziterstvo
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID rekviziterstva")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Namen uporabe", description="Namen uporabe rekvizita")
     * @Max\Ui(type="boolcheckbox",group="Davčni podatki")
     * @var boolean    
     */
    protected $namenUporabe;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Opis postavitve", description="Opis postavitve rekvizita")
     * @var string
     */
    protected $opisPostavitve;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Rekvizit", inversedBy="rekviziterstva")
     * @ORM\JoinColumn(name="rekvizit_id", referencedColumnName="id")
     * @Max\I18n(label="Rekvizit",  description="Rekvizit za uprizoritev")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Rekvizit
     */
    protected $rekvizit;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="rekviziterstva")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     * @Max\I18n(label="Uprizoritev",  description="Za katero uprizoritev je rekvizit")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Uprizoritev
     */
    protected $uprizoritev;

    public function validate($mode = 'update')
    {
        
    }
    public function getId()
    {
        return $this->id;
    }

    public function getNamenUporabe()
    {
        return $this->namenUporabe;
    }

    public function getOpisPostavitve()
    {
        return $this->opisPostavitve;
    }

    public function getRekvizit()
    {
        return $this->rekvizit;
    }

    public function getUprizoritev()
    {
        return $this->uprizoritev;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setNamenUporabe($namenUporabe)
    {
        $this->namenUporabe = $namenUporabe;
        return $this;
    }

    public function setOpisPostavitve($opisPostavitve)
    {
        $this->opisPostavitve = $opisPostavitve;
        return $this;
    }

    public function setRekvizit(\Produkcija\Entity\Rekvizit $rekvizit=null)
    {
        $this->rekvizit = $rekvizit;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev=null)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

}
