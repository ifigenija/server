<?php
namespace Koledar\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Zasedenost extends \Koledar\Entity\Dogodek
{
    /**
     * 
     * 
     * 
     */
    private $id;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="zasedenost")
     */
    private $dogodek;
}