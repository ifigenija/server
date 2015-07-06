<?php

namespace ProgramDela\Entity;

use Doctrine\ORM\Mapping as ORM,
    Max\Ann\Entity as Max;

/**
 * @ORM\Entity(repositoryClass="ProgramDela\Repository\ProgramiGostujoca")
 * @Max\Id(prefix="0042")
 */
class ProgramGostujoca
        extends \ProgramDela\Entity\EnotaPrograma
{

    /**
     * @ORM\ManyToOne(targetEntity="ProgramDela\Entity\ProgramDela", inversedBy="gostujoci")
     * @ORM\JoinColumn(name="program_dela_id", referencedColumnName="id")
     * @Max\I18n(label="programGostujoca.dokument",  description="Dokument")
     * @Max\Ui(type="hiddenid")
     * @var \ProgramDela\Entity\ProgramDela
     */
    private $dokument;

    public function preracunaj($smer = false)
    {
        // neaktualna polja, ki tudi v formi niso:
        $this->setCelotnaVrednostMat(0);
        $this->setCelotnaVrednostGostovSZ(0);
        $this->setAvtorskiHonorarji(0);
        $this->setTantieme(0);
        $this->setObiskGost(0);
        $this->setObiskZamejo(0);
        $this->setObiskInt(0);
        $this->setPonoviZamejo(0);
        $this->setPonoviGost(0);
        $this->setPonoviInt(0);
        $this->setVlozekGostitelja(0);
        $this->setVlozekKoproducenta(0);
        $this->setStZaposlenih(0);
        $this->setStZaposUmet(0);
        $this->setStZaposDrug(0);
        $this->setStHonorarnih(0);
        $this->setStHonorarnihIgr(0);
        $this->setStHonorarnihIgrTujJZ(0);
        $this->setNaziv("");        // dobimo iz uprizoritve

        parent::preracunaj($smer);
        if ($smer == \Max\Consts::UP) {
            if ($this->getDokument()) {
                $this->getDokument()->preracunaj(\Max\Consts::UP);
            }
        }
    }

    public function validate($mode = 'update')
    {
        if ($this->getDokument()) {
            // preveriti, ali že obstaja programgostujoča z isto uprizoritvijo
            $obstaja = true;  //init
            if (!$this->getDokument()->getGostujoci()->isEmpty()) {
                $id      = $this->getId();
                $obstaja = $this->getDokument()
                        ->getGostujoci()
                        ->exists(function($key, $progGostujoca) use(&$id) {
                    return ($progGostujoca->getUprizoritev() == $this->getUprizoritev()) && ($progGostujoca->getId() !== $id);     //vrne true, če obstaja drug programGostujoča z isto uprizoritvijo
                });
                $this->expect(!$obstaja, "Program gostujoča z isto uprizoritvijo že obstaja v programu dela", 1000430);
            }
        }
        $this->expect(!($this->getTipProgramskeEnote()), "Tip programske enote obstaja, a ne sme obstajati za gostujočo", 1000431);


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
