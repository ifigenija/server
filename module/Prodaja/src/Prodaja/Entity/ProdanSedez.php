<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class ProdanSedez
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\PostavkaRacuna", inversedBy="prodanSedez")
     * @ORM\JoinColumn(name="postavka_racuna_id", referencedColumnName="id", nullable=false)
     */
    private $postavkaRacuna;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Sedez", inversedBy="prodanSedez")
     * @ORM\JoinColumn(name="sedez_id", referencedColumnName="id")
     */
    private $sedez;
}