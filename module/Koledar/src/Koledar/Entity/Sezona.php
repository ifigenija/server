<?php
namespace Koledar\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Sezona
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
    private $imeSezone;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $zacetek;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $konec;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $aktivna;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Dogodek", mappedBy="sezona")
     */
    private $dogodki;
}