<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Alternacija
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $zaposlen;

    /**
     * 
     */
    private $terminiStoritve;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Funkcija", inversedBy="alternacije")
     * @ORM\JoinColumn(name="vloga_id", referencedColumnName="id", nullable=false)
     */
    private $vloga;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Zaposlitev", inversedBy="alternacija")
     * @ORM\JoinColumn(name="sodelovanje_id", referencedColumnName="id")
     */
    private $sodelovanje;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="alternacije")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     */
    private $oseba;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\ProdukcijaDelitev", inversedBy="alternacije")
     * @ORM\JoinColumn(name="koprodukcija_delitev_id", referencedColumnName="id")
     */
    private $koprodukcija;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Pogodba", inversedBy="alternacije")
     * @ORM\JoinColumn(name="pogodba_id", referencedColumnName="id")
     */
    private $pogodba;
}