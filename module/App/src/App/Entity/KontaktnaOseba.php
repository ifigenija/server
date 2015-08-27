<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="App\Repository\KontaktneOsebe")
 * @Max\I18n(label="Kontaktna oseba",plural="Kontaktne osebe")
 * @Max\Id(prefix="0038")
 */
class KontaktnaOseba
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
     * Status kontaktne osebe
     * 
     *  AK-aktiven
     *  NA-neaktiven
     *
     * @ORM\Column(type="string", length=20, nullable=true)
     * @Max\I18n(label="kontaktna.status", description="kontaktna.d.status")
     * @Max\Ui(type="select",opts="kontaktnaoseba.status", required=true)
     * @var string

     */
    protected $status;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Max\I18n(label="kontaktna.funkcija", description="kontaktna.d.funkcija")
     * @Max\Ui(required=true)
     * @var string
     */
    protected $funkcija;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Max\I18n(label="kontaktna.opis", description="kontaktna.d.opis")
     * @var string     
     */
    protected $opis;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Popa", inversedBy="kontaktneOsebe")
     * @ORM\JoinColumn(name="popa_id", referencedColumnName="id")
     * @Max\I18n(label="kontaktna.popa",  description="kontaktna.d.popa")
     * @Max\Ui(type="hiddenid")
     * @var \App\Entity\Popa
     */
    protected $popa;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Oseba", inversedBy="kontaktneOsebe")
     * @ORM\JoinColumn(name="oseba_id", referencedColumnName="id")
     * @Max\I18n(label="kontaktna.oseba",  description="kontaktna.d.oseba")
     * @Max\Ui(type="toone", required=true)
     * @var \App\Entity\Oseba
     */
    protected $oseba;

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getFunkcija()
    {
        return $this->funkcija;
    }

    public function getOpis()
    {
        return $this->opis;
    }

    public function getPopa()
    {
        return $this->popa;
    }

    public function getOseba()
    {
        return $this->oseba;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setStatus($status)
    {
        $this->status = $status;
        return $this;
    }

    public function setFunkcija($funkcija)
    {
        $this->funkcija = $funkcija;
        return $this;
    }

    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

    public function setPopa(\App\Entity\Popa $popa=null)
    {
        $this->popa = $popa;
        return $this;
    }

    public function setOseba(\App\Entity\Oseba $oseba=null)
    {
        $this->oseba = $oseba;
        return $this;
    }

}
