<?php
namespace Produkcija\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class Rekvizit
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
     * @ORM\Column(type="string", nullable=true)
     */
    private $vrsta;

    /**
     * @ORM\ManyToMany(targetEntity="Produkcija\Entity\Uprizoritev", inversedBy="rekvizit")
     * @ORM\JoinTable(
     *     name="Uprizoritev2Rekvizit",
     *     joinColumns={@ORM\JoinColumn(name="rekvizit_id", referencedColumnName="id", nullable=false)},
     *     inverseJoinColumns={@ORM\JoinColumn(name="uprizoritev_id", referencedColumnName="id", nullable=false)}
     * )
     */
    private $uprizoritev;
}