<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiFestival")
 * @Max\I18n(label="Program festival",plural="Programi festival")
 * @Max\Id(prefix="0044")
 */
class ProgramFestival
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID programa festivala")
     * @Max\Ui(type="id")
     * @var string    
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="programiFestival")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programFestival.programDela", description="Program dela")
     * @Max\Ui(type="toone")
     * @var \ProgramDela\Entity\ProgramDela
     */
    private $programDela;

    public function validate($mode = 'update')
    {
        
    }
    public function getId()
    {
        return $this->id;
    }

    public function getProgramDela()
    {
        return $this->programDela;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setProgramDela(\ProgramDela\Entity\ProgramDela $programDela)
    {
        $this->programDela = $programDela;
        return $this;
    }


}
