<?php

namespace Jobs\Entity;

use Aaa\Entity\User;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;

/**
 * Entiteta Datoteke
 *
 * @ORM\Entity(repositoryClass="Jobs\Repository\Reports")
 * @Max\I18n(label="Poročilo",plural="Poročila")
 * @Max\Lookup(search={"identifier", "filename"}, ident="identifier",label="title")
 * @Max\Id(prefix="0055")
 */
class Report
    extends Base
{

    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue(strategy="NONE")
     * @Max\I18n(label="Id", description="ID datoteke")
     * @Max\Ui(type="id")
     * @var string
     *
     */
    protected $id;

    /**
     *
     * @var string
     * @ORM\Column(type="string")
     */
    protected $title;

    /**
     * @ORM\Column(length=255)
     * @Max\I18n(label="Ime dat.", description="Ime datoteke")
     * @var string
     */
    protected $filename;

    /**
     * Download Counter
     * @ORM\Column(type="integer")
     * @Max\I18n(label="Števec downloadov", description="Števec downloadov")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $transfers = 0;

    /**
     * File size
     * @ORM\Column(type="integer", nullable=true)
     * @Max\I18n(label="Velikost datoteke", description="Velikost datoteke")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $size = 0;

    /**
     * Tip datoteke
     * @ORM\Column(length=255, nullable=true)
     * @Max\I18n(label="Tip dat.", description="Tip datoteke")
     * @var string
     */
    protected $format;

    /**
     * MD5 hash vsebine datoteke za ugotavljanje duplikatov
     * @ORM\Column(type="guid", nullable=true)
     * @Max\I18n(label="Hash", description="Hash vsebine datoteke")
     * @Max\Ui(type="id")
     * @var string
     */
    protected $hash;

    /**
     *
     * @ORM\Column(type="datetime", nullable=true)
     * @var string
     */
    protected $createdAt;



    public function countTransfer()
    {
        $this->transfers = $this->transfers + 1;
    }

    function __toString()
    {
//        return $this->title ? : ($this->filename? : $this->id);
        return $this->filename? : $this->id;
    }

    /**
     * @return string
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param string $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return string
     */
    public function getFilename()
    {
        return $this->filename;
    }

    /**
     * @param string $filename
     */
    public function setFilename($filename)
    {
        $this->filename = $filename;
    }

    /**
     * @return int
     */
    public function getTransfers()
    {
        return $this->transfers;
    }

    /**
     * @param int $transfers
     */
    public function setTransfers($transfers)
    {
        $this->transfers = $transfers;
    }

    /**
     * @return int
     */
    public function getSize()
    {
        return $this->size;
    }

    /**
     * @param int $size
     */
    public function setSize($size)
    {
        $this->size = $size;
    }

    /**
     * @return string
     */
    public function getFormat()
    {
        return $this->format;
    }

    /**
     * @param string $format
     */
    public function setFormat($format)
    {
        $this->format = $format;
    }

    /**
     * @return string
     */
    public function getHash()
    {
        return $this->hash;
    }

    /**
     * @param string $hash
     */
    public function setHash($hash)
    {
        $this->hash = $hash;
    }

    /**
     * @return string
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * @param string $createdAt
     */
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;
    }

    /**
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @param string $title
     */
    public function setTitle($title)
    {
        $this->title = $title;
    }





}
