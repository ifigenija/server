<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class ZvrstUprizoritve
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
    private $ime;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $opis;
}