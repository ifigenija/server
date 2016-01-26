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
     * 1. zaporedna: zaporedna številka predstave v sezoni (ne glede na uprizoritev)
     * 
     * štejejo se tudi gostovanja!
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label = "predstava.zaporednaSezVsehUpr", description = "predstava.d.zaporednaSezVsehUpr")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $zaporednaSezVsehUpr;

    /**
     * 2. zaporedna:  zaporedna številka predstave določene uprizoritve  (v vseh sezonah)
     * 
     * štejejo se tudi gostovanja!
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label = "predstava.zaporedna", description = "predstava.d.zaporedna")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $zaporedna;

    /**
     * 3. zaporedna:  zaporedna številka predstave določene uprizoritve v sezoni
     * 
     * štejejo se tudi gostovanja!
     * 
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label = "predstava.zaporednaSez", description = "predstava.d.zaporednaSez")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $zaporednaSez;

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
     * @ORM\ManyToMany(targetEntity="Abonmaji\Entity\Abonma", inversedBy="predstave")
     * @var <Abonmaji>
     */
    protected $abonmaji;

    public function validate($mode = 'update')
    {
        $this->expect($this->uprizoritev, "Predstava mora biti vezana na uprizoritev", 1001902);
        $this->expect($this->dogodek, "Pri predstavi je dogodek obvezen", 1001902);
        $this->expect($this->dogodek->getZacetek(), "Pri predstavi je začetek obvezen", 1001903);
        $this->expect($this->dogodek->getKonec(), "Pri predstavi je konec obvezen", 1001904);
    }

    public function __construct()
    {
        $this->abonmaji = new ArrayCollection();
    }

    public function lahkoBrisem()
    {
        if ($this->getDogodek()) {
            $niPotrjen = $this->getDogodek()->getStatus() < Dogodek::POTRJEN;
            $this->expect($niPotrjen, "Dogodek je javno potrjen, brisanje ni mogoče", 1001905);
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

    function getZaporednaSezVsehUpr()
    {
        return $this->zaporednaSezVsehUpr;
    }

    function setZaporednaSezVsehUpr($zaporednaSezVsehUpr)
    {
        $this->zaporednaSezVsehUpr = $zaporednaSezVsehUpr;
        return $this;
    }

}
