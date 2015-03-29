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
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
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
     * @ORM\Column(type="decimal", nullable=true, scale=12, precision=2)
     */
    private $vrednostUre;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Sodelovanje", inversedBy="pogodba")
     * @ORM\JoinColumn(name="sodelovanje_id", referencedColumnName="id")
     */
    private $sodelovanje;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="pogodba")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id", nullable=false)
     */
    private $oseba;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="pogodba")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     */
    private $popa;
}