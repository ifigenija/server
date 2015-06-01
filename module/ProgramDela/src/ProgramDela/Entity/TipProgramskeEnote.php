<?php
namespace ProgramDela\Entity;
use Doctrine\ORM\Mapping AS ORM;

/**
 * @ORM\Entity
 */
class TipProgramskeEnote
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\Column(type="string", nullable=false)
     */
    private $sifra;

    /**
     * @ORM\Column(type="string", nullable=false)
     */
    private $naziv;

    /**
     * @ORM\Column(type="boolean", nullable=false, options={"default":false})
     */
    private $koprodukcija;

    /**
     * @ORM\Column(type="decimal", nullable=false, options={"default":1})
     */
    private $maxFaktor;

    /**
     * @ORM\Column(type="decimal", nullable=false, options={"default":0})
     */
    private $maxVsi;

    /**
     * @ORM\OneToMany(targetEntity="ProgramDela\Entity\EnotaPrograma", mappedBy="tipProgramskeEnote")
     */
    private $enotaPrograma;
}