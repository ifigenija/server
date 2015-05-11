<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity
 * @Max\I18n(label="Rekviziterstvo",plural="Rekviziterstva")
 * @Max\Id(prefix="0019")
 */
class Rekviziterstvo
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID rekviziterstva")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Namen uporabe", description="Namen uporabe rekvizita")
     * @Max\Ui(type="boolcheckbox",group="Davčni podatki")
     * @var boolean    
     */
    private $namenUporabe;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Opis postavitve", description="Opis postavitve rekvizita")
     * @var string
     */
    private $opisPostavitve;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Rekvizit", inversedBy="rekviziterstvo")
     * @ORM\JoinColumn(name="rekvizit_id", referencedColumnName="id")
     * @Max\I18n(label="Rekvizit",  description="Rekvizit za uprizoritev")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Rekvizit
     */
    private $rekvizit;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="rekviziti")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     * @Max\I18n(label="Uprizoritev",  description="Za katero uprizoritev je rekvizit")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Uprizoritev
     */
    private $uprizoritev;

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

    public function setRekvizit(\Produkcija\Entity\Rekvizit $rekvizit)
    {
        $this->rekvizit = $rekvizit;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

}
