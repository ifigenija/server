<?php

namespace Prodaja\Entity;

use Doctrine\ORM\Mapping AS ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity
 */
class Rezervacija
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     */
    protected $id;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\RazpisanSedez", mappedBy="rezervacija")
     */
    protected $razpisaniSedezi;

    /**
     * @ORM\ManyToOne(targetEntity="Prodaja\Entity\ProdajaPredstave", inversedBy="rezervacija")
     * @ORM\JoinColumn(name="prodaja_predstave_id", referencedColumnName="id")
     */
    protected $prodajaPredstave;

    public function __construct()
    {
        $this->razpisaniSedezi = new ArrayCollection();
    }

    public function getId()
    {
        return $this->id;
    }

    public function getRazpisaniSedezi()
    {
        return $this->razpisaniSedezi;
    }

    public function getProdajaPredstave()
    {
        return $this->prodajaPredstave;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setRazpisaniSedezi($razpisaniSedezi)
    {
        $this->razpisaniSedezi = $razpisaniSedezi;
        return $this;
    }

    public function setProdajaPredstave($prodajaPredstave)
    {
        $this->prodajaPredstave = $prodajaPredstave;
        return $this;
    }

}
