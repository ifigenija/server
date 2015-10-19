<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;
use Produkcija\Entity\Uprizoritev;

/**
 * Entiteta za naslove
 *
 * @ORM\Entity(repositoryClass="Koledar\Repository\Predstave")
 * @Max\I18n(label="Predstava",plural="Predstave")
 * @Max\Id(prefix="0027")
 */
class Predstava
        extends \Max\Entity\Base
{

    use DogodekTrait;

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID predstave")
     * @Max\Ui(type="id")
     * @var string     
     */
    protected $id;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label = "predstava.zaporedna", description = "predstava.d.zaporedna")
     * @Max\I18n(label="Zaporedna št.", description="Zaporedna številka predstave")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $zaporedna;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label = "predstava.zaporednaSez", description = "predstava.d.zaporednaSez")
     * @Max\I18n(label="Zaporedna št. v sezoni", description="Zaporedna številka predstave v sezoni")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $zaporednaSez;

    /**
     *
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label = "predstava.objavljenZacetek", description = "predstava.d.objavljenZacetek")
     * @Max\I18n(label="Začetek za objavo", description="Čas začetka predstave, kot je objavljen za publiko.")
     * @var string
     */
    protected $objavljenZacetek;

    /**
     * 
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label = "predstava.porocilo", description = "predstava.d.porocilo")
     * @Max\I18n(label="Poročilo", description="Poročilo")
     * @var string
     */
    protected $porocilo;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="predstava", cascade={"persist"})
     * @Max\I18n(label = "predstava.dogodek", description = "predstava.d.dogodek")
     * @Max\I18n(label="Dogodek",  description="Dogodek")
     * @Max\Ui(type="toone")
     * @var Dogodek
     */
    protected $dogodek;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="predstave")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     * @Max\I18n(label = "predstava.uprizoritev", description = "predstava.d.uprizoritev")
     * @Max\I18n(label="Uprizoritev",  description="Uprizoritev")
     * @Max\Ui(type="hiddenid")
     * @var Uprizoritev
     */
    protected $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Gostovanje", inversedBy="predstave")
     * @ORM\JoinColumn(name="gostovanje_id", referencedColumnName="id")
     * @Max\I18n(label = "predstava.gostovanje", description = "predstava.d.gostovanje")
     * @Max\I18n(label="Gostovanje",  description="Gostovanje")
     * @Max\Ui(type="toone")
     * @var Gostovanje
     */
    protected $gostovanje;

    public function validate($mode = 'update')
    {
        $this->expect($this->uprizoritev, "Predstava mora biti vezana na uprizoritev", 1000472);
    }

    public function lahkoBrisem()
    {
        if ($this->getDogodek()) {
            $niPotrjen = $this->getDogodek()->getStatus() < Dogodek::POTRJEN_JAVNO;
            $this->expect($niPotrjen, "Dogodek je javno potrjen, brisanje ni mogoče", 1000544);
        }
    }

    /**
     * dodaj dogodek
     */
    public function dodajDogodek()
    {
        $this->dogodek = new Dogodek();
        $this->dogodek->setPredstava($this);
        $this->dogodek->setRazred(Dogodek::PREDSTAVA);
    }

    /**
     * @return string
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param string $id
     * @return Predstava
     */
    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    /**
     * @return int
     */
    public function getZaporedna()
    {
        return $this->zaporedna;
    }

    /**
     * @param int $zaporedna
     * @return Predstava
     */
    public function setZaporedna($zaporedna)
    {
        $this->zaporedna = $zaporedna;
        return $this;
    }

    /**
     * @return string
     */
    public function getPorocilo()
    {
        return $this->porocilo;
    }

    /**
     * @param string $porocilo
     * @return Predstava
     */
    public function setPorocilo($porocilo)
    {
        $this->porocilo = $porocilo;
        return $this;
    }

    /**
     * @return Dogodek
     */
    public function getDogodek()
    {
        return $this->dogodek;
    }

    /**
     * @param Dogodek $dogodek
     * @return Predstava
     */
    public function setDogodek(Dogodek $dogodek = null)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

    /**
     * @return Uprizoritev
     */
    public function getUprizoritev()
    {
        return $this->uprizoritev;
    }

    /**
     * @param Uprizoritev $uprizoritev
     * @return Predstava
     */
    public function setUprizoritev($uprizoritev)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

    /**
     * @return Gostovanje
     */
    public function getGostovanje()
    {
        return $this->gostovanje;
    }

    /**
     * @param Gostovanje $gostovanje
     * @return Predstava
     */
    public function setGostovanje(Gostovanje $gostovanje = null)
    {
        $this->gostovanje = $gostovanje;
        return $this;
    }

    /**
     * @return string
     */
    public function getObjavljenZacetek()
    {
        return $this->objavljenZacetek;
    }

    /**
     * @param string $objavljenZacetek
     * @return Predstava
     */
    public function setObjavljenZacetek($objavljenZacetek)
    {
        $this->objavljenZacetek = $objavljenZacetek;
        return $this;
    }

    function getZaporednaSez()
    {
        return $this->zaporednaSez;
    }

    function setZaporednaSez($zaporednaSez)
    {
        $this->zaporednaSez = $zaporednaSez;
        return $this;
    }

}
