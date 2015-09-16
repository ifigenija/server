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
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Zaporedna št.", description="Zaporedna številka vaje")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $zaporedna;

    /**
     * 
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="Poročilo", description="Poročilo")
     * @var string
     */
    protected $porocilo;

    /**
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="predstava", cascade={"persist"})
     * @Max\I18n(label="Dogodek",  description="Dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    protected $dogodek;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="predstave")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     * @Max\I18n(label="Uprizoritev",  description="Uprizoritev")
     * @Max\Ui(type="hiddenid")
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

    public function validate($mode = 'update')
    {
        $this->expect($this->uprizoritev, "Predstava mora biti vezana na uprizoritev", 1000472);
    }

    /**
     * 
     * @param \DateTime $zacetek
     * @return \Koledar\Entity\Vaja
     */
    public function setZacetek(\DateTime $zacetek = null)
    {
        if ($zacetek && !$this->dogodek) {
            $this->dodajDogodek();
            $this->dogodek->setZacetek($zacetek);
            $this->dogodek->validate();
        } else if ($zacetek && $this->dogodek) {
            $this->dogodek->setZacetek($zacetek);
            $this->dogodek->validate();
        }
        return $this;
    }

    /**
     * 
     * @param \DateTime $konec
     * @return \Koledar\Entity\Vaja
     */
    public function setKonec(\DateTime $konec = null)
    {
        if ($konec && $this->dogodek) {
            $this->dogodek->setKonec($konec);
            $this->dogodek->validate();
        } else if (!$konec && $this->dogodek) {
            $konec = clone $this->dogodek->getZacetek();
            $konec->add(new \DateInterval('PT4H'));
            $this->dogodek->setKonec($konec);
            $this->dogodek->validate();
        }
        return $this;
    }

    /**
     * dodaj dogodek
     */
    public function dodajDogodek()
    {
        $this->dogodek = new Dogodek();
        $this->dogodek->setPredstava($this);
        $this->dogodek->setRazred(Dogodek::PREDSTAVA);

        $naslov = $this->getUprizoritev()->getNaslov();
        $zap    = $this->zaporedna;
        $this->dogodek->setTitle($naslov . ' predstava ' . $zap);
    }

    /**
     * začasna rešitev
     * @return type
     */
    public function getZacetek()
    {
        if ($this->dogodek) {
            return $this->getDogodek()->getZacetek();
        }
        return null;
    }

    public function getKonec()
    {
        if ($this->dogodek) {
            return $this->getDogodek()->getKonec();
        }
        return null;
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

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setDogodek(\Koledar\Entity\Dogodek $dogodek = null)
    {
        $this->dogodek = $dogodek;
        return $this;
    }

    public function setUprizoritev(\Produkcija\Entity\Uprizoritev $uprizoritev = null)
    {
        $this->uprizoritev = $uprizoritev;
        return $this;
    }

    public function setGostovanje(\Koledar\Entity\Gostovanje $gostovanje = null)
    {
        $this->gostovanje = $gostovanje;
        return $this;
    }

    public function getZaporedna()
    {
        return $this->zaporedna;
    }

    public function setZaporedna($zaporedna)
    {
        $this->zaporedna = $zaporedna;
        return $this;
    }

    public function getPorocilo()
    {
        return $this->porocilo;
    }

    public function setPorocilo($porocilo)
    {
        $this->porocilo = $porocilo;
        return $this;
    }

}
