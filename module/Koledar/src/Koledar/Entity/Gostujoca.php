<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * Entiteta za naslove
 *
 * @ORM\Entity(repositoryClass="Koledar\Repository\Gostujoce")
 * @Max\I18n(label="Gostujoca",plural="Gostujoce")
 * @Max\Id(prefix="0029")
 */
class Gostujoca
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID gostujoče predstave")
     * @Max\Ui(type="id")
     * @var string */
    protected $id;

    /**
     * @ORM\OneToMany(targetEntity="Koledar\Entity\Predstava", mappedBy="gostujoca")
     * @var <Predstave>
     */
    protected $predstave;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="gostujoce")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     * @Max\I18n(label="Uprizoritev",  description="Uprizoritev")
     * @Max\Ui(type="toone")
     * @var \Produkcija\Entity\Uprizoritev
     */
    protected $uprizoritev;

    public function __construct()
    {
        $this->predstave = new ArrayCollection();
    }

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getPredstave()
    {
        return $this->predstave;
    }

    public function getUprizoritev()
    {
        return $this->uprizoritev;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setPredstave($predstave)
    {
        $this->predstave = $predstave;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

}
