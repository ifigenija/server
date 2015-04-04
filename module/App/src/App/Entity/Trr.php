<?php
namespace App\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Trr
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
    private $stevilka;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $swift;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $bic;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $banka;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="trrji")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     */
    private $popa;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="trrji")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     */
    private $oseba;
}