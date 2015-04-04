<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Rekviziterstvo
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $namenUporabe;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $opisPostavitve;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Rekvizit", inversedBy="rekviziterstvo")
     * @ORM\JoinColumn(name="rekvizit_id", referencedColumnName="id")
     */
    private $rekvizit;

    /**
     * @ORM\ManyToOne(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="rekviziti")
     * @ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id")
     */
    private $uprizoritev;
}