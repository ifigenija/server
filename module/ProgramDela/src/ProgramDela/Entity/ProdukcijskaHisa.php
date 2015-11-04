<?php

namespace ProgramDela\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProdukcijskeHise")
 * @Max\Lookup(ident="sifra",label="popa.naziv",search={"popa.naziv","popa.sifra"},)   
 * @Max\I18n(label="Produkcijska hiša",plural="Produkcijske hiše")
 * @Max\Id(prefix="0025")
 */
class ProdukcijskaHisa
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID produkcijske hiše")
     * @Max\Ui(type="id")
     * @var string     
     */
    protected $id;

    /**
     * Šifra klienta
     *
     * @ORM\Column(unique=true,  nullable=false)
     * @Max\I18n(label="Šifra", description="Unikatna šifra klienta")
     * @Max\Ui(ident=true, type="sifra",icon="fa fa-barcode",group="Osnovni podatki")
     * @var string
     */
    protected $sifra;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     * @Max\I18n(label="Status", description="Status produkcijske hiše")
     * @Max\Ui(type="select",opts="produkcijskahisa.status", required=true)
     * @var string     
     */
    protected $status;

    /**
     * @ORM\OneToOne(targetEntity="App\Entity\Popa", inversedBy="producent")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id", unique=true)
     * @Max\I18n(label="Poslovni partner",  description="Poslovni partner")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    protected $popa;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\ProdukcijaDelitev", mappedBy="koproducent")
     * @var <Koprodukcije>
     */
    protected $koprodukcije;

    /**
     * @ORM\OneToMany(targetEntity="Produkcija\Entity\Uprizoritev", mappedBy="producent")
     * @var <Uprizoritve>
     */
    protected $uprizoritve;

    public function __construct()
    {
        $this->koprodukcije = new ArrayCollection();
        $this->uprizoritve  = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        $this->expect($this->popa, "Poslovni partner je obvezen", 1000334);

        $this->setSifra($this->getPopa()->getSifra());
    }

    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
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

    public function getUprizoritve()
    {
        return $this->uprizoritve;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

    public function setStatus($status)
    {
        $this->status = $status;
        return $this;
    }

    public function setPopa(\App\Entity\Popa $popa=null)
    {
        $this->popa = $popa;
        return $this;
    }

    public function setKoprodukcije($koprodukcije)
    {
        $this->koprodukcije = $koprodukcije;
        return $this;
    }

    public function setUprizoritve($uprizoritve)
    {
        $this->uprizoritve = $uprizoritve;
        return $this;
    }

}
