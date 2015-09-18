<?php
/**
 * Created by PhpStorm.
 * User: boris
 * Date: 17. 09. 15
 * Time: 19.42
 */

namespace TestAssets\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="\TestAssets\Repository\Pozicije")
 * @package TestAssets\Entity
 */
class Pozicija
{


    /**
     * @ORM\Column
     * @ORM\Id
     */
    protected $id;


    /**
     * @ORM\Column(type="decimal", precision=12,scale=4)
     * @var float
     */
    protected $znesek;

    /**
     * @ORM\Column()
     * @var string
     */
    protected $opis;

    /**
     * @ORM\Column(type="integer")
     * @var integer
     */
    protected $zaporedna;

    /**
          * @ORM\Column(type="date")
     * @var \DateTime
     */
    protected $datum;

    /**
     * @ORM\ManyToOne(targetEntity="Dokument", inversedBy="pozicije")
     * @var Dokument
     */
    protected $dokument;

    /**
     * @return float
     */
    public function getZnesek()
    {
        return $this->znesek;
    }

    /**
     * @return Dokument
     */
    public function getDokument()
    {
        return $this->dokument;
    }

    /**
     * @param Dokument $dokument
     * @return Pozicija
     */
    public function setDokument($dokument)
    {
        $this->dokument = $dokument;
        return $this;
    }

    /**
     * @param float $znesek
     * @return Pozicija
     */
    public function setZnesek($znesek)
    {
        $this->znesek = $znesek;
        return $this;
    }

    /**
     * @return string
     */
    public function getOpis()
    {
        return $this->opis;
    }

    /**
     * @return int
     */
    public function getZaporedna()
    {
        return $this->zaporedna;
    }

    /**
     * @param int $zaporedna
     */
    public function setZaporedna($zaporedna)
    {
        $this->zaporedna = $zaporedna;
    }

    /**
     * @param string $opis
     * @return Pozicija
     */
    public function setOpis($opis)
    {
        $this->opis = $opis;
        return $this;
    }

    /**
     * @return \DateTime
     */
    public function getDatum()
    {
        return $this->datum;
    }

    /**
     * @param \DateTime $datum
     * @return Pozicija
     */
    public function setDatum($datum)
    {
        $this->datum = $datum;
        return $this;
    }


}