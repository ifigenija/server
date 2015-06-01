<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\EnotePrograma")
 * @ORM\InheritanceType("SINGLE_TABLE")
 * @ORM\DiscriminatorColumn(name="tip", length=15, type="string")
 * @ORM\DiscriminatorMap(
 *     {
 *     "premiera"="ProgramDela\Entity\ProgramPremiera",
 *     "ponovitev"="ProgramDela\Entity\ProgramPonovitev",
 *     "izjemni"="ProgramDela\Entity\ProgramIzjemni",
 *     "gotujoci"="ProgramDela\Entity\ProgramGostujoca"
 * }
 * )
 * 
 * @Max\I18n(label="Enota Programa",plural="")
 * @Max\Id(prefix="001b")
 */
class EnotaPrograma
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
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     */
    private $celotnaVrednost;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     */
    private $zaproseno;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     */
    private $lastnaSredstva;

    /**
     * @ORM\Column(type="decimal", nullable=false, options={"default":0})
     */
    private $avtorskiHonorarji;

    /**
     * @ORM\Column(type="decimal", nullable=false, precision=15, scale=2, options={"default":0})
     */
    private $tantieme;

    /**
     * @ORM\Column(type="decimal", nullable=false, options={"default":0})
     */
    private $drugiViri;

    /**
     * @ORM\Column(type="decimal", nullable=false, options={"default":0})
     */
    private $drugiJavni;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     */
    private $obiskDoma;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     */
    private $obiskGost;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     */
    private $obiskZamejo;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     */
    private $obiskInt;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":" 0"})
     */
    private $ponoviDoma;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     */
    private $ponoviZamejo;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     */
    private $ponoviGost;

    /**
     * @ORM\Column(type="integer", nullable=false, options={"default":0})
     */
    private $ponoviInt;

    /**
     * @ORM\Column(type="text", nullable=false)
     */
    private $utemeljitev;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     */
    private $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\TipProgramskeEnote", inversedBy="enotaPrograma")
     * @ORM\JoinColumn(name="tip_programske_enote_id", referencedColumnName="id")
     */
    private $tipProgramskeEnote;
}