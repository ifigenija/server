<?php

namespace Koledar\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * @ORM\Entity(repositoryClass="Koledar\Repository\Gostovanja")
 * @Max\I18n(label="Gostovanje",plural="Gostovanja")
 * @Max\Id(prefix="0028")
 */
class Gostovanje
        extends Base
{
    use DogodekTrait;

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID gostovanja")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Vrsta", description="Vrsta gostovanja")
     * @var string
     */
    protected $vrsta;
    
    /**
     * @ORM\Column(type="boolean", nullable=true)
     * @Max\I18n(label="Zamejstvo", description="Zamejstvo")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    protected $zamejstvo;
    
    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Kraj", description="Kraj")
     * @Max\Ui(type="naziv")
     * @var string
     */
    protected $kraj;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="gostovanje", cascade={"persist"})
     * @Max\I18n(label="Dogodek",  description="Dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    protected $dogodek;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Predstava", mappedBy="gostovanje")
     * @var <Predstave>
     */
    protected $predstave;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Drzava")
     * @ORM\JoinColumn(name="drzava_id", referencedColumnName="id", nullable=false)
     * @Max\I18n(label="Država",  description="Država")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Drzava
     */
    protected $drzava;

    public function __construct()
    {
        $this->predstave = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        
    }
    function dodajDogodek()
    {
        $this->dogodek = new Dogodek();
        $this->dogodek->setGostovanje($this);
        $this->dogodek->setRazred(Dogodek::GOSTOVANJE);
    }


    public function getId()
    {
        return $this->id;
    }

    public function getVrsta()
    {
        return $this->vrsta;
    }
    
    public function getZamejstvo()
    {
        return $this->zamejstvo;
    }
    
    public function getKraj()
    {
        return $this->vrsta;
    }

    public function getDogodek()
    {
        return $this->dogodek;
    }

    public function getPredstave()
    {
        return $this->predstave;
    }

    public function getDrzava()
    {
        return $this->drzava;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setVrsta($vrsta)
    {
        $this->vrsta = $vrsta;
        return $this;
    }
    
    public function setZamejstvo($zamejstvo)
    {
        $this->zamejstvo = $zamejstvo;
        return $this;
    }
    
    public function setKraj($kraj)
    {
        $this->kraj = $kraj;
        return $this;
    }

    public function setDogodek(\Koledar\Entity\Dogodek $dogodek=null)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

    public function setPredstave($predstave)
    {
        $this->predstave = $predstave;
        return $this;
    }

    public function setDrzava(\App\Entity\Drzava $drzava=null)
    {
        $this->drzava = $drzava;
        return $this;
    }

}
