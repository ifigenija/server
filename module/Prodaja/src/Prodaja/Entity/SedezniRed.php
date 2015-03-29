<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class SedezniRed
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $kapaciteta;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $ime;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\ProdajaPredstave", mappedBy="sedezniRed")
     */
    private $prodajePredstave;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Vrsta", mappedBy="sedezniRed")
     */
    private $vrste;
}