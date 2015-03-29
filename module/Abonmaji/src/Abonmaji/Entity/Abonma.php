<?php
namespace Abonmaji\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Abonma
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $stPredstav;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $stKuponov;

    /**
     * @ORM\Column(type="string", length=40, nullable=true)
     */
    private $ime;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $opis;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $kapaciteta;
}