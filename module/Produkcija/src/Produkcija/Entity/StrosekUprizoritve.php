<?php

namespace Produkcija\Entity;

use Doctrine\ORM\Mapping AS ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Produkcija\Repository\StroskiUprizoritve")
 * @Max\I18n(label="Strošek uprizoritve",plural="Stroški uprizoritve/projekta")
 * @Max\Id(prefix="000e")
 */
class StrosekUprizoritve
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID stroška uprizoritve / projekta")
     * @Max\Ui(type="id")
     * @var string    
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Naziv", description="Naziv stroška")
     * @Max\Ui(type="naziv",ident=true )
     * @var string
     */
    private $naziv;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="Vrednost do premiere", description="Vrednost do premiere")
     * @var double
     */
    private $vrednostDo;

    /**
     * @ORM\Column(type="decimal", nullable=true, precision=15, scale=2)
     * @Max\I18n(label="Vrednost na ponovitev", description="Vrednost na ponovitev")
     * @var double
     */
    private $vrednostNa;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Opis", description="Opis stroška")
     * @var string
     */
    private $opis;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Sort", description="Sort")
     * @var integer
     */
    private $sort;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="stroski")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     * @Max\I18n(label="Uprizoritev",  description="Uprizoritev oz. projekt, za katerega je strošek")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Uprizoritev
     */
    private $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="stroski")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     * @Max\I18n(label="Poslovni partner",  description="Poslovni partner")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Popa
     */
    private $popa;

    public function validate($mode = 'update')
    {
        
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

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

    public function setPopa(\App\Entity\Popa $popa)
    {
        $this->popa = $popa;
        return $this;
    }

}
