<?php
namespace ProgramDela\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class ProgramPonovitev extends \ProgramDela\Entity\EnotaPrograma
{
    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="ponovitve")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     */
    private $dokument;
}