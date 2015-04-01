<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Sodelovanje
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
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="sodelovanje")
     */
    private $alternacija;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Pogodba", mappedBy="sodelovanje")
     */
    private $pogodba;

    /**
     * 
     * 
     */
    private $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="sodelovanje")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     */
    private $oseba;

    /**
     * 
     * 
     */
    private $sodelavec;
}