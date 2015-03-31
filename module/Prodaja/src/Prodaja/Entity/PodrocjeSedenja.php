<?php
namespace Prodaja\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class PodrocjeSedenja
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=true)
     */
    private $ime;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $kapaciteta;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    private $templatePlaceholder;

    /**
     * @ORM\Column(type="string", length=10, nullable=true)
     */
    private $barva;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Vrsta", mappedBy="podrocjaSedenja")
     */
    private $vrsta;

    /**
     * @ORM\OneToMany(targetEntity="Prodaja\Entity\Sedez", mappedBy="podrocjaSedenja")
     */
    private $sedez;
}