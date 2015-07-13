<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

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
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="predstava")
     * @Max\I18n(label="Dogodek",  description="Dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    protected $dogodek;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="predstave")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     * @Max\I18n(label="Uprizoritev",  description="Uprizoritev")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Uprizoritev
     */
    protected $uprizoritev;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Gostovanje", inversedBy="predstave")
     * @ORM\JoinColumn(name="gostovanje_id", referencedColumnName="id")
     * @Max\I18n(label="Gostovanje",  description="Gostovanje")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Gostovanje
     */
    protected $gostovanje;

    /**
     * @ORM\ManyToOne(targetEntity="Koledar\Entity\Gostujoca", inversedBy="predstave")
     * @ORM\JoinColumn(name="gostujoc_id", referencedColumnName="id")
     * @Max\I18n(label="Gostujoča",  description="Gostujoča")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Gostujoca
     */
    protected $gostujoca;

    public function validate($mode = 'update')
    {
    }
    public function getId()
    {
        return $this->id;
    }

    public function getDogodek()
    {
        return $this->dogodek;
    }

    public function getUprizoritev()
    {
        return $this->uprizoritev;
    }

    public function getGostovanje()
    {
        return $this->gostovanje;
    }

    public function getGostujoca()
    {
        return $this->gostujoca;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setDogodek(\Koledar\Entity\Dogodek $dogodek)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

    public function setGostovanje(\Koledar\Entity\Gostovanje $gostovanje)
    {
        $this->gostovanje = $gostovanje;
        return $this;
    }

    public function setGostujoca(\Koledar\Entity\Gostujoca $gostujoca)
    {
        $this->gostujoca = $gostujoca;
        return $this;
    }

    
    
}
