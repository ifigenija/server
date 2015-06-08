<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiGostovanje")
 * @Max\I18n(label="Program gostovanje",plural="Programi gostovanje")
 * @Max\Id(prefix="0045")
 */
class ProgramGostovanje
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID programa gostovanja")
     * @Max\Ui(type="id")
     * @var string    
     */
    private $id;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2)
     * @Max\I18n(label="programGostovanje.transportniStroski", description="Transportni stroški")   
     * @var double     
     */
    private $transportniStroski;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="programGostovanje.odkup", description="Odkup")   
     * @var double     
     */
    private $odkup;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="gostovanje")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programGostovanje.programDela", description="Program dela")
     * @Max\Ui(type="toone")
     * @var \ProgramDela\Entity\ProgramDela
     */
    private $dokument;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa")
     * @ORM\JoinColumn(name="gostitelj_id", referencedColumnName="id")
     * @Max\I18n(label="programGostovanje.gostitelj", description="Gostitelj")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    private $gostitelj;

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getTransportniStroski()
    {
        return $this->transportniStroski;
    }

    public function getOdkup()
    {
        return $this->odkup;
    }

    public function getDokument()
    {
        return $this->dokument;
    }

    public function getGostitelj()
    {
        return $this->gostitelj;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setTransportniStroski($transportniStroski)
    {
        $this->transportniStroski = $transportniStroski;
        return $this;
    }

    public function setOdkup($odkup)
    {
        $this->odkup = $odkup;
        return $this;
    }

    public function setDokument(\ProgramDela\Entity\ProgramDela $dokument)
    {
        $this->dokument = $dokument;
        return $this;
    }

    public function setGostitelj(\App\Entity\Popa $gostitelj)
    {
        $this->gostitelj = $gostitelj;
        return $this;
    }

}
