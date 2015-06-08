<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiDela")
 * @Max\I18n(label="Program dela",plural="")
 * @Max\Id(prefix="0041")
 */
class ProgramDela
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID termina storitve")
     * @Max\Ui(type="id")
     * @var string   
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=false)
     */
    private $sifra;

    /**
     * @ORM\Column(type="string", nullable=false)
     */
    private $naziv;

    /**
     * @ORM\Column(type="date", nullable=false)
     */
    private $zacetek;

    /**
     * @ORM\Column(type="date", nullable=false)
     */
    private $konec;

    /**
     * @ORM\Column(type="boolean", nullable=false)
     */
    private $potrjenProgram;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramPremiera", mappedBy="dokument")
     */
    private $premiere;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramPonovitev", mappedBy="dokument")
     */
    private $ponovitve;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramIzjemni", mappedBy="dokument")
     */
    private $izjemni;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramFestival", mappedBy="programDela")
     */
    private $programFestival;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramGostujoca", mappedBy="dokument")
     */
    private $gostujoci;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProgramGostovanje", mappedBy="dokument")
     */
    private $gostovanje;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Sezona")
     * @ORM\JoinColumn(name="sezona_id", referencedColumnName="id")
     */
    private $sezona;
}