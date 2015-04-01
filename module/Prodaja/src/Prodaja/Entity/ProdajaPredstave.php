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
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Racun", mappedBy="prodajaPredstave")
     */
    private $racun;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\RazpisanSedez", mappedBy="prodajaPredstave")
     */
    private $razpisanSedez;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Rezervacija", mappedBy="prodajaPredstave")
     */
    private $rezervacija;

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