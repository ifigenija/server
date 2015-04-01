<?php
namespace App\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Telefonska
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=20, nullable=false)
     */
    private $vrsta;

    /**
     * @ORM\Column(type="string", length=30, nullable=false)
     */
    private $stevilka;

    /**
     * @ORM\Column(nullable=false)
     */
    private $privzeta;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="telefonske")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     */
    private $oseba;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="telefonske")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     */
    private $popa;
}