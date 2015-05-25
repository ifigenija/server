<?php
namespace App\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class KontaktnaOseba
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    private $status;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $funkcija;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $opis;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="kontaktnaOseba")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     */
    private $popa;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="kontaktnaOseba")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     */
    private $oseba;
}