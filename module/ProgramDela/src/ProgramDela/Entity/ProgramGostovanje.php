<?php
namespace ProgramDela\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class ProgramGostovanje
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2)
     */
    private $transportniStroski;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     */
    private $odkup;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="gostovanje")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     */
    private $dokument;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa")
     * @ORM\JoinColumn(name="gostitelj_id", referencedColumnName="id")
     */
    private $gostitelj;
}