<?php

/**
 * (copyleft) Licenca
 */

namespace Aaa\Entity;

use Max\Annotation\Entity as Max;
use Doctrine\ORM\Mapping as ORM;

/**
 * Revizijska sled.
 *
 * @author Boris Lašič <boris@max.si>
 * Ustvarjeno: 18.4.2013
 *
 * @ORM\Entity(repositoryClass="Aaa\Repository\Revizije")
 * 
 * @ORM\Table(name="revizije")
 */
class Revizija
{

    /**
     * Id spremembe
     *
     * Id je INT ker nam je pomemben vrstni red revizij
     *
     * strategy="IDENTITY" zato ker "AUTO" pri Postgresu zahteva klic funkcije
     * nextval() ki zahteva ključ zaporedja. Ta ključ nam ni znan saj ga
     * Doctrine avtomatsko generira, revizije pa vstavljamo brez Doctrina.
     *
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @var int
     */
    protected $id;

    /**
     * Razred objekta, ki je bil spremenjen
     * @ORM\Column(length=100, nullable=true)
     * @var string
     */
    protected $razred;

    /**
     * ID objekta nad katerim se je zgodila sprememba
     * @ORM\Column(type="integer", nullable=true)
     * @var string
     */
    protected $objectId;

    /**
     * Uporabnik ki je spremenil objekt
     *
     * @ORM\Column(type="integer", nullable=true)
     * @var string
     */
    protected $upor;

    /**
     * Čas spremembe
     * @ORM\Column(type="datetime", nullable=true)
     * @var DateTime
     */
    protected $datum;

    /**
     * Max spremembe: upd, ins, del
     *
     * @ORM\Column(length=3, nullable=true)
     * @var type
     */
    protected $tip;

    /**
     * serializirana nova vrednost objekta
     *
     * @ORM\Column(type="text", nullable=true)
     * @var string
     */
    protected $data;

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function getRazred()
    {
        return $this->razred;
    }

    public function setRazred($razred)
    {
        $this->razred = $razred;
    }

    public function getObjectId()
    {
        return $this->objectId;
    }

    public function setObjectId($objectId)
    {
        $this->objectId = $objectId;
    }

    public function getUpor()
    {
        return $this->upor;
    }

    public function setUpor($upor)
    {
        $this->upor = $upor;
    }

    public function getDatum()
    {
        return $this->datum;
    }

    public function setDatum(\DateTime $datum)
    {
        $this->datum = $datum;
    }

    public function getMax()
    {
        return $this->tip;
    }

    public function setMax($tip)
    {
        $this->tip = $tip;
    }

    public function getData()
    {
        return unserialize($this->data);
    }

    public function setData($data)
    {
        $this->data = serialize($data);
    }

}
