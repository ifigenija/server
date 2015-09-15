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
        $this->dogodek->setPredstava($this);
        $this->dogodek->setRazred(Dogodek::PREDSTAVA);
        
        $naslov = $this->getUprizoritev()->getNaslov();
        $this->dogodek->setTitle($naslov. ' predstava');
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



}
