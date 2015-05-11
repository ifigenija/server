<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity
 * @Max\I18n(label="Produkcijska hiša",plural="Produkcijske hiše")
 * @Max\Id(prefix="0025")
 */
class ProdukcijskaHisa
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID produkcijske hiše")
     * @Max\Ui(type="id")
     * @var string     
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     * @Max\I18n(label="Status", description="Status produkcijske hiše")
     * @var string     
     */
    private $status;

    /**
     * @ORM\OneToOne(targetEntity="App\Entity\Popa")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Poslovni partner",  description="Poslovni partner")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    private $popa;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\ProdukcijaDelitev", mappedBy="koproducent")
     * @var <Koprodukcije>
     */
    private $koprodukcije;

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getPopa()
    {
        return $this->popa;
    }

    public function getKoprodukcije()
    {
        return $this->koprodukcije;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setStatus($status)
    {
        $this->status = $status;
        return $this;
    }

    public function setPopa(\App\Entity\Popa $popa)
    {
        $this->popa = $popa;
        return $this;
    }

    public function setKoprodukcije($koprodukcije)
    {
        $this->koprodukcije = $koprodukcije;
        return $this;
    }

}
