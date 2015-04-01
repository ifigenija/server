<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class PostavkaRacuna
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\RazpisanSedez", mappedBy="postavkaRacuna")
     */
    private $prodanSedez;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Racun", inversedBy="postavke")
     * @ORM\JoinColumn(name="racun_id", referencedColumnName="id")
     */
    private $dokument;
}