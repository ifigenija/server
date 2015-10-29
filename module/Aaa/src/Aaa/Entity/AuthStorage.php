<?php

/**
 * (copyleft) Licenca
 */

namespace Aaa\Entity;

use Max\Ann\Entity as Max;
use Doctrine\ORM\Mapping as ORM;

/**
 * Storage za avtenticirane seje.
 *
 * @author Boris Lašič <boris@max.si>
 * Ustvarjeno: 27.20.2015
 *
 * @ORM\Entity
 * 
 */
class AuthStorage
{

    /**
     * Id spremembe

     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @Max\Ui(type="integer")
     * @var integer
     */
    protected $id;

    /**
     * Razred objekta, ki je bil spremenjen
     * @ORM\Column(length=100)
     * @var string
     */
    protected $sessionId;

    /**
     * Uporabnik ki je spremenil objekt
     *
     * @ORM\Column(type="guid")
     * @var string
     */
    protected $upor;

    /**
     * lifetime
     * @ORM\Column(type="datetime", nullable=false)
     * @var DateTime
     */
    protected $datum;


    /**
     *
     * @ORM\Column(length=255)
     * @var string
     */
    protected $ip;


    /**
     * @ORM\Column(type="boolean",options={"default":false})
     * @var boolean
     */
    protected $deleted = false;
}
