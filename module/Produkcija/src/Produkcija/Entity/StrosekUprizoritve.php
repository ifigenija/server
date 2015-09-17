<?php

namespace Produkcija\Entity;

use App\Entity\Popa;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\StroskiUprizoritve")
 * @Max\I18n(label="Strošek uprizoritve",plural="Stroški uprizoritve/projekta")
 * @Max\Id(prefix="0039")
 */
class StrosekUprizoritve
        extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID stroška uprizoritve / projekta")
     * @Max\Ui(type="id")
     * @var string    
     */
    protected $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="strupr.naziv", description="strupr.d.naziv")
     * @Max\Ui(type="naziv",ident=true, required=true)
     * @var string
     */
    protected $naziv;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="strupr.vrednostDo", description="strupr.d.vrednostDo")
     * @Max\Ui(required=true, icon="fa fa-euro")
     * @var double
     */
    protected $vrednostDo;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="strupr.vrednostNa", description="strupr.d.vrednostNa")
     * @Max\Ui(required=true,icon="fa fa-euro")
     * @var double
     */
    protected $vrednostNa;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="strupr.opis", description="strupr.d.opis")
     * @var string
     */
    protected $opis;

    /**
     * @ORM\Column(type="string", length=10)
     * @Max\I18n(label="strupr.tipstroska",  description="strupr.d.tipstroska")
     * @Max\Ui(type="select",opts="strosekuprizoritve.tipstroska", required=true)
     * @var string
     */
    protected $tipstroska;

    /**
     * polje je aktualno le pri materialnih stroških
     * 
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\VrstaStroska")
     * @Max\I18n(label="strupr.vrstaStroska",  description="strupr.d.vrstaStroska")
     * $$ začasno izključimo ,ker javlja napako 1010001:
     * Max\Ui(type="optionalselect",empty="brez vrste stroška",required=false)
     * @var VrstaStroska
     */
    protected $vrstaStroska;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="strupr.sort", description="strupr.d.sort")
     * @Max\Ui(type="integer",icon="fa fa-sort")
     * @var integer
     */
    protected $sort;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="stroski")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     * @Max\I18n(label="strupr.uprizoritev",  description="prodel.d.uprizoritev")
     * @Max\Ui(type="hiddenid")
     * @var \Produkcija\Entity\Uprizoritev
     */
    protected $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="stroski")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     * @Max\I18n(label="strupr.popa",  description="strupr.d.popa")
     * @Max\Ui(type="toone")
     * @var Popa
     */
    protected $popa;

    public function validate($mode = 'update')
    {
        if ($this->tipstroska == 'materialni') {
            $this->expect($this->vrstaStroska, "Pri materialnih stroških vrsta stroška obvezen podatek", 1000370);
            $this->expect($this->vrstaStroska->getPodskupina() !== 0, "Vrsta stroška ne sme biti naslov skupine", 1000371);
        } else {
            $this->vrstaStroska = NULL;
        }
    }

    public function getId()
    {
        return $this->id;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getVrednostDo()
    {
        return $this->vrednostDo;
    }

    public function getVrednostNa()
    {
        return $this->vrednostNa;
    }

    public function getOpis()
    {
        return $this->opis;
    }

    public function getSort()
    {
        return $this->sort;
    }

    public function getUprizoritev()
    {
        return $this->uprizoritev;
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

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setVrednostDo($vrednostDo)
    {
        $this->vrednostDo = $vrednostDo;
        return $this;
    }

    public function setVrednostNa($vrednostNa)
    {
        $this->vrednostNa = $vrednostNa;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

    public function setSort($sort)
    {
        $this->sort = $sort;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev=null)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

    public function setPopa(Popa $popa=null)
    {
        $this->popa = $popa;
        return $this;
    }

    public function getTipstroska()
    {
        return $this->tipstroska;
    }

    public function setTipstroska($tipstroska)
    {
        $this->tipstroska = $tipstroska;
        return $this;
    }

    public function getVrstaStroska()
    {
        return $this->vrstaStroska;
    }

    public function setVrstaStroska(VrstaStroska $vrstaStroska=null)
    {
        $this->vrstaStroska = $vrstaStroska;
        return $this;
    }

}
