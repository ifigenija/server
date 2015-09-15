<?php

namespace Koledar\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta za naslove
 *
 * @ORM\Entity(repositoryClass="Koledar\Repository\Vaje")
 * @Max\I18n(label="Vaja",plural="Vaje")
 * @Max\Id(prefix="0032")
 *  */
class Vaja
        extends \Max\Entity\Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID poštnega naslova")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="Vrsta vaje", description="Vrsta vaje")
     * @Max\Ui(type="optionalselect", opts="koledar.vrstaVaje", empty="Izberi vrsto vaje")
     * @var string
     */
    protected $vrsta;

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
     * @ORM\OneToOne(targetEntity="Koledar\Entity\Dogodek", mappedBy="vaja", cascade={"persist"})
     * @Max\I18n(label="Dogodek",  description="Dogodek")
     * @Max\Ui(type="toone")
     * @var \Koledar\Entity\Dogodek
     */
    protected $dogodek;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="vaje")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     * @Max\I18n(label="Uprizoritev",  description="Uprizoritve")
     * @Max\Ui(type="hiddenid", required=true)
     * @var \Produkcija\Entity\Uprizoritev
     */
    protected $uprizoritev;

    public function validate($mode = 'update')
    {
        $this->expect($this->uprizoritev, "Vaja mora biti vezana na uprizoritev", 1000471);
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
        } else if ($zacetek && $this->dogodek) {
            $this->dogodek->setZacetek($zacetek);
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
        if($konec && $this->dogodek){
            $this->dogodek->setKonec($konec);
        }else if(!$konec && $this->dogodek){
            $konec = clone $this->dogodek->getZacetek();
            $konec->add(new \DateInterval('PT4H'));
            $this->dogodek->setKonec($konec);
        }
        
        return $this;
    }

    /**
     * dodaj dogodek
     */
    public function dodajDogodek()
    {
        $this->dogodek = new Dogodek();
        $this->dogodek->setVaja($this);
        $this->dogodek->setRazred(Dogodek::VAJA);
        
        $naslov = $this->getUprizoritev()->getNaslov();
        $zap = $this->zaporedna;
        $this->dogodek->setTitle($naslov. ' vaja ' .$zap);
    }

    /**
     * začasna rešitev
     * @return type
     */
    public function getZacetek()
    {
        if ($this->dogodek) {
            return $this->getDogodek()->getZacetek()->format('d.m.Y H:m');
        }
        return null;
    }

    public function getKonec()
    {
        if ($this->dogodek) {
            return $this->getDogodek()->getKonec()->format('d-m-Y H:m');
        }
        return null;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getZaporedna()
    {
        return $this->zaporedna;
    }

    public function getPorocilo()
    {
        return $this->porocilo;
    }

    public function getDogodek()
    {
        return $this->dogodek;
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

    public function setZaporedna($zaporedna)
    {
        $this->zaporedna = $zaporedna;
        return $this;
    }

    public function setPorocilo($porocilo)
    {
        $this->porocilo = $porocilo;
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

}
