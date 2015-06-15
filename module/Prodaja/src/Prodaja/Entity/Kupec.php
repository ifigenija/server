<?php

namespace Prodaja\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;
/**
 * Entiteta za naslove
 *
 * @ORM\Entity(repositoryClass="Prodaja\Repository\Kupci")
 * @Max\I18n(label="Kupec",plural="Kupci")
 * @Max\Id(prefix="0040")
 */
class Kupec
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID kupca")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Racun", mappedBy="kupec")
     * @var <Racun>
     */
    private $racun;

    /**
     * 
     * @ORM\OneToOne(targetEntity="App\Entity\Popa", inversedBy="kupec")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Poslovni partner",  description="Poslovni partner kupec ")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    private $popa;
    public function __construct()
    {
        $this->racun  = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getRacun()
    {
        return $this->racun;
    }

    public function getPopa()
    {
        return $this->popa;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setRacun($racun)
    {
        $this->racun = $racun;
        return $this;
    }

    public function setPopa(\App\Entity\Popa $popa)
    {
        $this->popa = $popa;
        return $this;
    }

}
