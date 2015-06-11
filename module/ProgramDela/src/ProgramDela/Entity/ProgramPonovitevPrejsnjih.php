<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiPonovitevPrejsnjih")
 * @Max\Id(prefix="0048")
 */
class ProgramPonovitevPrejsnjih
        extends \ProgramDela\Entity\EnotaPrograma
{

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="ponovitvePrejsnjih")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programPonovitevPrejsnjih.dokument",  description="Dokument")
     * @Max\Ui(type="hidden")
     * @var \ProgramDela\Entity\ProgramDela
     */
    private $dokument;

    public function validate($mode = 'update')
    {
        parent::validate();
    }

    public function getDokument()
    {
        return $this->dokument;
    }

    public function setDokument(\ProgramDela\Entity\ProgramDela $dokument)
    {
        $this->dokument = $dokument;
        return $this;
    }


}