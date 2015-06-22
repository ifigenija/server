<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiPonovitevPremiere")
 * @Max\Id(prefix="0048")
 */
class ProgramPonovitevPremiere
        extends \ProgramDela\Entity\EnotaPrograma
{

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="ponovitvePremiere")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programPonovitevPremiere.dokument",  description="Dokument")
     * @Max\Ui(type="hidden")
     * @var \ProgramDela\Entity\ProgramDela
     */
    private $dokument;

    public function validate($mode = 'update')
    {
        if ($this->getDokument()) {
            // preveriti, ali že obstaja program pon. prem. z isto uprizoritvijo
            $obstaja = true;  //init
            if ($this->getDokument()->getPonovitvePremiere()) {
                $obstaja = $this->getDokument()
                        ->getPonovitvePremiere()
                        ->exists(function($key, $ponovitvePremiere) {
                    return $ponovitvePremiere->getUprizoritev() == $this->getUprizoritev();     //vrne true, če obstaja program pon. prem. z isto uprizoritvijo
                });
                $this->expect(!$obstaja, "Program premiere z isto uprizoritvijo že obstaja v programu dela", 1000450);
            }
        }
        // neaktualna polja, ki jih tudi v formi ni:
        $this->setStZaposlenih(0);
        $this->setStDrugih(0);
        $this->setStHonorarnih(0);
        $this->setStHonorarnihIgr(0);
        $this->setStHonorarnihIgrTujJZ(0);
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
