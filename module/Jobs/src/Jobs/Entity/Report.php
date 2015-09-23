<?php

namespace Jobs\Entity;

use Aaa\Entity\User;
use Doctrine\ORM\Mapping as ORM;
use Max\Ann\Entity as Max;
use Max\Entity\Base;
use Max\Exception\MaxException;
use Zend\Filter\Word\SeparatorToSeparator;

/**
 * Entiteta Datoteke
 *
 * @ORM\Entity(repositoryClass="Jobs\Repository\Reports")
 * @Max\I18n(label="Poročilo",plural="Poročila")
 * @Max\Lookup(search={"identifier", "filename"}, ident="identifier",label="title")
 * @Max\Id(prefix="00fe")
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
     * @var Job
     * @ORM\ManyToOne(targetEntity="Job", inversedBy="reports")
     */
    protected $job;
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

    /**
     * Vrne privzeti root upload direktorija
     *
     * @param $hash
     * @return string
     * @throws MaxException
     * @todo - zagotovi možnost določitve upload direktorija v konfigu
     */
    public function getUploadDirectory($hash= '')
    {
        $dir = 'data/reports';

        if (!is_dir($dir)) {
            throw new MaxException('Reports direktorij ne obstaja', 7700602);
        }

        if (!is_writable($dir)) {
            throw new MaxException("Upload direktorij $dir ni zapisljiv", '0114');
        }

        if ($hash === '') {
            $hash = $this->hash;
        }

        for ($ii = 1; $ii <= 4; $ii++) {
            $dir .= '/' . substr($hash, $ii - 1, 1);
        }

        return $dir;
    }


    /**
     * Kreira folder za uploadano datoteko in vrne destination filename za uploadano datoteko
     *
     * @param string $hash
     * @return string polni file name kamor se shrani datoteka
     * @throws MaxException
     */
    public function zagotoviFolder($hash)
    {
        $dir = $this->getUploadDirectory($hash);

        if (!is_dir($dir)) {
            $success = mkdir($dir, 02775, true);
            if (!$success) {
                throw new MaxException("Ne morem ustvariti direktorija $dir", 7700603);
            }
        } else {
            if (!is_writable($dir)) {
                throw new MaxException("Direktorij $dir ni zapisljiv", 7700604);
            }
        }

        return $this->getFileName($hash);
    }


    /**
     * Preveri ali obstaja katera druga datoteka z istim hashom
     *
     * @param string $hash
     * @param int $size
     * @return bool
     * @throws MaxException
     */
    public function checkSameFileExists($hash, $size = 0)
    {
        $filename = $this->getFileName($hash);
        if (file_exists($filename)) {
            $stat = stat($filename);
            if ($stat['size'] !== $size) {
                throw new MaxException("Isti hash, različna velikost... h: $hash " . $this->getTitle(), 7700605);
            }
        }
    }

    /**
     * Prebere datoteko
     *
     * @return stirng
     */
    public function readContent()
    {
        // TODO preveriti velikost datoteke
        $filename = $this->getFileName($this->hash);
        if (file_exists($filename)) {
            return file_get_contents($filename);
        }
        return '';
    }
    /**
     * Vrne filename za datoteko z znanim hashom
     *
     * @param string $hash
     * @return string
     */
    public function getFileName($hash = '')
    {
        if ($hash === '') {
            $hash = $this->hash;
        }
        $f    = new SeparatorToSeparator('-', '');
        $hash = $f->filter($hash);
        $dir  = $this->getUploadDirectory($hash);
        return $dir . '/' . $hash;
    }

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

    /**
     * @return Job
     */
    public function getJob()
    {
        return $this->job;
    }

    /**
     * @param Job $job
     * @return Report
     */
    public function setJob($job)
    {
        $this->job = $job;
        return $this;
    }





}
