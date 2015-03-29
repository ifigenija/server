<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Kupec
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Racun", mappedBy="kupec")
     */
    private $racun;

    /**
     * 
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id", unique=true)
     * @ORM\OneToOne(targetEntity="App\Entity\Popa")
     */
    private $popa;
}