<?php

namespace Prodaja\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 *
 * @ORM\Entity(repositoryClass="Prodaja\Repository\Prostori")
 * @Max\I18n(label="Prostor",plural="Prostori")
 * @Max\Id(prefix="0034")
 * @Max\Lookup(extra={"kapaciteta","jePrizorisce"})
 *  */
class Prostor
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID poštnega naslova")
     * @Max\Ui(type="id")
     * @var string     
     */
    protected $id;

    /**
     * @ORM\Column(type="string", unique=true, nullable=false)
     * @Max\I18n(label="prostor.sifra", description="prostor.d.sifra")
     * @Max\Ui(type="sifra",ident=true, icon="fa fa-barcode")
     * @var string
     */
    protected $sifra;

    /**
     * @ORM\Column(type="string", unique=true, nullable=false)
     * @Max\I18n(label="prostor.naziv", description="prostor.d.naziv")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    protected $naziv;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="prostor.jePrizorisce", description="prostor.d.jePrizorisce")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $jePrizorisce;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="prostor.jeMaticniOder", description="prostor.d.jeMaticniOder")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $jeMaticniOder;

    /**
     * @ORM\Column(type="boolean", nullable=false, options={"default"=false})
     * @Max\I18n(label="prostor.sePlanira", description="prostor.d.sePlanira")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $sePlanira = false;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="prostor.kapaciteta", description="prostor.d.kapaciteta")
     * @var integer
     */
    protected $kapaciteta;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="prostor.opis", description="prostor.d.opis")
     * @var string
     */
    protected $opis;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="prostori")
     * @Max\I18n(label="prostor.popa",  description="prostor.d.popa")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    protected $popa;

    /**
     * naslov je lahko le eden od naslovov poslovnega partnerja
     * 
     * @ORM\ManyToOne(targetEntity="App\Entity\PostniNaslov")
     * @Max\I18n(label="prostor.naslov", description="prostor.d.naslov")
     * @Max\Ui(type="toone", empty="Izberi naslov", filters={"popa" : {"element":"popa"}})
     * @var \App\Entity\PostniNaslov
     */
    protected $naslov;

    public function validate($mode = 'update')
    {
        if ($this->popa) {
            $this->expect($this->naslov, "Naslov prostora je obvezen podatek, če imamo na prostoru vnešenega poslovnega partnerja", 1000380);
            $naslov  = $this->naslov;
            $obstaja = false; //init
            $obstaja = $this->popa
                    ->getNaslovi()
                    ->exists(function($key, $popaNaslov) use(&$naslov) {
                return ($popaNaslov === $naslov );     //vrne true, če je obstaja isti naslov pri popa
            });
            $this->expect($obstaja, "Naslov prostora je lahko le eden od naslovov poslovnega partnerja", 1000381);
        }
    }

    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getJePrizorisce()
    {
        return $this->jePrizorisce;
    }

    public function getKapaciteta()
    {
        return $this->kapaciteta;
    }

    public function getOpis()
    {
        return $this->opis;
    }

    public function getPopa()
    {
        return $this->popa;
    }

    public function getNaslov()
    {
        return $this->naslov;
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

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setJePrizorisce($jePrizorisce)
    {
        $this->jePrizorisce = $jePrizorisce;
        return $this;
    }

    public function setKapaciteta($kapaciteta)
    {
        $this->kapaciteta = $kapaciteta;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

    public function setPopa(\App\Entity\Popa $popa = null)
    {
        $this->popa = $popa;
        return $this;
    }

    public function setNaslov(\App\Entity\PostniNaslov $naslov = null)
    {
        $this->naslov = $naslov;
        return $this;
    }

    public function getSePlanira()
    {
        return $this->sePlanira;
    }

    public function setSePlanira($sePlanira)
    {
        $this->sePlanira = $sePlanira;
        return $this;
    }

    public function getJeMaticniOder()
    {
        return $this->jeMaticniOder;
    }

    public function setJeMaticniOder($jeMaticniOder)
    {
        $this->jeMaticniOder = $jeMaticniOder;
        return $this;
    }

}
