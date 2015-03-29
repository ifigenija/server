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
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\ProdanSedez", mappedBy="postavkaRacuna")
     */
    private $prodanSedez;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Racun", inversedBy="postavke")
     * @ORM\JoinColumn(name="racun_id", referencedColumnName="id")
     */
    private $dokument;
}