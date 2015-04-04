<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Pogodba
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     */
    private $vrednostVaje;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=12, scale=2)
     */
    private $vrednostPredstave;

    /**
     * @ORM\Column(type="decimal", nullable=true, scale=2, precision=12)
     */
    private $vrednostUre;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $aktivna;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $opis;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Alternacija", mappedBy="pogodba")
     */
    private $alternacije;

    /**
     * 
     * 
     */
    private $sodelovanje;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="pogodba")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id", nullable=false)
     */
    private $oseba;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="pogodbe")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     */
    private $popa;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Trr")
     * @ORM\JoinColumn(name="trr_id", referencedColumnName="id")
     */
    private $trr;
}