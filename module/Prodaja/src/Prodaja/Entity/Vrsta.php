<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Vrsta
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Sedez", mappedBy="vrsta")
     */
    private $sedezi;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\SedezniRed", inversedBy="vrste")
     * @ORM\JoinColumn(name="sedezni_red_id", referencedColumnName="id")
     */
    private $sedezniRed;
}