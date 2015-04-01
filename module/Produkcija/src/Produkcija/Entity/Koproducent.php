<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Koproducent
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    private $status;

    /**
     * @ORM\OneToOne(targetEntity="App\Entity\Popa")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id", unique=true)
     */
    private $popa;

    /**
     * 
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\KoprodukcijaDelitev", mappedBy="koproducent")
     */
    private $koprodukcije;
}