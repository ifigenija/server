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
     * @ORM\Column(type="string", length=3, nullable=true)
     */
    private $stevilka;

    /**
     * @ORM\Column(type="string", length=60, nullable=true)
     */
    private $oznaka;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    private $kakovost;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $koordinataX;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $koordinataY;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    private $barva;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\RazpisanSedez", mappedBy="sedez")
     */
    private $prodanSedez;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\Vrsta", inversedBy="sedezi")
     * @ORM\JoinColumn(name="vrsta_id", referencedColumnName="id", nullable=false)
     */
    private $vrsta;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\SedezniRed", inversedBy="sedez")
     * @ORM\JoinColumn(name="sedezni_red_id", referencedColumnName="id")
     */
    private $sedezniRed;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\PodrocjeSedenja", inversedBy="sedez")
     * @ORM\JoinColumn(name="podrocja_sedenja_id", referencedColumnName="id")
     */
    private $podrocjaSedenja;
}