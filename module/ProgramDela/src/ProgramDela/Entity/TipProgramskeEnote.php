<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\TipiProgramskeEnote")
 * @Max\I18n(label="Tip programske enote",plural="Tipi programske enote")
 * @Max\Id(prefix="0043") 
 */
class TipProgramskeEnote
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID poštnega naslova")
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
     * @ORM\Column(type="boolean", nullable=false, options={"default":false})
     */
    private $koprodukcija;

    /**
     * @ORM\Column(type="decimal", nullable=false, options={"default":1})
     */
    private $maxFaktor;

    /**
     * @ORM\Column(type="decimal", nullable=false, options={"default":0})
     */
    private $maxVsi;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\EnotaPrograma", mappedBy="tipProgramskeEnote")
     */
    private $enotaPrograma;

}
