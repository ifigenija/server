<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Alternacija
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * 
     */
    private $terminiStoritve;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Vloga", inversedBy="alternacije")
     * @ORM\JoinColumn(name="vloga_id", referencedColumnName="id", nullable=false)
     */
    private $vloga;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Sodelovanje", inversedBy="alternacija")
     * @ORM\JoinColumn(name="sodelovanje_id", referencedColumnName="id")
     */
    private $sodelovanje;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="alternacija")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     */
    private $oseba;
}