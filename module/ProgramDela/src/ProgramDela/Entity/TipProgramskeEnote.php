<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\TipiProgramskeEnote")
 * @Max\Lookup
 * @Max\I18n(label="Tip programske enote",plural="Tipi programske enote")
 * @Max\Id(prefix="0043") 
 */
class TipProgramskeEnote
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
    private $id;

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="tipProgramskeEnote.sifra", description="Šifra tipa programske enote")
     * @Max\Ui(type="sifra",ident=true )
     * @var string    
     */
    private $sifra;

    /**
     * @ORM\Column(type="string", nullable=false)
     * @Max\I18n(label="tipProgramskeEnote.naziv", description="Naziv tipa programske enote")
     * @Max\Ui(type="naziv")
     * @var string */
    private $naziv;

    /**
     * @ORM\Column(type="boolean", nullable=false, options={"default":false})
     * @Max\I18n(label="tipProgramskeEnote.koprodukcija", description="Ali je koprodukcija?")
     * @Max\Ui(type="boolcheckbox")
     * @var boolean
     */
    private $koprodukcija;

    /**
     * @ORM\Column(type="decimal", nullable=false, options={"default":1}, precision=15, scale=2)
     * @Max\I18n(label="tipProgramskeEnote.maxFaktor", description="Maksimalni faktor")
     * @var double
     */
    private $maxFaktor;

    /**
     * @ORM\Column(type="decimal", nullable=false, options={"default":0}, precision=15, scale=2)
     * @Max\I18n(label="tipProgramskeEnote.maxVsi", description="Maksimalno vsi")
     * @var double
     */
    private $maxVsi;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\EnotaPrograma", mappedBy="tipProgramskeEnote")
     * @var <EnotePrograma>
     */
    private $enotePrograma;

    public function validate($mode = 'update')
    {
        
    }

    public function getId()
    {
        return $this->id;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function getKoprodukcija()
    {
        return $this->koprodukcija;
    }

    public function getMaxFaktor()
    {
        return $this->maxFaktor;
    }

    public function getMaxVsi()
    {
        return $this->maxVsi;
    }

    public function getEnotePrograma()
    {
        return $this->enotePrograma;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function setKoprodukcija($koprodukcija)
    {
        $this->koprodukcija = $koprodukcija;
        return $this;
    }

    public function setMaxFaktor($maxFaktor)
    {
        $this->maxFaktor = $maxFaktor;
        return $this;
    }

    public function setMaxVsi($maxVsi)
    {
        $this->maxVsi = $maxVsi;
        return $this;
    }

    public function setEnotePrograma($enotePrograma)
    {
        $this->enotePrograma = $enotePrograma;
        return $this;
    }


}
