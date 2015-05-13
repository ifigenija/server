<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="Koledar\Repository\Gostovanja")
 * @Max\I18n(label="Gostovanje",plural="Gostovanja")
 * @Max\Id(prefix="0028")
 */
class Gostovanje
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID gostovanja")
     * @Max\Ui(type="id")
     * @var string
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Vrsta", description="Vrsta gostovanja")
     * @var string
     */
    private $vrsta;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="gostovanje")
     * @Max\I18n(label="Dogodek",  description="Dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    private $dogodek;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Predstava", mappedBy="gostovanje")
     * @var <Predstave>
     */
    private $predstave;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Drzava")
     * @ORM\JoinColumn(name="drzava_id", referencedColumnName="id", nullable=false)
     * @Max\I18n(label="Država",  description="Država")
     * @Max\Ui(type="toone")
     * @var \App\Entity\Drzava
     */
    private $drzava;

    public function validate($mode = 'update')
    {
        
    }
    public function getId()
    {
        return $this->id;
    }

    public function getVrsta()
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

    public function setDogodek(\Koledar\Entity\Dogodek $dogodek)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

    public function setPredstave($predstave)
    {
        $this->predstave = $predstave;
        return $this;
    }

    public function setDrzava(\App\Entity\Drzava $drzava)
    {
        $this->drzava = $drzava;
        return $this;
    }


}
