<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Sedez
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\ProdanSedez", mappedBy="sedez")
     */
    private $prodanSedez;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Vrsta", inversedBy="sedezi")
     * @ORM\JoinColumn(name="vrsta_id", referencedColumnName="id", nullable=false)
     */
    private $vrsta;
}