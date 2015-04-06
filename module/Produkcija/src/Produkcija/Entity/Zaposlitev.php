<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Zaposlitev
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    private $status;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $zacetek;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $konec;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $tip;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $delovnaObveza;

    /**
     * @ORM\Column(nullable=true)
     */
    private $malica;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $izmenskoDelo;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $individualnaPogodba;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $jeZaposlenVdrugemJz;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $jeNastopajoci;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="sodelovanje")
     */
    private $alternacija;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="sodelovanja")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     */
    private $oseba;
}