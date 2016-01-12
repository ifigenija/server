<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;
use Produkcija\Entity\Uprizoritev;
use Doctrine\Common\Collections\ArrayCollection;

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
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $zaporedna;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label = "predstava.zaporednaSez", description = "predstava.d.zaporednaSez")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $zaporednaSez;

    /**
     *
     * @ORM\Column(type="datetime", nullable=true)
     * @Max\I18n(label = "predstava.objavljenZacetek", description = "predstava.d.objavljenZacetek")
     * @var string
     */
    protected $objavljenZacetek;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="predstava", cascade={"persist"})
     * @Max\I18n(label = "predstava.dogodek", description = "predstava.d.dogodek")
     * @Max\Ui(type="toone")
     * @var Dogodek
     */
    protected $dogodek;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="predstave")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     * @Max\I18n(label = "predstava.uprizoritev", description = "predstava.d.uprizoritev")
     * @Max\Ui(type="hiddenid")
     * @var Uprizoritev
     */
    protected $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Gostovanje", inversedBy="predstave")
     * @ORM\JoinColumn(name="gostovanje_id", referencedColumnName="id")
     * @Max\I18n(label = "predstava.gostovanje", description = "predstava.d.gostovanje")
     * @Max\Ui(type="toone")
     * @var Gostovanje
     */
    protected $gostovanje;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba")
     * @Max\I18n(label = "predstava.dezurni", description = "predstava.d.dezurni")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Oseba
     */
    protected $dezurni;

    /**
     * @ORM\ManyToMany(targetEntity="Abonmaji\Entity\Abonma", inversedBy="predstave")
     * @var <Abonmaji>
     */
    protected $abonmaji;

    public function validate($mode = 'update')
    {
        $this->expect($this->uprizoritev, "Predstava mora biti vezana na uprizoritev", 1000472);
    }

    public function __construct()
    {
        $this->abonmaji = new ArrayCollection();
    }

    public function lahkoBrisem()
    {
        if ($this->getDogodek()) {
            $niPotrjen = $this->getDogodek()->getStatus() < Dogodek::ODOBREN;
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

    function getAbonmaji()
    {
        return $this->abonmaji;
    }

    function setAbonmaji($abonmaji)
    {
        $this->abonmaji = $abonmaji;
        return $this;
    }

    function getDezurni()
    {
        return $this->dezurni;
    }

    function setDezurni(\App\Entity\Oseba $dezurni = null)
    {
        $this->dezurni = $dezurni;
        return $this;
    }

}
