<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class NacinPlacina
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $ime;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    private $vrsta;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\PlacilniInstrument", mappedBy="nacinPlacina")
     */
    private $placilniInstrument;
}