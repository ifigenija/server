<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * Entiteta za pošte
 *
 *
 * @ORM\Entity
 * @Max\I18n(label="Pošta",plural="Pošte")
 */
class Posta
        
{

    /**
     * ID pošte
     *
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @var string
     */
    protected $id;

    /**
     * Šifra pošte
     *
     * @ORM\Column(length=20, nullable=true)
     * @var string
     * @Max\Ui(type="sifra")
     * @Max\I18n(label="Poštna številka", description="Poštna številka")
     */
    protected $sifra;

    /**
     * Naziv pošte
     *
     * @ORM\Column(length=40, nullable=true)
     * @var string
     *
     * @Max\I18n(label="Naziv",description="Naziv")
     */
    protected $naziv;

    /**
     * Interno polje - uporabnik, ki je zadnji spreminjal entiteto
     * To polje se ne vnaša. Uporabnika dobimo iz prijave v aplikacijo.
     *
     *  
     */
    protected $upor;

    /**
     * Interno polje - datum in ura zadnjega spreminjanja entitete
     * To polje se ne vnaša. Podatek vzamemo iz tekočega datuma in ure.
     *
     * 
     * @var string
     */
    protected $datKnj;

    public function getMeta()
    {
        $meta = new \stdClass();
        $meta->label = 'Pošta';
        $meta->mlabel = 'Pošte';
        $meta->ident = 'sifra';
        $meta->search = 'sifra,naziv';
        $meta->description = 'Pomožni seznam pošt';

        return $meta;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    public function getSifra()
    {
        return $this->sifra;
    }

    public function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }

    public function getNaziv()
    {
        return $this->naziv;
    }

    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }

    public function getUpor()
    {
        return $this->upor;
    }

    public function setUpor($upor)
    {
        $this->upor = $upor;
        return $this;
    }

    public function getDatKnj()
    {
        return $this->datKnj;
    }

    public function setDatKnj($datKnj)
    {
        $this->datKnj = $datKnj;
        return $this;
    }

}

