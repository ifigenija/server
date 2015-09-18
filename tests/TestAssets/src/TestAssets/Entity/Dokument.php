<?php
/**
 * Created by PhpStorm.
 * User: boris
 * Date: 17. 09. 15
 * Time: 19.23
 */

namespace TestAssets\Entity;

use Doctrine\ORM\Mapping as ORM;
/**
 * Class Dokument
 *
 * @package TestAssets\Entity
 * @ORM\Entity(repositoryClass="\TestAssets\Repository\Dokumenti")
 * @ORM\Table(name="dokument")
 */
class Dokument
{

    /**
     * @ORM\Column
     * @ORM\Id
     */
    protected $id;

    /**
     * @ORM\Column()
     * @var string
     */
    protected $stevilka;

    /**
     * @ORM\Column()
     * @var string
     */
    protected $sifra;
    /**
     * @ORM\Column()
     * @var string
     */
    protected $naziv;

    /**
     * @ORM\Column()
     * @var float
     */
    protected $znesek;

    /**
     * @ORM\OneToMany(targetEntity="Pozicija", mappedBy="dokument")
     * @var arra
     */
    protected $pozicije;
    /**
     * @return string
     */
    public function getStevilka()
    {
        return $this->stevilka;
    }

    /**
     * @return string
     */
    public function getNaziv()
    {
        return $this->naziv;
    }

    /**
     * @param string $naziv
     * @return Dokument
     */
    public function setNaziv($naziv)
    {
        $this->naziv = $naziv;
        return $this;
    }


    /**
     * @param string $stevilka
     * @return Dokument
     */
    public function setStevilka($stevilka)
    {
        $this->stevilka = $stevilka;
        return $this;
    }

    /**
     * @return string
     */
    public function getSifra()
    {
        return $this->sifra;
    }

    /**
     * @param string $sifra
     * @return Dokument
     */
    public function setSifra($sifra)
    {
        $this->sifra = $sifra;
        return $this;
    }



}