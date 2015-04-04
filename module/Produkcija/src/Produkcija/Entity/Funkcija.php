<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Funkcija
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $podrocje;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $naziv;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $velikost;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $pomembna;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $sort;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="vloga")
     */
    private $alternacije;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="vloge")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id", nullable=false)
     */
    private $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Alternacija")
     * @ORM\JoinColumn(name="alternacija_id", referencedColumnName="id")
     */
    private $privzeti;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\TipFunkcije", inversedBy="vloge", fetch="EAGER")
     * @ORM\JoinColumn(name="tip_vloge_id", referencedColumnName="id")
     */
    private $tipVloge;
}