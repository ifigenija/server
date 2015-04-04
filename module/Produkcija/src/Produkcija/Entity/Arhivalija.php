<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Arhivalija
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $oznakaDatuma;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $datum;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $fizicnaOblika;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $izvorDigitalizata;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $povzetek;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $opombe;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $lokacijaOriginala;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $objavljeno;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $naslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $avtorstvo;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Dogodek", inversedBy="arhiv")
     * @ORM\JoinColumn(name="dogodek_id", referencedColumnName="id")
     */
    private $dogodek;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="arhiv")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     */
    private $uprizoritev;
}