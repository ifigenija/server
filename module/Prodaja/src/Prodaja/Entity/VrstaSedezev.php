<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class VrstaSedezev
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $kapaciteta;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $poravnava;

    /**
     * @ORM\Column(type="string", length=2, nullable=true)
     */
    private $oblika;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Sedez", mappedBy="vrsta")
     */
    private $sedezi;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\PodrocjeSedenja", inversedBy="vrsta")
     * @ORM\JoinColumn(name="podrocja_sedenja_id", referencedColumnName="id", nullable=false)
     */
    private $podrocjaSedenja;
}