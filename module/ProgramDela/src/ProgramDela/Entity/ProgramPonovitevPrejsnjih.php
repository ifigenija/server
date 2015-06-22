<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiPonovitevPrejsnjih")
 * @Max\Id(prefix="0048")
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
                $obstaja = $this->getDokument()
                        ->getPonovitvePrejsnjih()
                        ->exists(function($key, $ponovitvePrejsnjih) {
                    return $ponovitvePrejsnjih->getUprizoritev() == $this->getUprizoritev();     //vrne true, če obstaja program pon. pr. z isto uprizoritvijo
                });
                $this->expect(!$obstaja, "Program premiere z isto uprizoritvijo že obstaja v programu dela", 1000460);
            }
        }
        $this->setNaziv("");        // dobimo iz uprizoritve

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
