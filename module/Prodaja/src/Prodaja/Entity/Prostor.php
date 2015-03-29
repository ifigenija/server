<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Prostor
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(type="string", unique=true, nullable=false)
     */
    private $ime;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $jePrizorisce;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $kapaciteta;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $opis;
}