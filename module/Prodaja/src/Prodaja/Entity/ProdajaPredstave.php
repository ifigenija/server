<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class ProdajaPredstave
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Racun", mappedBy="prodajaPredstave")
     */
    private $racun;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\SedezniRed", inversedBy="prodajePredstave")
     * @ORM\JoinColumn(name="sedezni_red_id", referencedColumnName="id")
     */
    private $sedezniRed;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Dogodek", inversedBy="prodajaPredstave")
     * @ORM\JoinColumn(name="dogodek_id", referencedColumnName="id", nullable=false)
     */
    private $dogodek;
}