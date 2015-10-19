<?php

/**
 * Created by PhpStorm.
 * User: boris
 * Date: 28. 09. 15
 * Time: 19.32
 */

namespace Koledar\Entity;

/**
 * Proxy metode med posameznimi vrstami dogodkov in dogodkom.
 *
 * S tem se bo lahko večina atributov urejala na vrsti dogodka
 *
 * @package Koledar\Entity
 */
trait DogodekTrait
{

    /**
     *
     * @param \DateTime $zacetek
     * @return self
     */
    public function setZacetek(\DateTime $zacetek = null)
    {
        if (!$zacetek) {
            return $this;
        }
        if (!$this->dogodek) {
            $this->dodajDogodek();
        }
        $this->dogodek->setZacetek($zacetek);

        return $this;
    }

    /**
     *
     * @param string $title
     * @return self
     */
    public function setTitle($title = null)
    {
        if (!$this->dogodek) {
            $this->dodajDogodek();
        }
        $this->dogodek->setTitle($title);
        return $this;
    }

    /**
     * @return string
     */
    public function getTitle()
    {
        if ($this->dogodek) {
            return $this->getDogodek()->getTitle();
        }
        return null;
    }

    /**
     *
     * @return self
     */
    public function setProstor($prostor = null)
    {
        if (!$this->dogodek) {
            $this->dodajDogodek();
        }
        $this->dogodek->setProstor($prostor);
        return $this;
    }

    /**
     * @return string
     */
    public function getProstor()
    {
        if ($this->dogodek) {
            return $this->dogodek->getProstor();
        }
        return null;
    }

    /**
     *
     * @param string $status
     * @return self
     */
    public function setStatus($status)
    {
        if (!$this->dogodek) {
            $this->dodajDogodek();
        }
        $this->dogodek->setStatus($status);
        return $this;
    }

    /**
     * @return string
     */
    public function getStatus()
    {
        if ($this->dogodek) {
            return $this->getDogodek()->getStatus();
        }
        return null;
    }

    /**
     *
     * @param \DateTime $konec
     * @return \Koledar\Entity\Vaja
     */
    public function setKonec(\DateTime $konec = null)
    {
        if (!$this->dogodek) {
            $this->dodajDogodek();
        }
        $this->dogodek->setKonec($konec);
        return $this;
    }

    public function getZacetek()
    {
        if ($this->dogodek) {
            return $this->getDogodek()->getZacetek();
        }
        return null;
    }

    public function getKonec()
    {
        if ($this->dogodek) {
            return $this->getDogodek()->getKonec();
        }
        return null;
    }

    /**
     *
     * @return self
     */
    public function setSezona($sezona = null)
    {
        if (!$this->dogodek) {
            $this->dodajDogodek();
        }
        $this->dogodek->setSezona($sezona);
        return $this;
    }

    /**
     * @return string
     */
    public function getSezona()
    {
        if ($this->dogodek) {
            return $this->dogodek->getSezona();
        }
        return null;
    }

    abstract function dodajDogodek();
}
