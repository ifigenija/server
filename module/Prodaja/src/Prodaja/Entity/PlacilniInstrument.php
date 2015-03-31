<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class PlacilniInstrument
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
    private $ime;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Racun", mappedBy="placilniInstrument")
     */
    private $racun;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\NacinPlacina", inversedBy="placilniInstrument")
     * @ORM\JoinColumn(name="nacin_placina_id", referencedColumnName="id")
     */
    private $nacinPlacina;
}