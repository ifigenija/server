<?php
namespace Prisotnost\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class TerminStoritve
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $planiranZacetek;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $planiranKonec;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $zacetek;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $konec;

    /**
     * @ORM\Column(type="decimal", nullable=true)
     */
    private $planiranoTraja;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Dogodek", inversedBy="terminiStoritve")
     * @ORM\JoinColumn(name="dogodek_id", referencedColumnName="id")
     */
    private $dogodek;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Alternacija")
     * @ORM\JoinColumn(name="alternacija_id", referencedColumnName="id")
     */
    private $alternacija;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id", nullable=false)
     */
    private $oseba;
}