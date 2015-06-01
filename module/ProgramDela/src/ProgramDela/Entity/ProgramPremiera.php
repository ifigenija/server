<?php
namespace ProgramDela\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class ProgramPremiera extends \ProgramDela\Entity\EnotaPrograma
{
    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="premiere")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     */
    private $dokument;
}