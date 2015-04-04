<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Besedilo
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $naslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $avtor;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $podnaslov;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $jezik;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $naslovIzvirnika;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $datumPrejema;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $moskeVloge;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $zenskeVloge;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $prevajalec;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $povzetekVsebine;
}