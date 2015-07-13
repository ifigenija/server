<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\DrugiViri")
 * @Max\I18n(label="Drugi vir",plural="Drugi viri")
 * @Max\Id(prefix="0051")
 */
class DrugiVir
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID drugega vira")
     * @Max\Ui(type="id")
     * @var string   
     */
    protected $id;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     * @Max\I18n(label="drugiVir.znesek", description="drugiVir.d.znesek")   
     * @var double
     */
    protected $znesek;

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="drugiVir.opis", description="drugiVir.d.opis")   
     * @var double
     */
    protected $opis;

    /**
     * @ORM\Column(type="boolean", length=1, nullable=true)
     * @Max\I18n(label="drugiVir.mednarodni", description="drugiVir.d.mednarodni")   
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $mednarodni;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\EnotaPrograma", inversedBy="drugiViri")
     * @Max\I18n(label="drugiVir.enotaPrograma", description="drugiVir.d.enotaPrograma")   
     * @Max\Ui(type="hiddenid")
     * @var \ProgramDela\Entity\EnotaPrograma
     */
    protected $enotaPrograma;

    public function preracunaj($smer = false)
    {
        if ($smer == \Max\Consts::UP) {
            if ($this->getEnotaPrograma()) {
                $this->getEnotaPrograma()->preracunaj(\Max\Consts::UP);
            }
        }
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->getEnotaPrograma(), 'Ni enote programa za ta vir', 1000481);
        $this->expect($this->znesek > 0, "Znesek mora biti pozitivno število", 1000480);
    }

    public function getId()
    {
        return $this->id;
    }

    public function getZnesek()
    {
        return $this->znesek;
    }

    public function getOpis()
    {
        return $this->opis;
    }

    public function getEnotaPrograma()
    {
        return $this->enotaPrograma;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setZnesek($znesek)
    {
        $this->znesek = $znesek;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

    public function setEnotaPrograma(\ProgramDela\Entity\EnotaPrograma $enotaPrograma)
    {
        $this->enotaPrograma = $enotaPrograma;
        return $this;
    }

    public function getMednarodni()
    {
        return $this->mednarodni;
    }

    public function setMednarodni($mednarodni)
    {
        $this->mednarodni = $mednarodni;
        return $this;
    }

}
