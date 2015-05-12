<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * Dogodek uprizoritve - ali vaja ali predstava
 * 
  * @ORM\Entity(repositoryClass="Koledar\Repository\Dogodki")
 * @ORM\Table(indexes={@ORM\Index(name="zacetek", columns={"zacetek"}),@ORM\Index(name="konec", columns={"konec"})})
 * @Max\I18n(label="Dogodek",plural="Dogodki")
 * @Max\Id(prefix="0024")
 */
class Dogodek
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $zacetek;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $konec;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $status;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    private $razred;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $termin;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $ime;

    /**
     * 
     */
    private $prostor_id;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Predstava", inversedBy="dogodek")
     * @ORM\JoinColumn(name="predstava_id", referencedColumnName="id", unique=true)
     */
    private $predstava;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Zasedenost", inversedBy="dogodek")
     * @ORM\JoinColumn(name="zasedenost_id", referencedColumnName="id", unique=true)
     */
    private $zasedenost;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Vaja", inversedBy="dogodek")
     * @ORM\JoinColumn(name="vaja_id", referencedColumnName="id", unique=true)
     */
    private $vaja;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Gostovanje", inversedBy="dogodek")
     * @ORM\JoinColumn(name="gostovanje_id", referencedColumnName="id", unique=true)
     */
    private $gostovanje;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\DogodekIzven", inversedBy="dogodek")
     * @ORM\JoinColumn(name="dogodek_izven_id", referencedColumnName="id", unique=true)
     */
    private $dogodekIzven;

    /**
     * @ORM\OneToOne(targetEntity="Prodaja\Entity\Prostor")
     * @ORM\JoinColumn(name="prostor_id", referencedColumnName="id", unique=true)
     */
    private $prostor;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Arhivalija", mappedBy="dogodek")
     */
    private $arhiv;

    /**
     * @ORM\OneToMany(targetEntity="Prisotnost\Entity\TerminStoritve", mappedBy="dogodek")
     */
    private $terminiStoritve;

    /**
     * 
     */
    private $terminStoritve;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\ProdajaPredstave", mappedBy="dogodek")
     */
    private $prodajaPredstave;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Sezona", inversedBy="dogodki")
     * @ORM\JoinColumn(name="sezona_id", referencedColumnName="id")
     */
    private $sezona;

}
