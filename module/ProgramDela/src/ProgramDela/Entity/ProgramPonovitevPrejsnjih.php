<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiPonovitevPrejsnjih")
 * @Max\Id(prefix="0050")
 */
class ProgramPonovitevPrejsnjih
        extends \ProgramDela\Entity\EnotaPrograma
{

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="ponovitvePrejsnjih")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programPonovitevPrejsnjih.dokument",  description="Dokument")
     * @Max\Ui(type="hidden")
     * @var \ProgramDela\Entity\ProgramDela
     */
    private $dokument;

    public function validate($mode = 'update')
    {
        if ($this->getDokument()) {
            // preveriti, ali že obstaja program pon. prejšnjih z isto uprizoritvijo
            $obstaja = true;  //init
            if ($this->getDokument()->getPonovitvePrejsnjih()) {
                $id      = $this->getId();
                $obstaja = $this->getDokument()
                        ->getPonovitvePrejsnjih()
                        ->exists(function($key, $ponovitvePrejsnjih) use(&$id) {
                    return ($ponovitvePrejsnjih->getUprizoritev() == $this->getUprizoritev()) && ($ponovitvePrejsnjih->getId() !== $id);     //vrne true, če obstaja drug program pon. pr. z isto uprizoritvijo
                });
                $this->expect(!$obstaja, "Program premiere z isto uprizoritvijo že obstaja v programu dela", 1000460);
            }
        }
        $this->setNaziv("");        // dobimo iz uprizoritve
        $this->setPonoviInt(0);
        $this->setObiskInt(0);

        parent::validate();
    }

    public function getDokument()
    {
        return $this->dokument;
    }

    public function setDokument(\ProgramDela\Entity\ProgramDela $dokument)
    {
        $this->dokument = $dokument;
        return $this;
    }

}
