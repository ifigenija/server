<?php

namespace ProgramDela\Task;

use Jobs\Task\AbstractPrinterTask;
use Max\Exception\MaxException;
use ProgramDela\Entity\ProgramDela;
use Jobs\Annotation\Task as Task;

/**
 * Task za izpis reporta dobavnice
 *
 *  @Task\Meta(name="Program dela", acl="ProgramDela-write")
 */
class ProgramDelaReport
        extends AbstractPrinterTask
{
    /**
     *
     * @var ProgramDela
     */
    protected $entity;
    
    public function taskBody()
    {
        $ps = $this->getServiceLocator()->get('mpdf.printer');

        $mainTitle   = "Program dela " . $this->entity->getSifra();
        $prgdela = $this->entity;

        $printer = $ps->getMPdf();

        // Splošno za program dela - nastavim header in footer + zavihek 'splošno' iz vnosne forme
        $this->addDocumentReport('program-dela', $title, $this->entity);

        // Premiere
        $this->reportSklopPrograma($printer, $prgdela->premiere, 'premiera', 'Premiere');
        // Ponovitve premier
        $this->reportSklopPrograma($printer, $prgdela->ponovitvePremiere , 'ponovitve-premier', 'Ponovitve premiernih uprizoritev');
        // Ponovitve prejšnjih
        $this->reportSklopPrograma($printer, $prgdela->ponovitvePrejsnjih , 'ponovitve-prejsnjih', 'Ponovitve uprizoritev iz prejšnjih sezon');
        // Gostujoče
        $this->reportSklopPrograma($printer, $prgdela->gostujoci, 'gostujoce', 'Gostujoče uprizoritve – iz Slovenije, zamejstva in tujine');
        // Mednarodna gostovanja
        $this->reportSklopPrograma($printer, $prgdela->gostovanja, 'mednarodna', 'Mednarodna gostovanja – gostovanja javnega zavoda v tujini ');
        // Festivali 
        $this->reportSklopPrograma($printer, $prgdela->programiFestival, 'festivali', 'Festivali');
        // Razno
        $this->reportSklopPrograma($printer, $prgdela->programiRazno, 'razno', 'Razno');
        // Izjemni dogodki
//        $this->reportSklopPrograma($printer, $prgdela->izjemni, 'izjemni', 'Izjemni dogodki');

        $this->finishReport($title);
    }

    /**
     * Izpis posameznega sklopa programa dela
     * 
     * @param object $printer   tiskalnik (mPdf) 
     * @param object $sklopi    objekt sklopa programa dela (premiere. ponovitve, festivali...)
     * @param string $tmpl      ime predloge
     * @param string $naslov    naslov reporta
     */
    public function reportSklopPrograma($printer, $sklopi, $tmpl, $naslov)
    {
        $this->zs = $this->getServiceLocator()->get('zapisi.service');

        foreach ($sklopi as $sklop) {
            $this->addDocumentReport($tmpl, $naslov, $sklop);
            // dodam zapise 
            $myzapisi = $zs->getZapiseZaLastnika($sklop->id);
            foreach ($myzapisi as $myzapis) {
                $this->addDocumentAttachment('zapisi', $naslov, $myzapis);
            }
            $printer->AddPage();
        }
    }

    public function checkData()
    {
        parent::checkData();
        $rep          = $this->em->getRepository('\ProgramDela\Entity\ProgramDela');
        $this->entity = $rep->find($this->data['id']);

        if (!$this->entity) {
            throw new MaxException('Program dela ne obstaja', 1000688);
        }
    }

}
